
#" Lecture d'une image interne a Matlab et conversion en doubles :"
I_max = 255;
I_min = 0;
I = testimage("mandrill")
I_gray = Gray.(I)
I_gray_float=convert(Array{Gray{Float64},2},I)
I= Real.(I_gray_float).*100;

#" Affichage de l'image :"
ImageView.imshow(I)


#"Affichage de l'histogramme de l'image :"
title("Histogramme")
xlabel("X")
ylabel("Y")
histogramme = PyPlot.plt[:hist](I[:],100);



nb_lignes,nb_colonnes=size(I);
#" Vecteurs contenant les niveaux de gris de gauche (de droite) d'une paire de pixels :"
 I_gauche = I[:,1:nb_lignes-1];
 I_gauche = I_gauche[:];			# Vectorisation de la matrice I_gauche
 I_droite = I[:,2:nb_colonnes];
 I_droite = I_droite[:];			# Vectorisation de la matrice I_droite


 #" Affichage des paires de niveaux de gris sous la forme dun nuage de points :"

  figure("Affichage des paires de niveaux de gris sous la forme dun nuage de points",figsize=(30,30));
  PyPlot.scatter(I_gauche,I_droite);

  title(" Affichage des paires de niveaux de gris sous la forme dun nuage de points ")
  xlabel("Niveau de gris du pixel de gauche")
  ylabel("Niveau de gris du pixel de droite")



   #" Calcul des parametres de la droite de regression : "

    x_bar = mean(I_gauche);
    var_x= mean(I_gauche.^2)-mean(I_gauche)^2;
    sig_x=(var_x)^(1/2);
    y_bar = mean(I_droite);
    var_y = mean(I_droite.^2)-mean(I_droite)^2;
    sig_y=(var_y)^(1/2);
    sig_xy=mean(I_gauche.*I_droite)-(x_bar)*(y_bar);
    a=sig_xy./var_x;
    b=-a*x_bar+y_bar;

   #" Affichage de la droite de regression (d'equation y = a*x+b) :"
    y = a*x+b;
    x = [i for i=I_min:I_max];
    PyPlot.scatter(x,y);
