# wypisz wszystkie foldery i podfoldery
folder=`ls -R | grep : | tr ':' '/'`
# policz liczbe slow(liczbe folderow)
counter=`echo "$folder" | wc -w`

#tmp="`echo $folder | cut -d ' ' -f 1`"

# wyswietl pierwszy argument wywolania
#echo "$1"

# Arumenty wywolania skryptu:
#  -r lub -R  - stosuj usuwanie plikow tmp rowniez z podfolderow
#  -l - wyswietl pozostale pliki - nie moze wystepowac sama
#  -d - tylko wyswietl pliki tymczasowe(bez usuwania)
#  mozliwe uzycia: -r,-R,-rl,-lr,-Rl,-lR,-d

#echo "$folder `echo "$folder" | wc -w`"
#echo $counter

# funkcja usuwania plikow tymczasowych
function usun {
rm $tmp*~    2> /dev/null
rm $tmp\#*#  2> /dev/null
}

while [ $counter -gt 0 ]
do
    # tmp=pierwsza nazwa
    tmp="`echo $folder | cut -d ' ' -f 1`"
    # pozostawia wszystkie wyrazy oprocz pierwszego
    folder="`echo $folder | cut -d ' ' -f 2-`"
  
  # wlasciwa czesc programu
    
    # tylko wyswietl pliki tymczasowe
    if [ "$1" == "-d" ]
    then
	ls $tmp*~ 2> /dev/null
	ls $tmp\#*# 2> /dev/null
    fi
    
    # tylko usun pliki tymczasowe
    if [ "$1" == "-R" ] ||  [ "$1" == "-r" ] 
    then
	usun
    fi

    # usun i wyswietl pozostale pliki
    if  [ "$1" == "-rl" ] ||  [ "$1" == "-lr" ] ||  [ "$1" == "-Rl" ] ||  [ "$1" == "-lR" ]
    then
	usun
	if [ $counter == 1 ]  
	then	    
	    echo Pozostale plki to:
	    ls -R
	fi
    fi
    
    # jesli pierwszy warunek jest inny niz usun tylko w obecnym folderze
    if [ "$1" != "-R" ] &&  [ "$1" != "-r" ] &&  [ "$1" != "-rl" ] &&  [ "$1" != "-lr" ] &&  [ "$1" != "-Rl" ] &&  [ "$1" != "-lR" ] &&  [ "$1" != "-d" ] 
    then
	usun
	let counter=0
    fi

    # counter--
    let counter=counter-1

done 
