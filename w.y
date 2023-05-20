%{

#include <stdio.h>

#include <stdlib.h>

#include <time.h>

#include <string.h>



#define MAX_STRINGS 11



void afisareMate(int i);

void afisareBio(int i);



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

      

char despreCuriozitatiMate[8][600] = {

	"Știați că dacă înmulțiți 111,111,111 cu 111,111,111, rezultatul devine egal cu 12,345,678,987,654,321.\n>",

	"Există o legătură între pizza și matematica. Și anume: pentru a calcula volumul formei cilindrice a pizza-ei, vine în ajutor formula Pi x r2 x h.\n>",

	"Zero este singurul număr care nu poate fi reprezentat în cifre romane. Motivul pentru care nu există nici o cifră pentru zero este că nu era nevoie de o cifră care să o reprezinte.\n>", 

	"În loc de cifre romane, cuvântul latin „nulla” ar fi fost folosit pentru a reprezenta conceptul de zero.\n>",

	"Cifra 6 este cel mai mic număr perfect. În teoria numerelor, un număr perfect este un întreg pozitiv care este egal cu suma divizorilor săi pozitivi.\n>"

	"6 este cel mai mic număr perfect. Iată un exemplu, pentru a înțelege mai bine: 1+2+3=6.\n>",

	"Se pare pitagoricienii, adeptii scolii filosofului grec Pitagora,, foloseau pietre mici pentru a reprezenta numerele.\n>",

	"în 1671 Wilhelm Gottfried Leibnitz realizează prima mașină de calcul care poate realiza operații de împărțire și înmulțire.\n>"

};





char despreCuriozitatiBio[17][600] = {

        "Dinţii unui liliac vampir sunt atât de ascuţiţi încât muşcătura sa nu poate fi resimţită deloc.\n>",

        "Limba unui cameleon are cel puţin lungimea corpului lui, dar poate apuca prada într-o fracţiune de secundă.\n>",

        "Ochii unui vultur au capacitatea de a vedea de cel puţin patru ori mai clar decât cei ai oamenilor.\n>",

        "Bizonii adulţi sunt cele mai mari mamifere terestre din America de Nord.\n>",

        "Pentru a zbura, păsările colibri îşi pot scutura aripile de aproximativ 200 de ori pe secundă.\n>",

        "Pinguinii imperiali pot rămâne sub apă până la 27 de minute şi se pot scufunda la o adâncime de până la 500 de metri.\n>",

        "Atunci când găsesc o sursă de apă, cămilele sălbatice bactriane (unele dintre cele mai rare mamifere de pe planetă) beau până la 50 de litri.\n>",

        "Cea mai bună tensiune arterială, la adult, este 120/70 mmHg.\n>",

        "Nu există cancer ca o singură entitate, ci peste 300 de tipuri de cancer, fiecare cu mecanisme proprii, celule diferite, răspunsuri distincte la terapii.\n>",

        "Glanda este o denumire populară greșită a tiroidei; corpul are zeci de glande.\n>",

        "Un om poate simți durere la nivelul unui membru superior sau inferior care nu mai există; se numește sindromul membrului fantomă.\n>",

        "Creierul nu doare pentru că nu are nociceptori (receptori de durere). Se poate face așa numita brain awake surgery, fără anestezie generală.\n>",

        "Cea mai bună frecvență cardiacă la care raportul performanță/consum de oxigen este ideal este de 55-65 bpm.\n>",

        "Inima este primul organ funcțional și începe să pompeze sânge în a patra săptămână de viață intrauterină.\n>",

        "Creierul consumă în regim bazal cam 25% din energia întregului organism.\n>",

        "Unul dintre cele mai importante gesturi pe care le putem face pentru sănătate este spălatul pe mâini.\n>",

        "Diabeticii pot face infarct miocardic acut fără durere, pentru că neuropatia diabetică le alterează transmiterea nervoasă.\n>"

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

%token  MULTUMESC ENDPROP DORESC CUNOSC VERIFIC DIN VIRGULA INTREBARE LOC IN_AN POATE ISTORIE SAL CASA ENCICLOPEDIE CE CUM  CHEAMA APR IN LUMINA TOATA CAMERA BUC BAIE STINGE VREAU SA VAD UN LA MA MERG AFARA DE CAINE MEU II ESTE FOAME SETE REVE NE MAI AUVE POTI AJUTA VREMEA VREMCAND PLOUA SENIN INNOR IMI SPUI CURIOZ STI DOMENIU DE MATE BIO CARTE VARSTA FICTIUNE POEZIE AVENTURA PREPOZITIE



%%

comenzi :

        | comenzi comenzi 

        ;

comenzi : salut_msg

        | interogari

        | actiuni_carti

        | curiozitati

        | istorie

        | geogra 

        | stop

        |curiozitate_an_tara

        |multu

        ;



salut_msg : SAL ENDPROP {printf("[Enciclopedie]: SALUTARE!\n>");}

	  | SAL VIRGULA  ENCICLOPEDIE ENDPROP {printf("[Enciclopedie]: Salutare! Cu ce te pot ajuta?\n> ");}

	  |SAL  ENCICLOPEDIE ENDPROP {printf("[Enciclopedie]: Salutare! Cu ce te pot ajuta?\n> ");}

          ;



interogari : CUM questions ENDPROP {printf("%s", $2);}

           ;

  

questions: TE NUMESTI {$$ = "[Enciclopedie]: Eu sunt chat-ul inteligent. Numele meu este Enciclopedia!\n>";}

          |TE CHEAMA  {$$ = strdup("[Enciclopedie]: Eu sunt chat-ul inteligent. Numele meu este Enciclopedia!\n>");}

          | MA POTI AJUTA  {$$ = strdup("[Enciclopedie]: Te pot ajuta cu diferite cumenzi. Detin informatii despre: Carti/Mate/Bio/Geografie/Istorie\nPoti sa pui interogari despre Capitale/Tari.\nQuery-uri despre Jocurile Olimpice din tarile si anii in care s-au desfasurat.");}

          ;

   

   



geogra : actiune exersez_geo ENDPROP {printf("[Enciclopedie]: Da, introdu, te rog, numele unei tari si capitala. Se va verifica daca este corect.\n>");}

       |CE domeniu verb ENDPROP {printf("%s",$2);}

       |INVATA GEO ENDPROP {printf("[Enciclopedie]: Da, introdu, te rog, numele unei tari, pentru care se va genera capitala\n>");}

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

       | TARA ENDPROP {

        strcpy(aux, "");

        strcat(aux, $1);

        $$=aux;

       if(strcmp(aux, "Anglia")==0){

          printf("[capitala]: Londra\n", $1);

       }else if(strcmp(aux, "Austria")==0){

          printf("[capitala]: Vienna\n", $1);

       } else if(strcmp(aux, "China")==0){

          printf("[capitala]: Beijing\n", $1);

       }

       else if(strcmp(aux, "Franta")==0){

          printf("[capitala]: Paris\n", $1);

       }

       else if(strcmp(aux, "Grecia")==0){

          printf("[capitala]: Atena\n", $1);

       }

       else if(strcmp(aux, "Italia")==0){

          printf("[capitala]: Roma\n", $1);

       } else if(strcmp(aux, "Peru")==0){

          printf("[capitala]: Lima\n", $1);

       }

       else if(strcmp(aux, "Romania")==0){

          printf("[capitala]: Bucuresti\n", $1);

       }else if(strcmp(aux, "Spania")==0){

          printf("[capitala]: Madrid\n", $1);

       }

       else if(strcmp(aux, "Turcia")==0){

          printf("[capitala]: Ankara\n", $1);

       }

       else if(strcmp(aux, "Ungaria")==0){

          printf("[capitala]: Budapesta\n", $1);

       }

       }

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



istorie:STI ISTORIE ENDPROP {printf("[Enciclopedie]: Da, introdu, te rog un an despre care doresti informatii.\n>");}

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

actiuni_carti: STI PREPOZITIE CARTE DE FICTIUNE ENDPROP {

                                                        t = time(NULL);

                                                        tm = *localtime(&t);

                                                        ind = tm.tm_sec % 4;

                                                        printf("[Enciclopedie]: %s",despreFictiune[ind]);

                                                }

                                                

             | STI CARTE DE FICTIUNE ENDPROP  {

                                                        t = time(NULL);

                                                        tm = *localtime(&t);

                                                        ind = tm.tm_sec % 4;

                                                        printf("[Enciclopedie]: %s",despreFictiune[ind]);

                                                }   

                                                

                                                

             |  STI PREPOZITIE CARTE DE POEZIE ENDPROP {

                                                        t = time(NULL);

                                                        tm = *localtime(&t);

                                                        ind = tm.tm_sec % 4;

                                                        printf("[Enciclopedie]: %s",desprePoezie[ind]);

                                                }

                                                

             | STI CARTE DE POEZIE ENDPROP  {

                                                        t = time(NULL);

                                                        tm = *localtime(&t);

                                                        ind = tm.tm_sec % 4;

                                                        printf("[Enciclopedie]: %s", desprePoezie[ind]);

                                                }   

                                                

             |  STI PREPOZITIE CARTE DE AVENTURA ENDPROP {

                                                        t = time(NULL);

                                                        tm = *localtime(&t);

                                                        ind = tm.tm_sec %4;

                                                        printf("[Enciclopedie]: %s",despreAventura[ind]);

                                                }

                                                

             | STI CARTE DE AVENTURA ENDPROP  {

                                                        t = time(NULL);

                                                        tm = *localtime(&t);

                                                        ind = tm.tm_sec % 4;

                                                        printf("[Enciclopedie]: %s",despreAventura[ind]);

                                                }   

                                                                                  

                                                                                                                   

                                                                                                                             

             | CUM ESTE CARTE DE FICTIUNE ENDPROP {

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



curiozitati : IMI SPUI CURIOZ ENDPROP {

                printf("[Enciclopedie]: Da! dar va trebui sa specifici in intrebarea ta un domeniu pe care il cunosc\n De ex: MATEMATICA, BIO\n>");

              

            }

           

            

            | STI CURIOZ ENDPROP{

                printf("[Enciclopedie]: Da! dar va trebui sa specifici in intrebarea ta un domeniu pe care il cunosc\n De ex: MATEMATICA, BIO\n");

            }

            | MATE ENDPROP {

                t = time(NULL);

                tm = *localtime(&t);

                ind = tm.tm_sec % 7;

                afisareMate(ind);

            }

             |IMI SPUI CURIOZ DE MATE ENDPROP {

             

                t = time(NULL);

                tm = *localtime(&t);

                ind = tm.tm_sec % 7;

                afisareMate(ind);   

            }

             | STI CURIOZ DE MATE ENDPROP{

                t = time(NULL);

                tm = *localtime(&t);

                ind = tm.tm_sec % 7;

                afisareMate(ind);   

            }

	   |IMI SPUI CURIOZ DE BIO ENDPROP {

              t = time(NULL);

                tm = *localtime(&t);

                ind = tm.tm_sec % 7;

                afisareBio(ind);   

            }

             | STI CURIOZ DE BIO ENDPROP{

                t = time(NULL);

                tm = *localtime(&t);

                ind = tm.tm_sec % 7;

                afisareBio(ind);   

            }

            | BIO ENDPROP {

                t = time(NULL);

                tm = *localtime(&t);

                ind = tm.tm_sec % 7;

                afisareBio(ind);   

            }



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

        printf("        Enciclopedia-chatul tau interactiv!        \n\n");

        printf("- Mate.Stii curiozitati despre mate? Imi spui curiozitati despre mate? Mate\n");

        printf("- Bio. Stii curiozitati despre bio? Imi spui curiozitati despre bio? Bio\n");

        printf("- Istorie. Stii istorie .(Se vor introduce anii pentru care se vor furniza rezultate)\n");

        printf("- Geografie. Invata geografie. Exerseaza geografie  .(Se vor introduce tara : pt a invata capitala. Se introduc Tara+Capitala, pt a valida corectitudinea\n");

        printf("- Carti: Generare de titluri pentru genurile: Fictiune/Poezie/Aventura\n");

        printf("- Carti: Sugestii pentru gen: Fictiune/Poezie/Aventura\n");     

        printf("  Query-uri: (1) AN TARA\n");  

        printf("-------------------------------------------\n\n> ");

        yyparse();

        

        

      



}

int yyerror() {printf("Instructiune neacceptata! Va rugam sa verificati ortografia, punctuatia si invercati din nou. Multumim pentru intelegere!\n");}  



void afisareMate(int ind){

                printf("[Enciclopedie]: Da! Uite una:\n");

                ind = tm.tm_sec % 7;

                printf("[Mate]: %s\n>",despreCuriozitatiMate[ind]);

        }

        

        

void afisareBio(int ind){

        printf("[Enciclopedie]: Da! Uite una:\n");

                printf("[BIO]: %s\n>",despreCuriozitatiBio[ind]);

        }  

        

        

           

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

   

        

        
