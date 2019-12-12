## melina.gallopin@u-psud.fr
## TP du 3 décembre 2019
## commande de nettoyage de l'environnement
rm(list=ls())

# deux niveaux de difficulté
# niveau avancé : question difficile, à ne pas traiter pour les débutants
# niveau débutant : question essentielle pour l'examen



####################################################################################
# Cours 1 : 
####################################################################################

# question 1 (niveau débutant)
# Créer un vecteur nommé "sel_var" contenant uniquement les chaines de caractères 
# "disease", "gender" et "bmi"
# commande utile : c()
sel_var=c("disease", "gender", "bmi")

# question 2 (niveau débutant)
# Créer un vecteur nommé "sel_ind" contenant uniquement les entiers pairs entre 1 et 20
# commande utile : seq()
sel_ind=seq(2,20,2)

# question 3 (niveau débutant)
# Créer un vecteur nommé "sel_ind_alea" contenant 10 entiers sélectionner aléatoirement 
# entre 1 et 10000
# commande utile : sample()
sel_ind_alea=sample(1:10000,10)


# question 4 (niveau débutant)
# Créer un vecteur de taille 100 contenant uniquement des 0 et des 1 tirés aléatoirement.
# Représenter graphiquement la proportion de 0 et de 1 
sample(0:1,100,replace=T)
plot(factor(sample(0:1,100,replace=T)))

# question 5 (niveau débutant)
# Afficher un vecteur composé de 10 valeurs tirées aléatoirement 
# sous une variable gaussienne de moyenne 0 et d'écart-type 1. 
# Représenter graphiquement ces données.
# commandes utiles : hist(), rnorm()
rnorm(10,0,1)
hist(rnorm(10,0,1),col="blue")

# question 6 (niveau débutant)
# Afficher un vecteur composé de 100 valeurs tirées aléatoirement 
# sous une variable gaussienne de moyenne 0 et d'écart-type 1. 
# Représenter graphiquement ces données.
rnorm(100,0,1)
hist(rnorm(100,0,1),col="blue")

# question 7 (niveau débutant)
# Afficher un vecteur composé de 1000 valeurs tirées aléatoirement 
# sous une variable gaussienne de moyenne 0 et d'écart-type 1. 
# Représenter graphiquement ces données.
rnorm(1000,0,1)
hist(rnorm(1000,0,1),col="blue")



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
sel_var <- c("submitter_id","disease","gender",
             "race","ethnicity","days_to_death",
             "tumor_stage","age_at_diagnosis",
             "weight","height","bmi","alcohol_history",
             "years_smoked","year_of_diagnosis","vital_status",
             "classification_of_tumor","cigarettes_per_day" ,"morphology")

## load package
library(TCGAbiolinks)

## get names of available  projects 
names_project <- TCGAbiolinks:::getGDCprojects()$project_id
## selection "TCGA" project names for all cancer 
names_project_TCGA <- names_project[grep("TCGA-",names_project)]

## choice of clinical variables
sel_var <- c("submitter_id","disease","gender",
             "race","ethnicity","days_to_death",
             "tumor_stage","age_at_diagnosis",
             "weight","height","bmi","alcohol_history",
             "years_smoked","year_of_diagnosis","vital_status",
             "classification_of_tumor","cigarettes_per_day" ,"morphology")
## NB : the number of clinical variables is not always the same for each type de cancer

## construct full table
full_table <- c()
for(nam in names_project_TCGA){
  clinical <- GDCquery_clinic(project = nam, type = "clinical")
  print(nam)
  print(paste0(c("nb obs :","nb var :"),dim(clinical)))
  full_table <- rbind(full_table,clinical[,sel_var])
}
## check dimension
colnames(clinical)
dim(full_table)
head(full_table)

## write table
#write.table(full_table,file="clinical_all_tcga.txt")



# question 10 (niveau débutant)
# Charger les données contenues dans le fichier clinical_all_tcga.txt 
# Stocker ces données dans un tableau "clinic".
# commande utile : read.csv2()
clinic <- read.csv2("clinical_all_tcga.txt",sep=" ",header=T)
head(clinic)

# question 11
# Quelle sont les dimensions du jeu de données chargé ? 
# Combien d'invidus et combien de variables comporte le jeu de données? 
# commande utile : dim()
dim(clinic)
head(clinic)

# question 12 (niveau débutant)
# Afficher le sous-tableau extrait du tableau "clinic" en selectionnant 
# uniquement les individus d'indices égaux aux indices stockés dans le 
# vecteur "sel_ind", et les colonnes stockées dans le vecteur "sel_var".
# Donner la dimension de ce tableau.
clinic[3,8]
clinic[c(1,7),c(3,9)]
clinic[sel_ind,sel_var]
dim(clinic[sel_ind,sel_var])

# question 13 (niveau débutant)
# Afficher le sous-tableau extrait du tableau "clinic" en selectionnant 
# uniquement les individus d'indices égaux aux indices stockés dans le 
# vecteur "sel_ind_alea", et les colonnes stockées dans le vecteur "sel_var"
clinic[sel_ind_alea,sel_var]

# question 14
# Combien de types de cancer sont répertoriés dans les données ? 
# Comnbien d'observations (individus) par type de cancer sont disponibles ? 
# commandes utiles : length(), table(), unique()
length(table(clinic$disease))
length(unique(clinic$disease))
comptage_par_cancer=table(clinic$disease)
plot(comptage_par_cancer)

# question 15
# Représenter l'âge à la date du diagnostic pour l'ensemble des patients
# commande utile : hist()
hist(clinic$age_at_diagnosis,col="blue")


# question 16
# En quelle unité de temps est exprimé l'âge au diagnostique ?
# commande utile : %/%
35000/365
25000/365
5000/365
5000%/%365

# question 17
# Donner le type de chaque variable contenue dans la table "clinic"
# commande utile : str()
str(clinic)


# question 18
# Représenter graphiquement la distribution de la variable "weight","height","bmi" et "cigarettes_per_day"
hist(clinic$weight)
clinic$weight2 <- as.numeric(clinic$weight)
hist(clinic$weight2)
clinic$weight3 <- as.numeric(as.character(clinic$weight))
hist(clinic$weight3,col="blue")
## NB: probleme si lors de la conversion d'un "facteur" en "numérique"
# exemple :
vect=c(7,18,2)
plot(vect)
data.class(vect)
vect_f=factor(vect)
plot(vect_f)
data.class(vect_f)
vect_f_n=as.numeric(vect_f)
vect_f_n # vect_f_n vaut 2 3 1 et non 7 18 2 !!!
plot(vect_f_n)
vect_f_c_n=as.numeric(as.character(vect_f))
vect_f_c_n # vect_f_n_c vaut bien 7 18 2 comme attendu

hist(clinic$height)
clinic$height2 <- as.numeric(clinic$height)
hist(clinic$height2)
clinic$height3 <- as.numeric(as.character(clinic$height))
hist(clinic$height3,col="blue")

hist(clinic$bmi)
clinic$bmi2 <- as.numeric(clinic$bmi)
hist(clinic$bmi2)
clinic$bmi3 <- as.numeric(as.character(clinic$bmi))
hist(clinic$bmi3,col="blue")
hist(clinic$bmi3,xlim=c(0,75),breaks = 100,col="blue")


hist(clinic$cigarettes_per_day)
clinic$cigarettes_per_day2 <- as.numeric(as.character(clinic$cigarettes_per_day))
hist(clinic$cigarettes_per_day2,breaks = 100,col="blue")


# question 19
# représenter graphiquement le lien entre la variable "weight" et la variable "bmi"
plot(clinic$weight3,clinic$bmi3)

# question 20
# représenter graphiquement le lien entre la variable "weight" et la variable "height"
plot(clinic$weight3,clinic$height3)

# question 21
# représenter graphiquement le lien entre la variable "weight" et la variable "tumor_stage"
boxplot(clinic$bmi3 ~ clinic$tumor_stage)
# NB : on ne "voit rien" sur ce premier graphique, car il y a des valeurs extrèmes...
# une solution pour mieux "voir" les données est de prendre le log d'un ou 2 variables
boxplot(log(clinic$bmi3) ~ clinic$tumor_stage)

# question 22
# représenter graphiquement le sexe ratio par type de cancer
plot(clinic$gender ~clinic$disease)


# question 23
# représenter graphiquement les proportions relatives de la variable "ethnicity" par type de cancer
plot(clinic$ethnicity ~clinic$disease)

# question 24
# représenter graphiquement l'année du diagnostic en fonction du type de cancer
plot(clinic$year_of_diagnosis ~clinic$disease)


# question 25
# représenter graphiquement le nombre de cigarettes consommées par jour en fonction de l'indice bmi 
plot(clinic$cigarettes_per_day2 ~clinic$bmi3)
plot(log(clinic$cigarettes_per_day2+1) ~log(clinic$bmi3+1))


# question 26
# Représeter graphiquement la valeur de l'indice "bmi" en fonction du sexe
plot(clinic$bmi3 ~clinic$gender)
plot(log(clinic$bmi3+1) ~clinic$gender)

# question 27
# Représenter graphiquement la distribution de l'âge au diagnostic en fonction du type de cancer. 
boxplot(as.numeric(clinic$age_at_diagnosis) ~as.factor(clinic$disease),col="blue")
aggregate(clinic$age_at_diagnosis )

####################################################################################
# Cours 3 : 
####################################################################################
# question 28 (niveau débutant)
# Compter le nombre d'observations (individus) sans données manquantes.
# commande utile : complete.cases()
complete.cases(clinic)
table(complete.cases(clinic))
clinic[complete.cases(clinic),]

# question 29
# Compter le nombre d'observations pour lesquelles les variables "bmi" et "cigarettes_per_day"
# ne sont pas des valeurs manquantes
soustable=clinic[,c("bmi","cigarettes_per_day")]
table(complete.cases(soustable))
table(complete.cases(clinic[,c("bmi","cigarettes_per_day")]))


# question 30
# Afficher le tableau des individus ayant une valeur de "bmi" supérieure à 70
clinic$bmi3>70
table(clinic$bmi3>70)
clinic[which(clinic$bmi3>70),]

monvect=1:10
monvect>5 
monvect<3
(monvect>5) | (monvect<3)
(monvect>5) & (monvect<3)
# question 31
# Compter le nombre d'individus ayant un indice "bmi" supérieur à 40 
# et fumant moins de 3 cigarettes par jour.
dim(clinic[which(clinic$bmi3>40 & clinic$cigarettes_per_day2<3) ,])

# question 32
# Donner la liste des cancers associés à un indice "bmi" supérieur à 40 
# et à plus de 3 cigarettes par jour.
clinic[which(clinic$bmi3>40 & clinic$cigarettes_per_day2>3) ,"disease"]

# question 33
# représenter graphiquement la taille chez les hommes, puis chez les femmes
par(mfrow=c(1,2))
hist(clinic$height3[clinic$gender=="male"],xlim=c(100,200),main="male")
hist(clinic$height3[clinic$gender=="female"],col="blue",xlim=c(100,200),main="female")

# question 34
# comparer la taille des hommes et des femmes
mean(clinic$height3[clinic$gender=="male"],na.rm=TRUE)
mean(clinic$height3[clinic$gender=="female"],na.rm=TRUE)
t.test(clinic$height3[clinic$gender=="male"],clinic$height3[clinic$gender=="female"])

# question 35 (niveau difficile) 
# Calculer la moyenne de l'âge au diagnostic en fonction du type de cancer. 
# Trouver le cancer ayant l'âge au diagnostic le plus bas / le plus élevé
# commande utile : aggregate
meanbycancer=aggregate(x = clinic$age_at_diagnosis[complete.cases(clinic$age_at_diagnosis)], by = list(clinic$disease[complete.cases(clinic$age_at_diagnosis)]), FUN = "mean")
meanbycancer
meanbycancer[which.min(meanbycancer$x),1]
meanbycancer[which.max(meanbycancer$x),1]

# question 36 (niveau difficile) 
# Représenter graphiquement la distribution de l'âge au diagnostic en fonction du type de cancer en
# ordonnant les cancers sur l'axe des abscisses en fonction de l'âge moyen de l'âge au diagnostique


