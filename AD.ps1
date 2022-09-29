<<<<<<< HEAD
﻿# Import du module AD
Import-Module ActiveDirectory

# Message d'information
Write-Host "Bienvenue sur ce script de gestion d'Active Directory"
Write-warning "Il faut avoir des privilièges administrateurs pour la bonne exécution `n"
Start-sleep -Seconds 1

Write-Host "╔═════════════════════════════════════╗"
Write-Host "║                                     ║"
Write-Host "║      Création d'un utilisateur      ║"
Write-Host "║                                     ║"
Write-Host "╚═════════════════════════════════════╝ `n"

# Mise en forme du Prénom
try{
    [string]$UtilisateurPrénom = Read-Host "Prénom : "
    [string]$UtilisateurFirstname = $UtiisateurPrénom.substring(0, 1).ToUpper() + $UtilisateurPrénom.substring(1).ToLower()
}catch{
    Write-Error "Problème avec le prénom."
    Write-Error $Error[0]
}

# Mise en forme du Nom
try{
    [string]$UtilisateurNom = Read-Host "Nom : "
    [string]$UtilisateurLastname = $UtilisateurNom.ToUpper()
}catch{
    Write-Error "Problème avec le Nom."
    Write-Error $Error[0]
}
    
# Mise en forme du Mot de passe
try{
    [string]$UtilisateurMdp = Read-Host "Mot de passe (Il faut minimun 8 caractères : un chiffre, une majuscule, une minuscule et un caractère spécial) : "
    [securestring]$UtilisateurMdpchiffre = ConvertTo-SecureString -String $UtilisateurMdp -AsPlainText -Force
}catch{
    Write-Error "Problème avec le mot de passe."
    Write-Error $Error[0]   
}


# Mise en forme du Login et Mail
try{
    [string]$UtilisateurLogin = $UtilisateurPrénom.substring(0, 1).ToLower() + $UtilisateurNom.ToLower()
    [string]$UtilisateurExt = Read-Host "Suffix UPN du domaine : "
    [string]$UtilisateurMail = "$UtilisateurLogin@$UtilisateurExt"
}catch{
    Write-Error "Problème avec le suffix UPN."
    Write-Error $Error[0]  
}

# Demande de la fonction
try{
    [string]$UtilisateurFonction = Read-Host "Fonction de $UtilisateurPrénom $UtilisateurNom : "
    
}catch{
    Write-Error "Problème avec la fonction de l'utilisateur."
    Write-Error $Error[0]  
}

# Demande du numéro de téléphone
try{
    [string]$UtilisateurMobile = Read-Host "Numéro de téléphone portable : "
}catch{
    Write-Error "Problème avec le numéro de téléphone."
    Write-Error $Error[0]  
}


# Définition de l'emplacement de l'utilisateur
try{
    [string]$DomainTLD = Read-Host "Entrer votre TLD (sans le . [.fr -> fr]): "
    [string]$DomainName = Read-Host "Entrer votre nom de domaine (sans le TDL [myges.fr -> myges]): "
    [string]$UtilisateurLocation = Read-Host "OU=Users,DC=$DomainName,DC=$DomainTLD"
}catch{
    Write-Error "Problème avec le numéro de téléphone."
    Write-Error $Error[0] 
}

# Création d'utilisateur
try{
    New-ADUser -Name "$UtilisateurFirstname $UtilisateurLastname" `
        -GivenName $UtilisateurFirstname `
        -Surname $UtilisateurLastname `
        -DisplayName "$UtilisateurFirstname $UtilisateurLastname" `
        -EmailAddress $UtilisateurMail `
        -Title $UtilisateurFonction `
        -Description $UtilisateurFonction `
        -MobilePhone $UtilisateurMobile `
        -UserPrincipalName "$UtilisateurMail" `
        -SamAccountName "$UtilisateurLogin" `
        -Path "$UtilisateurLocation" `
        -AccountPassword $UtilisateurMdpchiffre `
        -OtherAttributes @{"ProxyAddresses" = "SMTP:$UtilisateurMail"; } `
        -Enabled $true
    Write-Host "Création de l'utilisateur : $UtilisateurFirstname $UtilisateurLastname"
}catch{
    Write-Error "Problème avec la création de l'utilisateur."
    Write-Error $Error[0] 
}
=======
﻿
>>>>>>> features2
