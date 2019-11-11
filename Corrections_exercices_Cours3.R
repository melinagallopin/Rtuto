##
# Leslie REGAD <leslie.regad@univ-paris-diderot.fr>
# Gaëlle LELANDAIS <gaelle.lelandais@u-psud.fr>
# This content is licensed under CC BY 4.0
##

#---------------------------------------------------------------------------
# Exercice 1
#---------------------------------------------------------------------------

sumCumul = 0

for(i in 1:10){
    print(i)
    sumCumul = sumCumul + i
}

# affichage de la somme cumulée
print(sumCumul)

#---------------------------------------------------------------------------
# Exercice 2
#---------------------------------------------------------------------------

vecAlea = rnorm(100, mean = 4, sd = 5)
# indices des valeurs > 3
print(which(vecAlea > 3))

vecSup3 = vecAlea[which(vecAlea > 3)]
valSomme = sum(vecSup3)

if(valSomme > 40){
    print("la somme est > 40")
}else if(valSomme > 30){
    print("la somme est > 30")
}else if(valSomme > 20){
    print("la somme est > 20")
}else{
    print("la somme est < 20")
}

#---------------------------------------------------------------------------
# Exercice 3
#---------------------------------------------------------------------------

somme = function(x, y){
    return(x + y)
}

# test de la fonction
somme(x = 18, y = 35)

#---------------------------------------------------------------------------
# Exercice 4
#---------------------------------------------------------------------------

calculTarif = function(age){
    if(age < 12){
        print("tarif reduit")
    }else if(age > 60){
        print("tarif senior")
    }else{
        print("plein tarif")
    }
# fin de la fonction
}

# tests de la fonction
for(i in c(5, 65, 85, 41, 23, 47)){
    calculTarif(age = i)
}

#---------------------------------------------------------------------------
# Exercice 5
#---------------------------------------------------------------------------

compteNucleo = function(sequence){
    # liste des lettres à dénombrer
    listeLettres = c("A", "U", "C", "G")
    
    # pour identifier la lettre la plus fréquente
    valMax = 0
    lettreMax = NULL

    for(i in listeLettres){
        nbreLettre = sum(sequence == i)
        if(nbreLettre > valMax){
            valMax = nbreLettre
            lettreMax = i
        }else{
        }
    }

    print(paste("Lettre max", lettreMax, "- Nbre occurence", valMax))

# fin de la fonction
}

seq1 = sample(c("A", "U", "C", "G"), 50, replace = T)
seq2 = sample(c("A", "U", "C", "G"), 60, replace = T)
seq3 = sample(c("A", "U", "C", "G"), 79, replace = T)

# tests de la fonction
compteNucleo(seq1)
compteNucleo(seq2)
compteNucleo(seq3)
