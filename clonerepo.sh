echo "Comment voulez vous nommer le dossier ou sera cloner le repository :"
read localFolder 
echo " "
repository="https://github.com/KeligMartin/4-SRC.git"

git clone "$repository" "$localFolder"
echo " "
echo "Le repository $repository à bien été clonné dans $localFolder"