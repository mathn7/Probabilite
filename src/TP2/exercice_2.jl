""" script non fonctionnel (absence dans julia des fonctions huffmandict,..)"""



# Codage de Huffman de l'image initiale :
load exercice_1_TP1
frequences = histogramme/sum(histogramme)
dico = huffmandict[I_min:I_max,frequences]

# Calcul du coefficient de compression obtenu par le codage de Huffman :
coeff_compression_avant_decorrelation = coeff_compression_image[histogramme,dico]
@sprintf("Coefficient de compression avant decorrelation : %.4f\n",coeff_compression_avant_decorrelation)

# Codage de Huffman de l'image decorrelee :
load exercice_2_TP1
set(0,"RecursionLimit',550);	# Plus de 500 appels recursifs [nombre d"entiers a coder : 2*I_max+1 = 511 .> 500]
frequences = histogramme/sum(histogramme)
dico = huffmandict[I_min:I_max,frequences]

# Calcul du coefficient de compression obtenu par decorrelation prealable au codage de Huffman :
coeff_compression_apres_decorrelation = coeff_compression_image[histogramme,dico]
@sprintf("Coefficient de compression apres decorrelation : %.4f\n",coeff_compression_apres_decorrelation)

# Calcul du gain en compression :
@sprintf("Gain en compression : %.4f\n",coeff_compression_apres_decorrelation/coeff_compression_avant_decorrelation)
