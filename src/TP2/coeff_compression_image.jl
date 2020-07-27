function coeff_compression_image(histogramme,dico)

# Calcul du nombre de bits de l'image initiale sans compression :
nb_pixels = sum(histogramme)
nb_bits_sans_compression = 8*nb_pixels

# Pour chaque entier dico(j,1), le code binaire dico(j,2) a pour longueur length(dico(j,2)) :
nb_bits_codage_Huffman = 0
for j = 1:length(histogramme)    
	nb_bits_codage_Huffman = nb_bits_codage_Huffman+histogramme[j]*length(dico(j,2))
end

# Calcul du coefficient de compression obtenu par le codage de Huffman :
coeff_compression = nb_bits_sans_compression/nb_bits_codage_Huffman
return coeff_compression
end
