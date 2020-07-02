using PyPlot
using Printf
using Statistics
#using TestImages , ImageMagick #à décommenter pour utiliser des images disponibles dans ImageMagic

include("vectorisation.jl")
include("calcul_parametres.jl")

#nettoyer l'environnement
clf() #à commenter si vous n'utilisez pas Atom

#" Lecture de l'image automn et conversion en doubles"
I_max = 255;
I_min = 0;
Im = load("src/TP1/automn.tiff");
Im  = Real.(convert(Array{Gray{Float64},2},Im));

#Im = testimage("mandrill") #à décommenter pour utiliser une image interne à Julia

#" Affichage de l'image :"
ImageView.imshow(Im)

#"Affichage de l'histogramme de l'image :"
title("Histogramme")
xlabel("X")
ylabel("Y")
histogramme = PyPlot.plt.hist(Im[:],10);

# Calcul de vecteurs contenant les niveaux de gris de gauche (de droite) d'une paire de pixels
(I_gauche,I_droite) = vectorisation(Im);

#" Affichage des paires de niveaux de gris sous la forme dun nuage de points :"

figure("Affichage des paires de niveaux de gris sous la forme dun nuage de points",figsize=(30,30));
PyPlot.scatter(I_gauche,I_droite);

title(" Affichage des paires de niveaux de gris sous la forme dun nuage de points ")
xlabel("Niveau de gris du pixel de gauche")
ylabel("Niveau de gris du pixel de droite")


# Calcul des parametres de la droite de regression :
(r,a,b) = calcul_parametres(I_gauche,I_droite);
@printf("Coefficient de correlation lineaire : %.4f\n",r);


#" Affichage de la droite de regression (d'equation y = a*x+b) :"
x = [i for i in I_min:I_max];
y = a*x .+ b;
PyPlot.scatter(x,y);

gcf() #à commenter si vous n'utilisez pas Atom
