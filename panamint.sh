function wyswietl_menu
{
    echo "Skrypt uruchamia emacsa i terminal na serwerze panamint"
    echo "  -e uruchamia tylko emacsa"
    echo "  -t uruchamia tylko terminal"
    echo "  -d pokaz plik html wygenerowany przez doxygena"
    echo "  sync synchronizacja danych wg serwera"
    echo "  now uruchomienie emacsa lub/i terminala w aktualnym projekcie"  
    echo "  ?  wyswietla dostepne opcje"
}
#account="kstefanc@panamint.ict.pwr.wroc.pl"
account=panamint #wymaga stworzenia pliku ~/.ssh/config
folder="~/PO/Lab07/Lab/prj"
doxygen="/home/kstefanc/backup_diablo/PO/Lab07/Lab/dox/html/index.html"
function emacs_server {
    #emacs /sshx:kstefanc@panamint.ict.pwr.wroc.pl:~ 2> /dev/null & 
    if [ "$2" == "now" ] || [ "$1" == "now" ]
    then	
	emacs /sshx:$account:$folder 2> /dev/null & 
    else
	emacs /sshx:$account:~ 2> /dev/null & 
    fi
}

function terminal_server {
    if [ "$2" == "now" ] || [ "$1" = "now" ]
    then	
	# polaczenie z serverem z jednoczesnym przemieszczeniem do "$folder"
	ssh -t -X $account "cd $folder; bash"
    else
	ssh -X $account
    fi
}

function sync_server {
#	rsync -avz --delete -e ssh kstefanc@diablo.ict.pwr.wroc.pl:~/  ~/backup_diablo/   
	rsync -avz --delete -e ssh $account:~/  ~/backup_diablo/  
}


if [ "$1" == "" ] || [ "$1" = "now" ]  
then
    emacs_server $1 $2
    terminal_server $1 $2
fi

if [ "$1" == "-e" ]
then
    emacs_server $1 $2
fi


if [ "$1" == "-t" ]
then
    terminal_server $1 $2
fi

if [ "$1" == "-d" ] 
then
    firefox "$doxygen" 2> /dev/null & 
fi

if [ "$1" == "sync" ] 
then
    sync_server $1 $2
fi

if [ "$1" == "?" ]
then
    wyswietl_menu
fi
