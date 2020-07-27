function partitionnement(selection_frequences)

taille_alphabet = length(selection_frequences)
bornes = zeros(2,taille_alphabet)
for i = 1:taille_alphabet-1
	bornes[2,i] = bornes[1,i]+selection_frequences[i]
	bornes[1,i+1] = bornes[2,i]
end
bornes[2,taille_alphabet] = 1
return bornes
end
