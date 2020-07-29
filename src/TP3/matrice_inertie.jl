"""
Matrice d'inertie du nuage de points
"""
function matrice_inertie(E_x,E_y,G_norme_E)

    # Centre d'inertie C = (C_x,C_y) du nuage de points :
    poids = G_norme_E / sum(G_norme_E)
    C_x = sum(poids .* E_x)
    C_y = sum(poids .* E_y)

    # Centrage des donnees :
    E_x_centre = E_x .- C_x
    E_y_centre = E_y .- C_y

    # Matrice d'inertie du nuage de points :
    M_11 = sum(poids.*E_x_centre.^2)
    M_12 = sum(poids.*E_x_centre.*E_y_centre)
    M_22 = sum(poids.*E_y_centre.^2)
    M = [M_11 M_12 ; M_12 M_22]

    return C_x,C_y,M

end
