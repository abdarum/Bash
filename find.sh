function wyswietl_menu {
    echo "Program wyszukuje tekstu we wskazanym folderze"
    echo "Skladnia:"
    echo " ./find.sh ("tekst" | "?") [ "folder" ] "
    echo " Opcje:"
    echo "  -a - znajdz w podfolderach o nazwach inc i src"
    echo "  ?  - wyswietl menu"
    echo
}

if [ "$1" = "?" ] ||  [ "$1" = "" ]
then
    wyswietl_menu
fi



if [ "$1" != "?" ] &&  [ "$1" != "" ]
then
    ~/emacs_temp_rm.sh -r
    if [ "$2" = "-a" ]
    then
	grep -rnw inc -e "$1"
	grep -rnw src -e "$1"
	
    elif [ "$2" = "" ]
    then
	grep -rnw  -e "$1"
	
    else
	grep -rnw "$2" -e "$1"
    fi
fi
