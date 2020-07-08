using LinearAlgebra
"""
Fonction recursive permettant de construire un ensemble candidat E
"""
function recursion(E,contour,G_somme,i,j,voisins,G_x,G_y,card_max,cos_alpha)	

	contour(i,j) = 0
	G_somme_normalise = G_somme / norm(G_somme)
	nb_voisins = size(voisins,1)
	k = 1
	while k <= nb_voisins & size(E, 1) <= card_max
		i_voisin = i + voisins(k, 1)
		j_voisin = j + voisins(k, 2)
		if contour(i_voisin, j_voisin)
			G_voisin = [G_x(i_voisin,j_voisin), G_y(i_voisin, j_voisin)]
			if G_somme_normalise * (G_voisin / norm(G_voisin))' > cos_alpha
				E = [E ; i_voisin j_voisin]
				G_somme = G_somme+G_voisin
				[E, contour, G_somme] = recursion(E, contour, G_somme, i_voisin, j_voisin, voisins, G_x, G_y, card_max, cos_alpha)
			end
		end
	end
	k = k + 1
	return [E, contour, G_somme]
end
