using Plots
using Images

pyplot()
pause(text) = (print(stdout, text); read(stdin, 1); nothing)

# Parametres :
#set(0,'RecursionLimit',1000)				# Pour eviter les erreurs a l'execution
alpha = pi/8						# Seuil sur l'orientation du gradient (en radians)
cos_alpha = cos(alpha)
seuil_norme = 2/sin(alpha)				# Seuil sur la norme du gradient (decoule d'une etude theorique)

# Lecture de l'image :
I = load("src/TP3/Images/Piree.png")
# I = load("src/TP3/Images/chaises.png")
# I = load("src/TP3/Images/Morlaix.png")
if size(I,3)==3
	I = Gray.(I[:,:,1])
end
#I = imresize(I,0.8)					# Permet de limiter l'effet de crenelage
nb_lignes,nb_colonnes = size(I)

# Parametres :
diagonale = floor(sqrt(nb_lignes^2+nb_colonnes^2))
card_max = floor(diagonale/2)				# Cardinal max d'un ensemble E
card_min = floor(card_max/20)				# Cardinal min d'un ensemble E

# Affichage de l'image :
plt = Plots.plot(layout=(2,1),title="Ensembles candidat")
Plots.plt!(plt[1],I,label="L'image")

# Gradient du niveau de gris (x vers la droite, y vers le bas) :
I = double(I)
[G_x,G_y] = gradient(I)
G_norme = sqrt(G_x.^2+G_y.^2)

# Selection des pixels de contour :
contour = G_norme>seuil_norme

# Pas de pixel de contour sur le bord de l'image (traitement simplifie !) :
contour([1,nb_lignes],:) = 0
contour(:,[1,nb_colonnes]) = 0

# Affichage d'une petite fleche sur les pixels de contour :
[i,j] = find(contour)
quiver(j,i,G_x(contour),G_y(contour),'r')		# Attention : x = j et y = i
axis equal
title('Pixels de contour','FontSize',30)
drawnow

# Boucle de traitement des pixels de contour :
voisins = [ -1 -1 , -1 0 , -1 1 , 0 1 ,1 1 , 1 0 , 1 -1 , 0 -1 ]		# Positions relatives des 8 plus proches voisins
liste_E = []
while any(contour(:))

	# Pixel de contour dont la norme du gradient est la plus elevee = "germe" :
	indices_contour = find(contour)
	[~,indice_max] = max(G_norme(indices_contour))
	indice_germe = indices_contour(indice_max)
	[i_germe,j_germe] = ind2sub(size(I),indice_germe)
	E = [i_germe,j_germe]
	G_somme = [G_x(i_germe,j_germe),G_y(i_germe,j_germe)]

	# Construction recursive de l'ensemble E :
	[E,contour] = recursion(E,contour,G_somme,i_germe,j_germe,voisins,G_x,G_y,card_max,cos_alpha)

	# Ajout de l'ensemble E a la liste d'ensembles E, si son cardinal est superieur a card_min :
	if size(E,1)>=card_min
		liste_E = [liste_E,{E}]		# Concatenation d'une cellule {E} a liste_E
	end
end

# Affichage des ensembles E (la fonction label2rgb donne a chaque ensemble E une couleur differente) :
etiquette = zeros(size(I))
for k = 1:length(liste_E)
	E = liste_E{k}
	indices_E = sub2ind(size(I),E(:,1),E(:,2))
	etiquette(ind2sub(size(I),indices_E)) = k
end
I_resultat = label2rgb(etiquette,'parula',[0.5,0.5,0.5])
subplot(1,2,2)
imagesc(I_resultat)
axis equal
axis off
title('Ensembles candidats','FontSize',30)

save exercice_1
