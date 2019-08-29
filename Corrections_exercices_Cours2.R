##
# Gaëlle LELANDAIS <gaelle.lelandais@u-psud.fr>
##

#---------------------------------------------------------------------------
# Importation des données
#---------------------------------------------------------------------------

mitoData = read.table("Mito_Genes.txt", header = T, row.names = 1)

#---------------------------------------------------------------------------
# Exercice 1
#---------------------------------------------------------------------------

mitoData2 = mitoData[1:10,]
write.table(mitoData2, file = "Mito_10Genes.txt", quote = F)

#---------------------------------------------------------------------------
# Exercice 2
#---------------------------------------------------------------------------

mitoData[100,]
row.names(mitoData)[100]
colnames(mitoData)[which(mitoData[100,] > 7)]

mitoData[,10]
sum(mitoData[,10] > 7)

#---------------------------------------------------------------------------
# Exercice 3
#---------------------------------------------------------------------------

par(mfrow = c(1,2))
hist(mitoData[,1], breaks = seq(floor(min(mitoData[,1:2])), 
                                ceiling(max(mitoData[,1:2]))),
     main = "Time point #1", xlab = "Gene expression")
hist(mitoData[,2], breaks = seq(floor(min(mitoData[,1:2])), 
                                ceiling(max(mitoData[,1:2]))),
     main = "Time point #2", xlab = "Gene expression")

#---------------------------------------------------------------------------
# Exercice 4
#---------------------------------------------------------------------------

boxplot(mitoData)
boxplot(mitoData, col = rep(c("blue", "red"), ncol(mitoData)/2))

#---------------------------------------------------------------------------
# Exercice 5
#---------------------------------------------------------------------------

coxData = mitoData[grep("COX", row.names(mitoData)),]
write.table(coxData, file = "Mito_COXgenes.txt", 
            quote = F) 
