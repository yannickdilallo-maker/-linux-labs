# Mini-projet : Docker Site

## Description
Petit projet Docker qui sert une page HTML personnalisée via Nginx dans un conteneur.

## Contenu
- `index.html` : page web affichée
- `Dockerfile` : définit l'image Docker basée sur `nginx:alpine`

## Usage

### 1. Construire l'image
```bash
docker build -t monsite:1.0 .
