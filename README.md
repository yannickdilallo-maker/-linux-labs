# Linux Labs – Portfolio DevOps

Ce dépôt regroupe mes labs de reconversion DevOps (Linux, Git, Docker, automatisation…).

## 🚀 Projets
- **Backup script (Bash)** → [projects/backup-script](projects/backup-script)  
- **Site Nginx Dockerisé** → [projects/docker-site](projects/docker-site)

## 📚 Notes
- [Linux cheat sheet](docs/linux-cheatsheet.md)
- [Git cheat sheet](docs/git-cheatsheet.md)
- [Cron cheat sheet](docs/cron-cheatsheet.md)
- [Docker cheat sheet](docs/docker-cheatsheet.md)

## ▶️ Démarrer un projet
Exemple pour le site Dockerisé :
```bash
git clone git@github.com:<TON_USER>/linux-labs.git
cd linux-labs/projects/docker-site
docker build -t monsite:1.0 .
docker run -d -p 8080:80 --name web monsite:1.0
