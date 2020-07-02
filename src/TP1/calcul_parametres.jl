function calcul_parametres(X,Y)

    moyenne_abscisses = mean(X);
    moyenne_ordonnees = mean(Y);
    variance_abscisses = mean(X.^2)-moyenne_abscisses^2;
    variance_ordonnees = mean(Y.^2)-moyenne_ordonnees^2;
    covariance = mean(X.*Y)-moyenne_abscisses*moyenne_ordonnees;
    r = covariance/sqrt(variance_abscisses*variance_ordonnees);
    a = covariance/variance_abscisses;
    b = moyenne_ordonnees-a*moyenne_abscisses;

    return r,a,b
end
