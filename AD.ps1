# Import du module AD
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

try {
    # Mise en forme du Prénom
    [string]$UtilisateurPrénom = Read-Host "Prénom : "
    [string]$UtilisateurFirstname = $UtiisateurPrénom.substring(0, 1).ToUpper() + $UtilisateurPrénom.substring(1).ToLower()

    # Mise en forme du Nom
    [string]$UtilisateurNom = Read-Host "Nom : "
    [string]$UtilisateurLastname = $UtilisateurNom.ToUpper()
    
    # Mise en forme du Mot de passe
    [string]$UtilisateurMdp = Read-Host "Mot de passe (Il faut minimun 8 caractères : un chiffre, une majuscule, une minuscule et un caractère spécial) : "
    [securestring]$UtilisateurMdpchiffre = ConvertTo-SecureString -String $UtilisateurMdp -AsPlainText -Force

    # Mise en forme du Login et Mail
    [string]$UtilisateurLogin = $UtilisateurPrénom.substring(0, 1).ToLower() + $UtilisateurNom.ToLower()
    [string]$UtilisateurExt = Read-Host "Suffix UPN du domaine : "
    [string]$UtilisateurMail = "$UtilisateurLogin@$UtilisateurExt"

    # Information Complémentaire
    [string]$UtilisateurFonction = Read-Host "Fonction de $UtilisateurPrénom $UtilisateurNom : "
    [string]$UtilisateurMobile = Read-Host "Numero de telephone portable : "

    # Définition de l'emplacement de l'utilisateur
    [string]$DomainTLD = Read-Host "Entrer votre TLD (sans le . [.fr -> fr]): "
    [string]$DomainName = Read-Host "Entrer votre nom de domaine (sans le TDL [myges.fr -> myges]): "
    [string]$UtilisateurLocation = Read-Host "OU=Users,DC=$DomainName,DC=$DomainTLD"

        # Création d'utilisateur
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
}catch {
    Write-Error $Error[0]
}