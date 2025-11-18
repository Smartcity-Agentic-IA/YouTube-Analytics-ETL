# 🎬 YouTube Analytics ETL Pipeline

![Python](https://img.shields.io/badge/Python-3.9+-blue.svg)
![Docker](https://img.shields.io/badge/Docker-Ready-brightgreen.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

Un pipeline ETL complet pour **extraire, transformer et analyser les données YouTube**, permettant aux créateurs, agences et analystes d’avoir une vue complète et historique des performances des chaînes et vidéos.

---

## 📋 Table des Matières

- [Fonctionnalités](#fonctionnalités)  
- [Architecture](#architecture)  
- [Prérequis](#prérequis)  
- [Installation](#installation)  
- [Configuration](#configuration)  
- [Utilisation](#utilisation)  
- [Structure du Projet](#structure-du-projet)  
- [Métriques Calculées](#métriques-calculées)  
- [Auteur](#auteur)  

---

## ✨ Fonctionnalités

### 📥 Extraction
- Données vidéos : titre, vues, likes, durée, tags  
- Statistiques des chaînes : abonnés, vues totales  
- Commentaires avec analyse de sentiment  
- Tendances par catégorie  

### 🔄 Transformation
- Nettoyage et validation des données  
- Calcul de 20+ métriques clés (engagement rate, view velocity…)  
- Détection d’anomalies et alertes automatiques  
- Enrichissement avec analyse de sentiment des commentaires  

### 💾 Chargement (Loading)
- Data Lake + Data Warehouse avec **Snowflake**  
- Historisation complète (SCD Type 2)  
- Tables prêtes pour analytics et BI  

### 📊 Analytics & BI
- Dashboards interactifs (Metabase)  
- Analyse de tendances et performance vidéo  
- Comparaison concurrentielle entre chaînes  
- Prédictions de performance et recommandations  

---

## 🏗️ Architecture

**Pipeline Medallion Architecture :**

```
YouTube API → Extraction → Transformation → Snowflake → Dashboards
       ↓             ↓                 ↓
   Raw Data       Cleaned Data      Star Schema
   (Bronze)       (Silver)          (Gold)
```

- **Bronze** : Données brutes (JSON/VARIANT), historisation complète  
- **Silver** : Nettoyées et enrichies, KPIs calculés, anomalies détectées  
- **Gold** : Tables fact/dim optimisées pour BI, jointures avec CRM/Web Analytics  

---

## 🔧 Prérequis

- Python 3.9+  
- Docker & Docker Compose  
- YouTube Data API Key (gratuite)  
- Snowflake account (Free Tier possible)  
- Minimum 4GB RAM  

---

## 🚀 Installation

### 1️⃣ Cloner le repository
```bash
git clone https://github.com/chadia08/youtube-analytics-etl.git
cd youtube-analytics-etl
```

### 2️⃣ Créer un environnement virtuel
```bash
python -m venv venv

# Mac/Linux
source venv/bin/activate

# Windows
venv\Scripts\activate
```

### 3️⃣ Installer les dépendances
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

### 4️⃣ Configurer les variables d’environnement
```bash
cp .env.example .env
nano .env   # Ajouter votre clé API YouTube et Snowflake credentials
```

### 5️⃣ Démarrer l’infrastructure Docker
```bash
docker-compose up -d
```
**Services démarrés :**  
- Airflow (port 8080)  
- Metabase (port 3001)  

---

## ⚙️ Configuration

### Chaînes à analyser
```yaml
# config/youtube_channels.yaml
channels:
  - channel_id: "UCCezIgC97PvUuR4_gbFUs5g"
    name: "Fireship"
    category: "Tech"

  - channel_id: "UC8butISFwT-Wl7EV0hUK0BQ"
    name: "freeCodeCamp"
    category: "Education"
```

---

## 🎯 Utilisation

### Exécution manuelle
```bash
# Extraction uniquement
python src/extraction/video_extractor.py

# Pipeline complet
python scripts/run_etl.sh
```

### Avec Airflow (recommandé)
- Accéder à Airflow : http://localhost:8080  
- Login : `admin / admin`  
- Activer le DAG `youtube_daily_etl`  

### Visualisation des dashboards
- Accéder à Metabase : http://localhost:3001  
- Configurer la connexion Snowflake/PostgreSQL :  
  ```
  Account: <votre_account_snowflake>
  User: <votre_user>
  Password: <votre_password>
  Warehouse: <votre_warehouse>
  Database: youtube_analytics
  Schema: public
  ```

---

## 📁 Structure du Projet
```
youtube-analytics-etl/
├── src/
│   ├── extraction/       # Extraction depuis YouTube API
│   ├── transformation/   # Nettoyage & enrichissement
│   ├── loading/          # Chargement Snowflake
│   ├── quality/          # Validation Great Expectations
│   └── utils/            # Scripts utilitaires
├── airflow/
│   └── dags/             # DAGs Airflow
├── data/
│   ├── raw/              # Données brutes (Bronze)
│   ├── processed/        # Données transformées (Silver)
│   └── warehouse/        # Données Gold (fact/dim)
├── dashboards/           # Dashboards Metabase/Superset
├── notebooks/            # Notebooks Jupyter
└── tests/                # Tests unitaires
```






