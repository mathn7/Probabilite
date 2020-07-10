
function tri(selection_frequences)

    frequences_triees = sort(selection_frequences,rev=true)
    indices_frequences_triees = zeros(length(frequences_triees))
    for i in 1:length(frequences_triees)
          if (i == 1) || (  frequences_triees[i] != frequences_triees[i-1])
               global Z = findall(x->x==frequences_triees[i], frequences)
                indices_frequences_triees = [indices_frequences_triees; Z]
          end
    end

    return frequences_triees, indices_frequences_triees
end


    #=
    for i in frequences_triees

        Z = searchsorted(frequences_triees, i)
        println(Z)
        indices_frequences_triees[1:length(Z)] = Z
        Z = findall(x->x==i, selection_frequences)




        return reverse(frequences_triees), reverse(indices_frequences_triees)
    end

end
=#


#frequences_triees = sort(selection_frequences,rev=true)
#frequences = [4, 8, 2, 5, 4]
#frequences_triees = [8, 6, 5, 4, 2]
