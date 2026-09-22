# 🚀 Escape Game Spatial - Station Alpha

[![Language](https://shields.io)](https://wikipedia.org)
[![License: MIT](https://shields.io)](https://opensource.org)

Un jeu d'énigmes et de réflexion textuel codé en **script Batch**, jouable dans l'invite de commandes Windows pour s'échapper de la station avant l'explosion.

> 🛠️ **Credits:** Projet développé en collaboration avec l'IA de Google.

---

## 🧩 Les Énigmes / The Puzzles

* 🗄️ **Fouille du bureau :** Trouvez badge et indices.
* 💻 **Piratage du Terminal :** Code d'accès basé sur l'année de la station.
* ⚡ **Bypass Système :** Coupez les verrous.
* 🔢 **Calcul Final :** Code d'évacuation final.

---

## 🕹️ Comment jouer ? / How to play?

1. Téléchargez ou créez un fichier `escape.bat`.
2. Lancez-le pour survivre aux énigmes.

---

## 🛠️ Aperçu du Code

Exemple de validation conditionnelle dans le script :

```batch
if "%code_final%"=="10" (
    goto victoire
) else (
    echo [ALERTE] Mauvais code !
    pause
    goto hub
)
```

---

## 📜 License
Projet sous licence MIT.
