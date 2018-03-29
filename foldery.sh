# Skrypt tworzy folder o nazwie podanej przez uzytkownika.
#  Tworzy tez 4 podfoldery.
#  folder.sh nazwa_pliku [ -r | -w | -n ]
#    -r - usun folder z podfolderami
#    -a - utworz wszystkie podfoldery
#    -i - utworz wazne podfoldery


function stworz_wszystkie_podfoldery {
    mkdir $1/Lab
    mkdir $1/Old_version
    mkdir $1/Przygotowanie
    mkdir $1/Wyklad_materialy
}

function stworz_wazne_podfoldery {
    mkdir $1/Lab
    mkdir $1/Przygotowanie
}

if [ "$1" == "" ]
then
    echo "Skrypt sluzy do tworzenia folderu z podfolderami."
    echo "  Sklacnia skryptu:"
    echo "    folder.sh nazwa_pliku [ -r | -w | -n ]"
    echo "      -r - usun folder z podfolderami"
    echo "      -a - utworz wszystkie podfoldery"
    echo "      -i - utworz wazne podfoldery"
fi

if [ "$2" != "-r" ] && [ "$1" != "" ]
then
    mkdir $1
fi


if [ "$2" == "-a" ] || [ "$2" == "-i" ] ||  [ "$2" == "-r" ]
then
    
    
    if [ "$2" == "-a" ]
    then
	# przekazanie parametru do funkcji ($1)
 	stworz_wszystkie_podfoldery $1
    fi
    
    if [ "$2" == "-i" ]
    then
	stworz_wazne_podfoldery $1
    fi
    
    if [ "$2" == "-r" ]
    then
	rm -rf $1	
    fi
    
fi
