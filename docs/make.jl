using Documenter
using Probabilite

makedocs(
    modules = [Probabilite],
    sitename = "Probabilite.jl",
    strict=true,
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md",            
            "Sujet TP1" => "Sujet_TP1.md",
	    "Sujet TP2" => "Sujet_TP2.md",
	    "Sujet TP3" => "Sujet_TP3.md",	
            ]
    )

deploydocs(
    repo   = "github.com/mathn7/Probabilite.git"
    branch = "gh-pages",  
    devbranch = "master",
)
