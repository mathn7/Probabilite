function vectorisation(I)

  X = I[:,1:end-1];
  X = X[:];			# Vectorisation de la matrice X
  Y = I[:,2:end];
  Y = Y[:];			# Vectorisation de la matrice Y

  return X,Y
end
