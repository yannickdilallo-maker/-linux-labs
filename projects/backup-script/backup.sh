#!/bin/bash
# Usage: ./backup.sh <source_dir> [--exclude pattern1,pattern2,...]
# Ex:   ./backup.sh /home/devops/labs --exclude node_modules,*.tmp

set -euo pipefail

log_file="$HOME/backups/backup.log"
timestamp() { date +"%Y-%m-%d %H:%M:%S"; }
say() { echo "[$(timestamp)] $*" | tee -a "$log_file"; }

# --------- Arguments ---------
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <source_dir> [--exclude pattern1,pattern2,...]"
  exit 1
fi

source_dir="$1"
shift || true

exclude_arg=()
if [[ "${1:-}" == "--exclude" ]]; then
  shift
  IFS=',' read -ra patterns <<< "${1:-}"
  for p in "${patterns[@]}"; do
    exclude_arg+=( "--exclude=$p" )
  done
  shift || true
fi

# --------- Contrôles ---------
if [[ ! -d "$source_dir" ]]; then
  echo "Erreur: le dossier source '$source_dir' n'existe pas."
  exit 2
fi

mkdir -p "$HOME/backups"

base="$(basename "$source_dir")"
stamp="$(date +"%Y%m%d-%H%M%S")"
archive="$HOME/backups/${base}-${stamp}.tar.gz"

# --------- Exécution ---------
say "Début backup: source='$source_dir' -> archive='$(basename "$archive")'"

parent="$(dirname "$source_dir")"
cd "$parent"

# shellcheck disable=SC2068
tar -czf "$archive" ${exclude_arg[@]:-} "$base"

if tar -tzf "$archive" > /dev/null 2>&1; then
  say "Succès: archive OK -> $archive"
else
  say "Échec: archive corrompue -> $archive"
  exit 3
fi

# Option: supprimer backups >30 jours
# find "$HOME/backups" -type f -name "*.tar.gz" -mtime +30 -delete && \
#   say "Nettoyage: vieux backups >30j supprimés."

say "Backup terminé."


