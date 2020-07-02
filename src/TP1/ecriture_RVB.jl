function ecriture_RVB(image_originale)

    image_RVB = zeros(Int(nb_lignes/2),Int(nb_colonnes/2),3);

    #" Ecriture des canaux rouge, vert et bleu de image_RVB : "
    Ir = image_originale[1:2:nb_lignes-1, 2:2:nb_colonnes];
    Ib =image_originale[2:2:nb_lignes, 1:2:nb_colonnes-1];
    Iv = image_originale[1:2:nb_lignes-1, 2:2:nb_colonnes]+image_originale[2:2:nb_lignes, 1:2:nb_colonnes-1]/.2;

    # "Affichage de l'image RVB convertie en entiers non signes :"
    image_RVB[:,:,1]=Ir;
    image_RVB[:,:,2]=Iv;
    image_RVB[:,:,3]=Ib;

    return image_RVB
end
