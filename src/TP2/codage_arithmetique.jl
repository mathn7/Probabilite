function codage_arithmetique(texte,selection_alphabet,bornes)

borne_inf = 0
borne_sup = 1
for i = 1:length(texte)
	j = findall(selection_alphabet[:]==texte[i])
	if length(j)>0 
		j = j[1]
		largeur = borne_sup-borne_inf
		borne_sup = borne_inf+largeur*bornes[2,j]
		borne_inf = borne_inf+largeur*bornes[1,j]
	end
end
return borne_inf,borne_sup
end
