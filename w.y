%{

#include <stdio.h>

#include <stdlib.h>

#include <time.h>

#include <string.h>



#define MAX_STRINGS 11





void afisareTara(char* i);

int searchCity(char* city);        

int searchYear(int year);

int search(); 

char despreFictiune[4][200] = {

        "Hotul de carti, Markus Zusak\n>", 

        "Acolo unde canta raci, Delia Owens\n>",

        "Twisted Love, Ana Huangn\n>",

        "Pacienta Tacuta, Alex Michaeli\n>"

        };



char  desprePoezie[4][200] = {

        "Liceu, George Bacovia\n>", 

        "Ma invelesc de frig, George Bacovia\n>",

        "De ce nu-mi vii, Mihai Eminescu\n>",

        "Pamantul, Lucian Blaga\n>"

        };



char despreAventura[4][200] = {

        "Aventurile lui Tom Sawyer, Mark Twain\n>", 

        "Viata lui PI, Yann Martel\n>",

        "Moby Dick, Herman Melville\n>",

        "Cinci saptamani in balon, Jules Verne\n>"

        };

      



char strings[MAX_STRINGS][8000] = {

    "În anul 1966, Anglia a găzduit și a câștigat Campionatul Mondial de Fotbal\n>",

    "În anul 2016, Austria a fost gazda celebrului concurs muzical Eurovision.\n>",

    "În anul 2008, China a găzduit Jocurile Olimpice de vară la Beijing. ",

    "Italia a fost țara gazdă a Jocurilor Olimpice de vară de două ori până în prezent. Prima oară a fost în anul 1960\n>",

    "Franta a fost una dintre națiunile fondatoare ale mișcării olimpice moderne și a fost gazda Jocurilor Olimpice de vară de cinci ori până în prezent.Prima oară a fost în anul 1900, când Parisul a găzduit a doua ediție a Jocurilor Olimpice moderne.\n>",

    "Turcia a participat pentru prima dată la Jocurile Olimpice de vară în anul 1908.\n>",

    "Un moment notabil pentru Romania în cadrul Jocurilor Olimpice a fost în anul 1976, la Montreal, când Nadia Comăneci, o tânără gimnastă română, a obținut prima notă perfectă de 10 din 10 în istoria gimnasticii olimpice.\n>",

    "Peru a participat la Jocurile Olimpice de vară din anul 1900.\n>",

    "În anul 2010, in Spania, echipa națională de fotbal a reușit să câștige Campionatul Mondial, aducând astfel bucurie și mândrie în țara lor.\n>",

    "Un an remarcabil pentru Grecia la Jocurile Olimpice moderne este anul 2004. În acel an, Grecia a fost gazda Jocurilor Olimpice de vară, care au avut loc la Atena.\n>",

    "Ungaria a fost prezentă la Jocurile Olimpice de vară de la prima ediție a acestora în 1896 și a participat la toate edițiile ulterioare.\n>"

      

};









time_t t;

struct tm tm;

int ind  = 0;

char aux[100];

char capi [100];

%}



%union{

int svalue;

char *strvalue;

}







%token<svalue> AN  

%token<strvalue> GEO 

%token<strvalue> JOCURI_OLIMPICE TE NUMESTI 

%token<strvalue> TARA CAPITALA INVATA EXERSEAZA

%type<svalue> istorie 

%type<strvalue> interogari questions 

%type<strvalue> geogra domeniu 

%token  MULTUMESC ENDPROP DORESC CUNOSC VERIFIC DIN VIRGULA INTREBARE LOC IN_AN POATE ISTORIE SAL ENCICLOPEDIE CE CUM  CHEAMA APR IN TOATA VREAU SA VAD UN LA MA  DE MEU II ESTE REVE NE MAI AUVE POTI AJUTA IMI SPUI ZI CURIOZ STI DOMENIU DE MATE BIO CARTE VARSTA FICTIUNE POEZIE AVENTURA PREPOZITIE



%%

comenzi :

        | comenzi comenzi 

        ;

comenzi : salut_msg

        | interogari

        | actiuni_carti

        | feedback

        | istorie

        | geogra 

        | stop

        |curiozitate_an_tara

        |multu

        |quest_carti

        |domeniu_carte

 

        ;



salut_msg : SAL ENDPROP {printf("[Enciclopedie]: SALUTARE!\n>");}

	  | SAL VIRGULA  ENCICLOPEDIE ENDPROP {printf("[Enciclopedie]: Salutare! Cu ce te pot ajuta?\n> ");}

	  |SAL  ENCICLOPEDIE ENDPROP {printf("[Enciclopedie]: Salutare! Cu ce te pot ajuta?\n> ");}

          ;



interogari : CUM questions ENDPROP {printf("%s", $2);}

           ;

  

questions: TE NUMESTI {$$ = "[Enciclopedie]: Eu sunt chat-ul inteligent. Numele meu este Enciclopedia!\n>";}

          |TE CHEAMA  {$$ = strdup("[Enciclopedie]: Eu sunt chat-ul inteligent. Numele meu este Enciclopedia!\n>");}

          | MA POTI AJUTA  {$$ = strdup("[Enciclopedie]: Te pot ajuta cu diferite cumenzi.\n Detin informatii despre: Informatii despre carti si genturi literare\nPoti sa pui interogari despre Capitale/Tari.\nCuriozitati despre un eveniment istoric in functie de anul dorit\nQuery-uri despre Jocurile Olimpice din tarile si anii in care s-au desfasurat");}

          ;

   

   



geogra : actiune exersez_geo ENDPROP {printf("[Enciclopedie]: Da, introdu, te rog, numele unei tari si capitala. Se va verifica daca este corect.\n>");}

       |CE domeniu verb ENDPROP {printf("%s",$2);}

       |INVATA GEO ENDPROP {printf("[Enciclopedie]:Introdu, te rog, numele tarii sau o intrebat cu numele unei tari, pentru care se va genera capitala\n>");}

       | TARA CAPITALA ENDPROP{

        strcpy(aux, "");

        strcat(aux, $1);

        

        strcpy(capi, "");

        strcat(capi, $2);

        

        

        if(strcmp(aux, "Anglia")==0 && strcmp(capi, "Londra")==0 ){

          printf("[Quiz] Congrats\n>");

       }else if(strcmp(aux, "Austria")==0 && strcmp(capi, "Vienna")==0  ){

           printf("[Quiz] Congrats\n>");

       } else if(strcmp(aux, "China")==0 && strcmp(capi, "Beijing")==0 ){

           printf("[Quiz] Congrats\n>");

       }else if(strcmp(aux, "Franta")==0 && strcmp(capi, "Paris")==0   ){

          printf("[Quiz] Congrats\n>");

       }else if(strcmp(aux, "Grecia")==0 && strcmp(capi, "Atena")==0   ){

           printf("[Quiz] Congrats\n>");

       }else if(strcmp(aux, "Italia")==0 && strcmp(capi, "Roma")==0  ){

          printf("[Quiz] Congrats\n>");

       } else if(strcmp(aux, "Peru")==0 && strcmp(capi, "Lima")==0  ){

          printf("[Quiz] Congrats\n>");

       } else if(strcmp(aux, "Romania")==0 && strcmp(capi, "Bucuresti")==0){

           printf("[Quiz] Congrats\n>");

       }else if(strcmp(aux, "Spania")==0 && strcmp(capi, "Madrid")==0){

          printf("[Quiz] Congrats\n>");

       }else if(strcmp(aux, "Turcia")==0 && strcmp(capi, "Ankara")==0){

          printf("[Quiz] Congrats\n>");

       }else if(strcmp(aux, "Ungaria")==0 && strcmp(capi, "Budapesta")==0){

          printf("[Quiz] Congrats\n>");

       }else{

       printf("[Quiz] Wrong! Try again, please!\n>");

        

       } 

       }

       |TARA ENDPROP {

        strcpy(aux, "");

        strcat(aux, $1);

        $$=aux;

        

        afisareTara(aux);

       

       }

       | questTara TARA ENDPROP {

        strcpy(aux, "");

        strcat(aux, $2);

        $$=aux;

        

        afisareTara(aux);

       

       }

       ;

questTara:  ZI

          | ZI PREPOZITIE 

	  ;

exersez_geo: SA EXERSEAZA GEO

            | SA VERIFIC CURIOZ DE GEO

            ;



actiune: VREAU 

	|DORESC

	;       



domeniu: TARA {$$ = "[Enciclopedie]:Detin cunostinte despre:\nAnglia\nAustria\nChina\nFranta\nItalia\nPeru\nRomania\nSpania\nTurcia\nUngaria\nTurcia\nUngaria\n\n>";}

	| CAPITALA {$$ = "[Enciclopedie]:Detin cunostinte despre: \nLondra\nVienna\nBeijing\nParis\nAtena\nRoma\nLima\nBucuresti\nMadrid\nAnkara\nBudapesta\n\n>";}

	;

verb  : CUNOSC

      | STI

      ;



istorie:STI ISTORIE ENDPROP {printf("[Enciclopedie]: Da, introdu, te rog un an despre care doresti informatii.(Ani cunoscuti: 1799, 1330, 1395, 1595, 1475, 1475)\n>");}

       |ISTORIE ENDPROP {printf("[Enciclopedie]: Da, introdu, te rog un an despre care doresti informatii.\n>");}

       |AN ENDPROP {

	       if($1==1799){

	       printf("[Enciclopedie][%d] [Bătălia de la Waterloo] Bătălia s-a încheiat cu victoria decisivă anglo-aliaților și prusacilor, victorie ce pecetluiește practic sfârșitul Imperiului napoleonian.\n", $1);

	       }else if($1==1330){

	       printf("[Enciclopedie][%d] [Bătălia de la Posada] Această bătălie a marcat emanciparea Țării Românești de sub tutela coroanei maghiare. \n", $1);

	       }else if($1==1395){

	       printf("[Enciclopedie]: [%d] [Bătălia de la Rovine] A fost una dintre cele mai importante bătălii din istoria Țării Românești și a avut loc în data 17 mai 1395. \n", $1);

	       } else if($1==1595){

	       printf("[Enciclopedie]: [%d] [Bătălia de la Calugareni] Oastea munteană de 10.000 de oameni, condusă de Mihai Viteazul, întărită cu 6.000 de ardeleni trimiși de Sigismund Báthory, a încercat să oprească oastea otomană invadatoare condusă de Sinan Pașa, \n", $1);

	       }else if($1==1475){

	       printf("[Enciclopedie]:[%d] [Bătălia de la Vaslui] Această bătălie a marcat emanciparea Țării Românești de sub tutela coroanei maghiare. \n", $1);

	       }

	       else{

	       printf("[Enciclopedie]: Nu e un an despre care am cunostinte.Incercati unul dintre acesti ani:[1799, 1330, 1395, 1595, 1475]\n");

	       }

	

}

       ;   

       



quest_carti:     STI CARTE DE 

	       | SPUI CARTE DE

	       | CUNOSC CARTE DE

               | STI PREPOZITIE CARTE DE 

               | SPUI PREPOZITIE CARTE DE 

               | CUNOSC PREPOZITIE CARTE DE 

               ;

                 

 domeniu_carte:     FICTIUNE

         |     POEZIE

         |     AVENTURA

         ;

actiuni_carti: quest_carti  domeniu_carte ENDPROP {

                                                        t = time(NULL);

                                                        tm = *localtime(&t);

                                                        ind = tm.tm_sec % 4;

                                                        printf("[Enciclopedie]: %s",despreFictiune[ind]);

                                                }

                                                ;

                                                

                                           

                                                                                                                 

                                                                                                                        

 feedback: CUM ESTE CARTE DE FICTIUNE ENDPROP {

                                                        t = time(NULL);

                                                        tm = *localtime(&t);

                                                        ind = tm.tm_sec % 2;

                                                        if(ind == 0){

                                                                printf("[Enciclopedie]:Potrivita pentru tine :)!\n>");

                                                        }else{

                                                                printf("[Enciclopedie]:Nu iti va placea. Incearca alt gen literar :)\n>");                                                                

                                                        }

                     

                                      }

             | CUM ESTE CARTE DE POEZIE ENDPROP{ 

                                                        t = time(NULL);

                                                        tm = *localtime(&t);

                                                        ind = tm.tm_sec % 2;

                                                        if(ind == 0){

                                                                printf("[Enciclopedie]: Potrivita pentru oameni sensibili\n>");

                                                        }else{

                                                                printf("[Enciclopedie]: Pe placul celor melancolici!\n>");                                                                

                                                        }

                                           }

                                           

                                           

                                           

                                           

            | CUM ESTE CARTE DE AVENTURA ENDPROP{ 

                                        t = time(NULL);

                                        tm = *localtime(&t);

                                        ind = tm.tm_sec % 2;

                                        if(ind == 0){

                                                printf("[Enciclopedie]: Potrivita pentru oamenii curiosi si dornici sa cunoasca cat mai mult universul in care se afla sau cel pe care nu il cunosc inca.\n>");

                                        }else{

                                                printf("[Enciclopedie]:Nu este potrivita pentru persoanele carora nu le plac calatoriile si aventurile.!\n>");                                                                

                                        }

                                           }                             

             ;



curiozitate_an_tara:  spune JOCURI_OLIMPICE  ENDPROP

                     |spuneAnTara compunere_an_tara prepozitii JOCURI_OLIMPICE ENDPROP	  

                     |spuneAnTara JOCURI_OLIMPICE prepAn compunere_an_tara ENDPROP	

                     |INTREBARE prepAn compunere_an_tara LA JOCURI_OLIMPICE ENDPROP

                     |INTREBARE prepAn compunere_an_tara

                     |spuneAnTara JOCURI_OLIMPICE DIN compunere_an_tara ENDPROP

		;

prepozitii: LA 

          |PREPOZITIE

          |DE

          ;

prepAn: IN IN_AN

      | IN 

      |DIN IN_AN

      |DIN

      |LOC prepAn

      ;		

		

spune: IMI SPUI TOATA CURIOZ DE   { search();}

      | IMI SPUI PREPOZITIE CURIOZ DE  {search();}

      | SPUI TOATA CURIOZ DE  {search();}

      | SPUI PREPOZITIE CURIOZ DE {search();}

      |POATE SPUI CURIOZ DE {search();}

      |POATE SPUI  PREPOZITIE CURIOZ DE  {search();}

      ;

 

spuneAnTara: IMI SPUI CURIOZ DE  

      |IMI SPUI PREPOZITIE CURIOZ DE 

      |SPUI  CURIOZ DE 

      |SPUI PREPOZITIE CURIOZ DE

      |POATE SPUI CURIOZ DE 

      |POATE SPUI  PREPOZITIE CURIOZ DE

     ; 

     

     

compunere_an_tara:

 	 AN {

		    int year = $1;

		    int yearIndex = searchYear(year);

		    

		    if (yearIndex != -1 ) {

			printf("Curiozitate: %s\n", strings[yearIndex]);

		    } else {

			printf("Nu s-au găsit informații pentru anul %d.", year);

		    }



                } 



	| AN LA JOCURI_OLIMPICE DIN TARA ENDPROP{

			int year = $1;

			    char* city = $5;

			    int yearIndex = searchYear(year);

			    int cityIndex = searchCity(city);

			    if (yearIndex != -1 && cityIndex != -1) {

				if(yearIndex==cityIndex){

				printf("Curiozitate: %s\n", strings[yearIndex]);

				}else{

				 printf("Pentru anul %d, nu avem informatii despre tara %s\n", year, city);

				}

			    } else {

				printf("Nu s-au găsit informații pentru anul %d și tara %s\n", year, city);

			    }

			}

                | 

                TARA prepAn AN {

		   int year = $3;

		    char* city = $1;

		    int yearIndex = searchYear(year);

		    int cityIndex = searchCity(city);

		    if (yearIndex != -1 && cityIndex != -1) {

			if(yearIndex==cityIndex){

			printf("Curiozitate: %s\n", strings[yearIndex]);

			}else{

			 printf("Pentru anul %d, nu avem informatii despre tara %s\n", year, city);

			}

		    } else {

			printf("Nu s-au găsit informații pentru anul %d și tara %s\n", year, city);

		    }



                } 

               |  TARA{

		    char* city = $1;



		    int cityIndex = searchCity(city);

		    if (cityIndex != -1) {

			

			printf("Curiozitate: %s\n", strings[cityIndex]);

	

		    } else {

			printf("Nu s-au găsit informații pentru tara %s\n", city);

		    }



                }  

               

                

;

 multu:  MULTUMESC ENDPROP {printf("Cu drag!\n>");}

        |MULTUMESC VIRGULA  ENCICLOPEDIE ENDPROP  {printf("Cu drag, utilizatorul meu preferat!\n>");}

stop  : REVE ENDPROP {printf("La revedere, iti doresc o zi buna!\n"); exit(0);}

      | NE MAI AUVE ENDPROP {printf("La revedere, iti doresc o zi buna!\n"); exit(0);}

%%







#include "lex.yy.c"



int main(){

 

        printf("------------------------------------------\n\n");

        printf("        Enciclopedia-chatul tau interactiv!        \n");

        printf("- \nIstorie: Stiu informatii despre evenimente istorice\n");

        printf("\nJocurile Olimpice: Pot sa furnizez informatii despre Anul/Tara care a participat ja Jocurile Olimice\n");

        printf("\nGeografie. Invata geografie. Exerseaza geografie  .(Se vor introduce intrebari cu  tara : pt a invata capitala. \nSe introduc Tara+Capitala, pt a valida corectitudinea\n");

        printf("\nCarti: Generare de titluri pentru genurile literare: Fictiune/Poezie/Aventura\n");

        printf("\nCarti: Sugestii pentru gen: Fictiune/Poezie/Aventura\n");     

        printf("-------------------------------------------\n\n> ");

        yyparse();

        

        

      



}

int yyerror() {printf("Instructiune neacceptata! Va rugam sa verificati ortografia, punctuatia si invercati din nou. Multumim pentru intelegere!\n");}  





        

           

int searchYear(int year) {

    int i;

    for (i = 0; i < MAX_STRINGS; i++) {

        char* ptr = strstr(strings[i], "anul");

        if (ptr != NULL) {

            int stringYear = atoi(ptr + strlen("anul"));

            if (stringYear == year) {

                return i;

            }

        }

    }

    return -1;

}        



int search() {

    int i;

    for (i = 0; i < MAX_STRINGS; i++) {

        printf("Curiozitate despre Jocurile Olimoice[%d]: %s\n",i, strings[i]);

    }

    return -1;

}        

             

          

int searchCity(char* city) {

    int i;

    for (i = 0; i < MAX_STRINGS; i++) {

        char* ptr = strstr(strings[i], city);

        if (ptr != NULL) {

            return i;

        }

    }

    return -1;

}





void afisareTara(char* aux){

if(strcmp(aux, "Anglia")==0 || strcmp(aux, "Angliei")==0  ){

          printf("[capitala]: Londra\n");

       }else if(strcmp(aux, "Austria")==0 ||  strcmp(aux, "Austriei")==0 ){

          printf("[capitala]: Vienna\n");

       } else if(strcmp(aux, "China")==0  || strcmp(aux, "Chinei")==0 ){

          printf("[capitala]: Beijing\n");

       }

       else if(strcmp(aux, "Franta")==0 || strcmp(aux, "Frantei")==0 ){

          printf("[capitala]: Paris\n");

       }

       else if(strcmp(aux, "Grecia")==0  || strcmp(aux, "Greciei")==0   ){

          printf("[capitala]: Atena\n");

       }

       else if(strcmp(aux, "Italia")==0  || strcmp(aux, "Italiei")==0 ){

          printf("[capitala]: Roma\n");

       } else if(strcmp(aux, "Peru")==0  || strcmp(aux, "Perului")==0 ){

          printf("[capitala]: Lima\n");

       }

       else if(strcmp(aux, "Romania")==0  || strcmp(aux, "Romaniei")==0 ){

          printf("[capitala]: Bucuresti\n");

       }else if(strcmp(aux, "Spania")==0 || strcmp(aux, "Spaniei")==0 ){

          printf("[capitala]: Madrid\n");

       }

       else if(strcmp(aux, "Turcia")==0 || strcmp(aux, "Turciei")==0 ){

          printf("[capitala]: Ankara\n");

       }

       else if(strcmp(aux, "Ungaria")==0 || strcmp(aux, "Ungariei")==0 ){

          printf("[capitala]: Budapesta\n");

       }

}

   

        

        
