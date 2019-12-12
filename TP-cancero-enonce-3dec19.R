## melina.gallopin@u-psud.fr
## TP du 3 décembre 2019
# deux niveaux de difficulté
# niveau avancé : question difficile, à ne pas traiter pour les débutants
# niveau débutant : question essentielle pour l'examen



####################################################################################
# Cours 1 : 
####################################################################################

# question 1 (niveau débutant)
# Créer un vecteur nommé "sel_var" contenant uniquement les chaines de caractères 
# "disease", "gender" et "alcohol_intensity"
# commande utile : c()
sel_var=c("A","b","c")


# question 2 (niveau débutant)
# Créer un vecteur nommé "sel_ind" contenant uniquement les entiers pairs entre 1 et 20
# commande utile : seq()

# question 3 (niveau débutant)
# Créer un vecteur nommé "sel_ind_alea" contenant 10 entiers sélectionner aléatoirement 
# entre 1 et 10000
# commande utile : sample()


# question 4 (niveau débutant)
# Créer un vecteur de taille 100 contenant uniquement des 0 et des 1 tirés aléatoirement.
# Représenter graphiquement la proportion de 0 et de 1 

# question 5 (niveau débutant)
# Afficher un vecteur composé de 10 valeurs tirées aléatoirement 
# sous une variable gaussienne de moyenne 0 et d'écart-type 1. 
# Représenter graphiquement ces données.
# commandes utiles : hist(), rnorm()

# question 6 (niveau débutant)
# Afficher un vecteur composé de 100 valeurs tirées aléatoirement 
# sous une variable gaussienne de moyenne 0 et d'écart-type 1. 
# Représenter graphiquement ces données.

# question 7 (niveau débutant)
# Afficher un vecteur composé de 1000 valeurs tirées aléatoirement 
# sous une variable gaussienne de moyenne 0 et d'écart-type 1. 
# Représenter graphiquement ces données.



####################################################################################
# Cours 2 : 
####################################################################################


# question 8 (niveau débutant)
# A l’aide du logiciel Excel (ou équivalent Open Office), créer un tableau de 5 colonnes 
# et 6 lignes. Donner des noms aux colonnes (ex : « colonne 1 », « colonne 2 », …, « colonne 5 ») 
# et aux lignes (ex : « ligne 1 », « ligne 2 », …, « ligne 6 »). 
# Remplir les cases du tableau comme vous le souhaitez.
# Sauvegarder ce tableau sous la forme d’un fichier texte (ou fichier CSV), 
# en utilisant des tabulations comme caractères de séparation. 
# Importer le fichier texte obtenu sous R, en conservant 
# les noms des colonnes et les noms des lignes.

# question 9 (niveau avancé) 
# En utilisant le package TCGAbiolinks disponible sur bioconductor, 
# télécharger les données cliniques disponibles pour l'ensemble des patients
# (tout cancer confondu) pour les variables suivantes "submitter_id","disease",
# "gender", "race","ethnicity","days_to_death","tumor_stage","age_at_diagnosis",
# "weight","hieght","bmi","alcohol_history","years_smoked","year_of_diagnosis",
# "classification_of_tumor","cigarettes_per_day" et "morphology" 


# question 10
# Charger les données contenues dans le fichier clinical_all_tcga.txt 
# Stocker ces données dans un tableau "clinic".
# commande utile : read.csv2()

# question 11
# Quelle sont les dimensions du jeu de données chargé ? 
# Combien d'invidus et combien de variables comporte le jeu de données? 
# commande utile : dim()

# question 12 (niveau débutant)
# Afficher un   sous-tableau extrait du tableau "clinic" en selectionnant 
# uniquement les individus d'indices égaux aux indices stockés dans le 
# vecteur "sel_ind", et les colonnes stockées dans le vecteur "sel_var".
# Donner la dimension de ce tableau.

# question 13 (niveau débutant)
# Afficher le sous-tableau extrait du tableau "clinic" en selectionnant 
# uniquement les individus d'indices égaux aux indices stockés dans le 
# vecteur "sel_ind_alea", et les colonnes stockées dans le vecteur "sel_var"

# question 14
# Combien de types de cancer sont répertoriés dans les données ? 
# Comnbien d'observations (individus) par type de cancer sont disponibles ? 
# commandes utiles : length(), table(), unique()

# question 15
# Représenter l'âge à la date du diagnostic pour l'ensemble des patients
# commande utile : hist()

# question 16
# En quelle unité de temps est exprimé l'âge au diagnostique ?
# commande utile : %/%

# question 17
# Donner le type de chaque variable contenue dans la table "clinic"
# commande utile : str()

# question 18
# Représenter graphiquement la distribution de la variable "weight","height","bmi" et "cigarettes_per_day"

# question 19
# représenter graphiquement le lien entre la variable "weight" et la variable "bmi"

# question 20
# représenter graphiquement le lien entre la variable "weight" et la variable "height"

# question 21
# représenter graphiquement le lien entre la variable "weight" et la variable "tumor_stage"

# question 22
# représenter graphiquement le sexe ratio par type de cancer

# question 23
# représenter graphiquement les proportions relatives de la variable "ethnicity" par type de cancer

# question 24
# représenter graphiquement l'année du diagnostic en fonction du type de cancer

# question 25
# représenter graphiquement le nombre de cigarettes consommées par jour en fonction de l'indice bmi 

# question 26
# Représeter graphiquement la valeur de l'indice "bmi" en fonction du sexe

# question 27
# Représenter graphiquement la distribution de l'âge au diagnostic en fonction du type de cancer. 


####################################################################################
# Cours 3 : 
####################################################################################
# question 28
# Compter le nombre d'observations (individus) sans données manquantes.
# commande utile : complete.cases()

# question 29
# Compter le nombre d'observations pour lesquelles les variables "bmi" et "cigarettes_per_day"
# ne sont pas des valeurs manquantes

# question 30
# Afficher le tableau des individus ayant une valeur de "bmi" supérieure à 70

# question 31
# Compter le nombre d'individus ayant un indice "bmi" supérieur à 40 
# et fumant moins de 3 cigarettes par jour.

# question 32
# Donner la liste des cancers associés à un indice "bmi" supérieur à 40 
# et à plus de 3 cigarettes par jour.

# question 33
# représenter graphiquement la taille chez les hommes, puis chez les femmes

# question 34
# comparer la taille des hommes et des femmes

# question 35 (niveau difficile) 
# Calculer la moyenne de l'âge au diagnostic en fonction du type de cancer. 
# Trouver le cancer ayant l'âge au diagnostic le plus bas / le plus élevé
# commande utile : aggregate

# question 36 (niveau difficile) 
# Représenter graphiquement la distribution de l'âge au diagnostic en fonction du type de cancer en
# ordonnant les cancers sur l'axe des abscisses en fonction de l'âge moyen de l'âge au diagnostique


