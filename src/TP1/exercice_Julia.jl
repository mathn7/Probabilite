using ImageView
using Images

include("ecriture_RVB.jl")
# Lecture et affichage de l'image originale
image_originale = load("src/TP1/image_originale.png");
(nb_lignes,nb_colonnes) = size(image_originale);
ImageView.imshow(image_originale)

# Ecriture de image_RVB
image_RVB = ecriture_RVB(image_originale);

# Affichage de l'image RVB convertie en entiers non signes
ImageView.imshow(image_RVB)
print("")
