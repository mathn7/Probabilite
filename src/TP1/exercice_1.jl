using Plots
using Printf
using Statistics
#using ImageView
using Images
#using TestImages , ImageMagick #à décommenter pour utiliser des images disponibles dans ImageMagic

#utilisation du background pyplot
pyplot()
pause(text) = (print(stdout, text); read(stdin, 1); nothing)


include("vectorisation.jl")
include("calcul_parametres.jl")

#" Lecture de l'image automn et conversion en doubles"
I_max = 255;
I_min = 0;
Im = load("src/TP1/automn.tiff");
Im  = Real.(convert(Array{Gray{Float64},2},Im));

#Im = testimage("mandrill") #à décommenter pour utiliser une image interne à Julia

#" Affichage de l'image :"
#ImageView.imshow(Im)
im = RGB.(Im)
plt = Plots.plot(im);
display(plt)
pause("tapez Entrée pour continuer \n")


#"Affichage de l'histogramme de l'image :"
histogramme = Plots.histogram([I_min:I_max],Im[:])
plt = Plots.plot(histogramme,title="Histogramme",xlabel="X",ylabel="Y");
display(plt)
pause("tapez Entrée pour continuer \n")

# Calcul de vecteurs contenant les niveaux de gris de gauche (de droite) d'une paire de pixels
(I_gauche,I_droite) = vectorisation(Im);

#" Affichage des paires de niveaux de gris sous la forme dun nuage de points :"

plt = Plots.scatter(I_gauche,I_droite,title=" Affichage des paires de niveaux de gris sous la forme dun nuage de points ",xlabel="Niveau de gris du pixel de gauche",ylabel="Niveau de gris du pixel de droite");
display(plt)
pause("tapez Entrée pour continuer \n")


# Calcul des parametres de la droite de regression :
(r,a,b) = calcul_parametres(I_gauche,I_droite);
@printf("Coefficient de correlation lineaire : %.4f\n",r);


#" Affichage de la droite de regression (d'equation y = a*x+b) :"
x = [i for i in I_min:I_max];
y = a*x .+ b;
plt = Plots.plot(x,y,color =:red);
display(plt)

