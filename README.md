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

