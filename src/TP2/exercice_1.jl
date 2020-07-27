include("exercice_Matlab.jl")
using Printf

# Encodage du texte :
alphabet_cell = num2cell(selection_alphabet);			# Format "cell" requis par la fonction huffmandict
dico = huffmandict[alphabet_cell,selection_frequences];		# dico(j,2) = code binaire du caractere ASCII dico(j,1)
texte_encode = huffmanenco[texte,dico]
@sprintf("Codage binaire du texte : %s\n",strrep(num2str(texte_encode),' ',""))

# Calcul du coefficient de compression obtenu par le codage de Huffman :
coeff_compression = coeff_compression_texte[texte,texte_encode]
@sprintf("Coefficient de compression : %.4f\n",coeff_compression)

# Decodage du texte : 
texte_decode = huffmandeco[texte_encode,dico]

# Verification de l'integrite du texte decode :
integrite_decodage = ~strcmp(texte,texte_decode)
if integrite_decodage
	@sprintf("Integrite du decodage OK\n")
else()
	@sprintf("Probleme d''integrite du decodage !\n")
end
