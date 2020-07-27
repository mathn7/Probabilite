include("calcul_frequences.jl")
frequences = calcul_frequences("aabc",['a';'b';'c']);
resultat = (frequences==[0.5;0.25;0.25])
if resultat!=1
	print("Il y a un probleme !\n")
else()
	print("La fonction calcul_frequences est correcte !\n")
end
