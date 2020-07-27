function coeff_compression_texte(texte,texte_encode)

nb_bits_sans_compression = 8*length(texte);			# 8 bits par caractere
nb_bits_codage_Huffman = length(texte_encode);			# texte_encode est binaire	
coeff_compression = nb_bits_sans_compression/nb_bits_codage_Huffman
return coeff_compression
end
