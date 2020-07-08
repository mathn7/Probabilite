using Images
using Plots
using LaTeXStrings
#taille_ecran = get(0,"ScreenSize")
#L = taille_ecran(3)
#H = taille_ecran(4)
#
## Affichage d"images aleatoires contenant au moins un carre noir :
#figure("Name","Images binaires aleatoires","Position",[0.3*L,0,0.7*L,H])

# fonction pour attendre une touche avant de continuer
wait_for_key(text) = (print(stdout, text); read(stdin, 1); nothing)

numero_image = 1
T = 64
p = 0.5
liste_valeurs_t = 2:5
plt = Plots.plot(layout=(2,2),showaxis = false)
for t = liste_valeurs_t

	# Tirage d'images aleatoires tant qu'aucun carre noir n'a ete detecte :
	aucun_carre_noir_detecte = true
	cpt_tirages = 0
	indices_carres_noirs = 0
	I = zeros(T,T)
	while aucun_carre_noir_detecte
		# Tirage aleatoire d"une image :
		I = rand(T,T)
		I = I .> p
		# Detection des carres de cote t entierement noirs :
		J = zeros(T-t+1,T-t+1,t*t)
		for i = 1:t
			for j = 1:t
				k = (i-1)*t+j
				J[:,:,k] = I[i:end - t + i, j:end - t + j]
			end
		end
		somme = sum(J,dims=3) 
		indices_carres_noirs = findall(somme .== 0)
		if size(indices_carres_noirs)[1] > 0
			aucun_carre_noir_detecte = false
		end
		cpt_tirages = cpt_tirages + 1
	end

	# Affichage de l"image :
	
	# set(gca,"FontSize",20)
	nb_carres = length(indices_carres_noirs)

	if nb_carres==1
		titre = "Il y a 1 carre noir "*string(t)*(L"\mathrm{\times}")*string(t)*" : le voyez-vous ?"
	else
		titre = "Il y a "*string(nb_carres)*" carres noirs "*string(t)*(L"\mathrm{\times}")*string(t)*" : les voyez-vous ?"
	end
	Plots.plot!(plt[indexin(t,liste_valeurs_t)[1]],Gray.(I),title=titre)
	display(plt)
	wait_for_key("Tapez Entree pour surligner les carres noirs")		

	# Surlignage des carres de cote t entierement noirs :
	#for k = 1:length(indices_carres_noirs)
	#	l = indices_carres_noirs[k]
	#	x = ceil(l/(T-t+1)) - 0.5
	#	y = mod(l-1,T-t+1)+1-0.5
	#	Plots.plot!([x,x], [y,y+t], color=:red, lw=:2)
	#	Plots.plot!([x+t,x+t], [y,y+t], color=:red, lw=:2)
	#	Plots.plot!([x,x+t], [y,y], color=:red, lw=:2)
	#	Plots.plot!([x,x+t], [y+t,y+t], color=:red, lw=:2)
	#end
	if t < liste_valeurs_t[end]
		wait_for_key("Tapez Entree pour afficher une nouvelle image")		
	end
	#numero_image = numero_image + 1
end