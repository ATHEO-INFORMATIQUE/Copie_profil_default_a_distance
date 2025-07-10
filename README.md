# 🖥️ Script PowerShell – Copie de Profil Utilisateur par Défaut via Interface Graphique

## 🎯 Objectif

Ce script PowerShell permet de **copier un profil utilisateur par défaut** (contenu du dossier `default`) vers un autre poste distant, en utilisant une **interface graphique simple**. Il est conçu pour être utilisé dans des environnements où les postes clients suivent une convention de nommage standard (ex. : `W10-NOM`, `W11-NOM`).

---

## 🧰 Fonctionnalités

- Interface graphique Windows Forms pour saisir le nom du poste cible.
- Vérification du format du nom du PC (ex. : `W10-XXXX`, `W11-XXXX`).
- Vérification que le script est exécuté avec les droits administrateur.
- Copie récursive du dossier `default` vers `\\<NomPC>\c$\Users`.
- Affichage de messages de succès ou d’erreur à l’utilisateur.

---

## 🛠️ Prérequis

- PowerShell 5.1 ou supérieur.
- Droits administrateur sur le poste local.
- Accès réseau et autorisations suffisantes pour écrire dans `\\<NomPC>\c$\Users`.
- Le dossier `default` doit se trouver **dans le même répertoire que le script**.

---

## 🧾 Structure attendue

```
Répertoire_du_script\
├── default\
│   └── (contenu à copier)
└── Copie_profil_par_default.ps1
└── Copie_profil_par_default.bat
```

---

## 🧩 Personnalisation

Tu peux adapter les éléments suivants :

| Élément | Description | Exemple |
|--------|-------------|---------|
| `$sourcePath` | Dossier source à copier | `$PSScriptRoot\default` |
| `$destinationPath` | Chemin de destination sur le poste distant | `\\$pcName\c$\Users` |
| Regex de validation | Pour adapter à d'autres conventions de nommage | `^(W10-|W11-)[A-Z0-9]+$` |

---

## ▶️ Utilisation

1. Lancer le script PowerShell avec les droits administrateur.
2. Entrer le nom du poste distant dans le champ prévu.
3. Cliquer sur **Copier**.
4. Le script effectue la copie et affiche un message de confirmation ou d’erreur.

---

## 👨‍💻 Auteur

 Théo COUTARD

---
