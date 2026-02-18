# 🏠 Conception et Analyse d'une Base de Données Immobilières (PostgreSQL)

## 📝 Présentation
Ce projet consiste à concevoir une base de données relationnelle normalisée (3NF) pour centraliser et analyser les transactions foncières en France. La mission couvre l'intégralité du cycle de la donnée : du nettoyage automatisé (ETL) à la modélisation conceptuelle, jusqu'à l'extraction d'insights via des requêtes SQL avancées.

## 🛠 Environnement Technique
* **ETL & Data Cleaning :** Python 3 (Pandas, Numpy)
* **Modélisation :** SQL Power Architect (UML / Conceptuel)
* **Base de Données :** PostgreSQL v16
* **Analyse :** SQL (Requêtes complexes, agrégations, jointures multiples)

---

## 📑 Structure du Dépôt et Documentation

### 1. Données Brutes
Contient les sources Excel initiales (Communes, Référentiel Géo, Valeurs Foncières) avant traitement.

### 2. Dictionnaire des Données
Inventaire détaillé des entités, types de données et règles de gestion.
👉 [Dictionnaire des données (xlxs)](./2_dictionnaire/dictionnaire_de_donnees_022026.pdf)

### 3. Notebooks (ETL & Préparation)
Cœur technique du traitement Python. Ce dossier contient le pipeline qui transforme les fichiers bruts en données structurées.
* **Pipeline** : Nettoyage, typage, gestion des doublons et anonymisation RGPD.
* **Extraction** : Le sous-dossier `Export_données` contient les fichiers CSV propres.
👉 [Cahier de Nettoyage (PDF)](./3_notebooks/code_pandas.pdf) | [Source du fichier (.ipynb)](./3_notebooks/extraction_donnees.ipynb)

### 4. Modélisation
Conception de l'architecture de la base de données.
* **Schéma UML** : Visualisation des cardinalités et de la structure 3NF.
👉 [Schéma UML (PDF)](./4_modelisation/schema_UML.pdf)

### 5. Script SQL (Base de Données)
Tout le nécessaire pour reconstruire l'environnement d'analyse.
* **Scripts** : Code SQL pour la création des tables et des contraintes.
* **Dossier data_a_importer** : Contient les 5 fichiers CSV finaux pour alimenter directement les tables.
👉 [Script de création SQL](./5_script_SQL/script_creation_bdd.sql)

### 6. Interrogation base de données SQL (Analyses Métier)
Liste de 20 requêtes répondant aux besoins stratégiques (Top 20 des communes, prix moyen au m², volume de ventes par région).
👉 [Consulter les requêtes SQL](./6_interrogation_bdd/interrogation_bdd.pdf)

### 7. Rapport Final
Synthèse de la méthodologie et conclusions de l'étude.
👉 [Support de présentation (PDF)](./7_rapport_final/support_presentation_022026.pdf)

---

## 🔐 Focus : Conformité & Qualité
* **RGPD** : Anonymisation stricte des données personnelles par suppression des noms des acquéreurs.
* **Intégrité Référentielle** : Vérification via Python de la cohérence des liens (clés étrangères) et détection des orphelins avant l'injection en base.
* **Normalisation** : Structure en 3ème Forme Normale (3NF) pour supprimer la redondance et garantir la performance des requêtes.

## 🚀 Comment utiliser ce projet ?
1. Clonez le dépôt.
2. Exécutez le script SQL présent dans `5_Script_sql` sur votre serveur PostgreSQL.
3. Importez les fichiers présents dans `5_Script_sql/data_a_importer` dans leurs tables respectives.
4. Testez les analyses avec les requêtes du dossier `6_requêtes_SQL`.
