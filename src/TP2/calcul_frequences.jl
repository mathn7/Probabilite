function calcul_frequences(texte,alphabet)

    frequences = zeros(length(alphabet))
    for i = 1:length(alphabet)
        #frequences[i] = sum(texte==alphabet[i]);	# Nombre d'occurrences de alphabet[i]
        for j in eachindex(texte)
            if texte[j] == alphabet[i]
                frequences[i] = frequences[i] + 1
            end
        end
    end
    return frequences = frequences./length(texte);			# Frequences relatives

end
