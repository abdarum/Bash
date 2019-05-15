#!/bin/bash


while [ 1 ]; do

	mv -v ~/Pobrane/Schemat_blokowy_hardware.drawio ~/Programowanie/GitHub/Szklarnia_projekt_zespolowy_git/Hardware/Schematy/ 2>/dev/null 
	mv -v ~/Pobrane/Schemat_blokowy_hardware.png ~/Programowanie/GitHub/Szklarnia_projekt_zespolowy_git/Hardware/Schematy/	2>/dev/null
	#rename 's/Schematic_Projekt-Zespo-owy-Parapetowa-szklarnia*/Schematic_Projekt-Zespo-owy-Parapetowa-szklarnia/' Schematic_Projekt-Zespo-owy-Parapetowa-szklarnia*
	mv -v Schematic_Projekt-Zespo-owy-Parapetowa-szklarnia*.png Schematic_Projekt-Zespo-owy-Parapetowa-szklarnia.png 2>/dev/null
	mv -v ~/Pobrane/Schematic_Projekt-Zespo-owy-Parapetowa-szklarnia.png ~/Programowanie/GitHub/Szklarnia_projekt_zespolowy_git/Hardware/Schematy/ 2>/dev/null
	sleep 5
done
