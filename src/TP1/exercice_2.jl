using PyPlot
using Printf
using Statistics
#using TestImages , ImageMagick #à décommenter pour utiliser des images disponibles dans ImageMagic

include("vectorisation.jl")
include("calcul_parametres.jl")


#" Lecture de l'image automn et conversion en doubles"
I_max = 255;
I_min = -I_max;
Im = load("src/TP1/automn.tiff");
Im  = Real.(convert(Array{Gray{Float64},2},Im));

#Im = testimage("mandrill") #à décommenter pour utiliser une image interne à Julia

# Calcul de l'image decorrelee :
I_decorrelee = Im
I_decorrelee[:,2:end] = Im[:,2:end]-Im[:,1:end-1]

#" Affichage de l'image decorrelee :"
ImageView.imshow(I_decorrelee)

#"Affichage de l'histogramme de l'image decorrelee :"
title("Histogramme")
xlabel("X")
ylabel("Y")
histogramme = PyPlot.plt.hist(I_decorrelee[:],10);

# Calcul de vecteurs contenant les niveaux de gris de gauche (de droite) d'une paire de pixels
(I_gauche,I_droite) = vectorisation(I_decorrelee);

#" Affichage des paires de niveaux de gris sous la forme dun nuage de points :"

figure("Affichage des paires de niveaux de gris sous la forme dun nuage de points",figsize=(30,30));
PyPlot.scatter(I_gauche,I_droite);

title(" Affichage des paires de niveaux de gris sous la forme dun nuage de points ")
xlabel("Niveau de gris du pixel de gauche")
ylabel("Niveau de gris du pixel de droite")


# Calcul des parametres de la droite de regression :
r,a,b = calcul_parametres(I_gauche,I_droite);
@printf("Coefficient de correlation lineaire : %.4f\n",r);


#" Affichage de la droite de regression (d'equation y = a*x+b) :"
x = [i for i in I_min:I_max];
y = a*x .+ b;
PyPlot.scatter(x,y);

