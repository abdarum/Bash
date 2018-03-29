function wyswietl_menu
{
   echo "Skrypt zamienia slowa Podane jako pierwsze na slowo wybrane na drugie"
   echo "Skladnia:"
   echo " ./zmien_nazwe.sh (tekst_pierwotny | ?) tekst_po_zmianie  [ folder | opcja ] "
   echo " Opcje:"
   echo "   -a - zmien nazwy w podfolderach o nazwach inc i src"
   echo "   -m - zmienia nazwy w pliku makefile"
   echo "   -f - zmien nazwy pliku .cpp i .hh"
   echo "   ?  - wyswietl menu"
   echo ""
}

function nazwa_pliku
{
    mv src/$1.cpp src/$2.cpp
    mv inc/$1.hh  inc/$2.hh
}
#sed -i "s/_prostokat/_bryla/g" inc/*


if [ "$1" = "?" ] ||  [ "$1" = "" ]
then
    wyswietl_menu
elif [ "$2" = "" ]
then
    echo Blad skladni. Aby wyswietlic menu wywolaj skrypt z argumentem ?
fi

if [ "$3" = "" ]
then
    sed -i "s/"$1"/"$2"/g" *
elif [ "$3" = "-a" ] ||  [ "$4" = "-a" ] ||  [ "$5" = "-a" ]
then
    sed -i "s/"$1"/"$2"/g" inc/*
    sed -i "s/"$1"/"$2"/g" src/*
fi

if [ "$3" = "-m" ] ||  [ "$4" = "-m" ]  ||  [ "$5" = "-m" ]
then
    sed -i "s/$1/$2/g" Makefile
fi
    
if [ "$3" = "-f" ] || [ "$4" = "-f" ] || [ "$5" = "-f" ]
then
    nazwa_pliku $1 $2
fi

if [ "$3" != "-a" ] && [ "$3" != "-m" ] && [ "$3" != "-f" ] && [ "$3" != "" ]
then
    sed -i "s/$1/$2/g" $3
fi

    

