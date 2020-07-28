"""
Calcul de probabilite (loi binomiale)
"""
function calcul_proba(E_nouveau_repere,p)

    # Largeur du rectangle englobant :
    E_nouveau_repere_x = E_nouveau_repere[:,1]
    x_min = minimum(E_nouveau_repere_x)
    x_max = maximum(E_nouveau_repere_x)
    largeur = x_max-x_min;

    # Hauteur du rectangle englobant :
    E_nouveau_repere_y = E_nouveau_repere[:,2]
    y_min = minimum(E_nouveau_repere_y)
    y_max = maximum(E_nouveau_repere_y)
    hauteur = y_max-y_min;

    # Nombre de pixels contenus dans le rectangle englobant :
    N = round(largeur * hauteur)
    n = size(E_nouveau_repere,1)

    # Calcul de probabilite (loi binomiale) :
    probabilite = 1 - Distributions.binompvec(N,p)[n-1] #à vérifier si ca donne les mêmes résultats qu'avec Matlab binocdf(n-1,N,p)

    return x_min,x_max,probabilite

end
