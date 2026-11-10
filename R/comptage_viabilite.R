# =============================================
# Script R : Comptage cellulaire
# =============================================

# =======================
# PARAMÈTRES À MODIFIER
# =======================

# Volumes (mL)
950->volume_cellules  # volume de l'échantillon
50->volume_bleu  # volume de bleu trypan ajouté

# Comptages par ligne (vecteurs de 10 valeurs)
cellules_vivantes<-c(98, 105, 101, 110, 95, 103, 107, 99, 104, 102)  # cellules vivantes
cellules_mortes<-c( 12, 9, 11, 10, 14, 8, 13, 9, 10, 11) # cellules mortes

# Nombre de cellules à ensemencer dans la culture
nb_cellules_total<-concentration*20
# =============================================
# CALCULS AUTOMATIQUES
# =============================================

# 1) Dilution
(volume_cellules + volume_bleu)/volume_cellules->coef_dilution

# 2) Moyennes et viabilité
moy_vivantes<-mean(cellules_vivantes)
moy_mortes<-mean(cellules_mortes)
viability<-(moy_vivantes/(moy_vivantes+moy_mortes))*100

# 3) Nombre de cellules vivantes par mL
concentration<-moy_vivantes*coef_dilution*10^4

# 4) Calcul du volume à prélever pour x cellules
volume_ensemencement<-250000/concentration

# =============================================
# RESULTATS
# =============================================

# Affichage viabilité
cat("Viabilité (%) :", round(viability ,2), "\n")

# Affichage concentration originale
cat("Concentration originale (cellules/mL) :", round(concentration<-moy_vivantes*coef_dilution*10^4 ), "\n")

# Affichage du volume
cat("Volume à prélever pour", cell_cible, "cellules :", round(volume_ensemencement<-250000/concentration*1000,2), "µL\n")

