
function selection(frequences,alphabet)

    indices_frequences_non_nulles = findall(x -> x>0, frequences)
    selection_frequences = frequences[indices_frequences_non_nulles]
    selection_alphabet = alphabet[indices_frequences_non_nulles]
    return selection_frequences, selection_alphabet
end
