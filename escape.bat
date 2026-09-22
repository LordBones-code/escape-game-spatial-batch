@echo off
title Escape Game Spatial - Laboratoire Alpha
color 0B
cls

:menu
cls
echo ===================================================
echo             ESCAPE GAME : STATION ALPHA
echo ===================================================
echo.
echo  1. Commencer l'extraction
echo  2. Quitter la station
echo.
echo ===================================================
set /p choix="Votre choix (1-2) : "

if "%choix%"=="1" goto start_game
if "%choix%"=="2" exit
goto menu

:start_game
:: Initialisation des variables de quete
set "has_badge=0"
set "pc_unlocked=0"
set "cooldown_disabled=0"
set "temps_restant=5"
goto intro

:intro
cls
echo ===================================================
echo                 ALARME SYSTEME
echo ===================================================
echo Les gyrophares rouges tournent au plafond. L'ordinateur 
echo de bord repete en boucle : "Explosion du reacteur 
echo imminente. Confinement active."
echo.
echo Vous etes bloque dans la salle de controle principale.
echo La grande porte blinde est verrouillee par un code secret.
echo.
pause
goto hub

:hub
cls
echo ===================================================
echo             SALLE DE CONTROLE PRINCIPALE
echo ===================================================
echo Le temps presse. Que voulez-vous inspecter ?
echo.
echo 1. Le bureau du Chercheur Principal
echo 2. Le terminal informatique central
echo 3. Le boitier d'alimentation du reacteur
echo 4. Tenter d'ouvrir la Porte Blindee (Sortie)
echo.
set /p choix="Votre choix (1-4) : "

if "%choix%"=="1" goto bureau
if "%choix%"=="2" goto terminal
if "%choix%"=="3" goto reacteur
if "%choix%"=="4" goto porte_sortie
goto hub

:bureau
cls
echo ===================================================
echo            LE BUREAU DU CHERCHEUR
echo ===================================================
if "%has_badge%"=="1" (
    echo Le bureau est sans dessus dessous. Vous y avez deja recupere 
    echo le Badge Magnetique du chercheur.
) else (
    echo Des papiers brules jonchent le sol. Sur une tasse a cafe
    echo renversee, vous remarquez une note manuscrite :
    echo "Le mot de passe du PC est l'annee de creation de la station."
    echo Un peu plus loin, sous un tas de dossiers secrets...
    echo.
    echo [!] Vous trouvez le BADGE MAGNETIQUE ACCES NIVEAU 2 !
    set "has_badge=1"
)
echo.
echo 1. Revenir au centre de la piece
echo.
set /p choix="Action : "
if "%choix%"=="1" goto hub
goto bureau

:terminal
cls
echo ===================================================
echo              TERMINAL INFORMATIQUE
echo ===================================================
if "%cooldown_disabled%"=="1" (
    echo L'ecran affiche : "Protocole ENTRAIDE active. Bon voyage."
    echo Le systeme est totalement deverrouille.
    echo.
    pause
    goto hub
)
if "%pc_unlocked%"=="1" goto pc_menu

echo L'ecran demande un code de securite a 4 chiffres.
echo.
set /p code_pc="Entrez le code (4 chiffres) : "

:: La reponse attendue est 2026 (l'annee actuelle !)
if "%code_pc%"=="2026" (
    set "pc_unlocked=1"
    echo.
    echo [OK] Acces accorde au systeme central !
    pause
    goto pc_menu
) else (
    echo.
    echo [ERREUR] Code incorrect. Le systeme de defense s'active !
    echo Une decharge electrique vous frappe.
    echo.
    pause
    goto hub
)

:pc_menu
cls
echo ===================================================
echo               MENU SYSTEME CORE
echo ===================================================
echo Fichiers cryptes disponibles :
echo.
echo 1. Lire le Journal de bord du Capitaine
echo 2. Desactiver la securite de la Porte Blindee
echo 3. Se deconnecter du PC
echo.
set /p choix="Choix PC : "

if "%choix%"=="1" (
    cls
    echo ===================================================
    echo               JOURNAL DE BORD
    echo ===================================================
    echo "04 Mai - L'IA est devenue instable. Elle refuse de nous 
    echo laisser sortir. Pour bloquer la porte de secours, j'ai 
    echo configure le code de sortie. C'est simple, c'est le nombre 
    echo de secondes qu'il reste avant l'explosion multiplie par 2."
    echo.
    pause
    goto pc_menu
)
if "%choix%"=="2" (
    if "%has_badge%"=="1" (
        set "cooldown_disabled=1"
        echo.
        echo [OK] Badge detecte. Securite de la Porte : BYPASSED.
        echo Le verrouillage magnetique de la sortie est desactive !
        echo.
    ) else (
        echo.
        echo [ECHEC] Autorisation insuffisante. Badge Niveau 2 requis.
        echo.
    )
    pause
    goto pc_menu
)
if "%choix%"=="3" goto hub
goto pc_menu

:reacteur
cls
echo ===================================================
echo             BOITIER DU REACTEUR
echo ===================================================
echo Le compteur numerique affiche le temps restant avant la surchauffe.
echo.
echo ALERT : Le reacteur explosera dans EXACTEMENT %temps_restant% minutes !
echo.
echo 1. Revenir au centre de la piece
echo.
set /p choix="Action : "
if "%choix%"=="1" goto hub
goto reacteur

:porte_sortie
cls
echo ===================================================
echo                PORTE BLINDEE
echo ===================================================
if "%cooldown_disabled%"=="0" (
    echo La porte refuse de bouger. L'ecran de contrôle indique :
    echo "Verrouillage magnetique actif via le Terminal Central."
    echo.
    echo 1. Faire demi-tour
    echo.
    set /p choix="Action : "
    if "%choix%"=="1" goto hub
    goto porte_sortie
)

echo Le verrouillage est coupe, mais le digicode final fait obstacle.
echo Un clavier lumineux attend une combinaison numerique.
echo *Indice du journal : (Temps restant sur le reacteur x 2)*
echo.
set /p code_final="Entrez le code de deverrouillage final : "

:: Calcule la reponse (5 minutes restantes x 2 = 10)
if "%code_final%"=="10" (
    goto victoire
) else (
    echo.
    echo [ALERTE] Mauvais code ! La porte reste close.
    pause
    goto hub
)

:victoire
cls
echo ===================================================
echo                EVACUATION REUSSIE !
echo ===================================================
echo.
echo Le panneau de commande vire au vert. La porte blindee s'ouvre
echo dans un sifflement pneumatique. Vous vous glissez a l'interieur
echo de la capsule de sauvetage juste avant que la station n'explose !
echo.
echo Felicitations, vous avez resolu les enigmes de la Station Alpha !
echo.
pause
goto menu
