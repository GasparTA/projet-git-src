#Demande à lutilisateur de saisir le nom du dossier pour cloner le repository dans celui-ci
echo "Comment voulez vous nommer le dossier où sera cloner le repository :"
read localFolder 
echo " "

#Chemin du repository
repository="https://github.com/KeligMartin/4-SRC.git"

#Clone avec valeur de la variable repository vers la valeur de la variable localFolder
git clone "$repository" "$localFolder"
echo " "
echo "Le repository $repository a bien été cloné dans $localFolder"