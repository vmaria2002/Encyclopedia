%%

[,]    return VIRGULA;  

[.?!]     return ENDPROP;



"salut" |

"Salut" |

"salutare" |

"hei" |

"ceau" |

"servus" |

"buna"    |

"Buna"  return SAL;





"Multumesc" |

"multumesc" |

"mersi" |

"multu" return MULTUMESC;



"Enciclopedie" |

"enciclopedie" return ENCICLOPEDIE;



"anul" |

"anii" |

"aniii" |

"an"   return IN_AN;



"ce"  |

"Ce"   return CE;





"te"  |

"Te"   return TE;



"numesti"  |

"Numesti"   return NUMESTI;





"cheama"   return  CHEAMA;



"in" |

"In" return IN;



"din" |

"Din" return DIN;





"toata" | 

"Toata" |

"toate" | 

"Toate"  return TOATA;





"vreau" |

"vrem" |

"vreti" |

"Vreau" {yylval.strvalue=yytext; return VREAU;}







"dori" |

"mi-as dori" |

"imi doresc" |

"doresc"  return DORESC;



"sa" |

"sa-mi" |

"sa-ti" |

"Sa" return SA;



"vad" |

"Vad" |

"Vizionez" |

"vizionez" |

"Vizualizez" |

"vizualizez" |

"uit"  |

"Uit" return VAD;



"un" |

"Un" return UN;



"La" | 

"la" return LA;

F

"Ma" |

"ma" return MA;





"de" | 

"despre" |

"referitoare la" |

"cu refereinta la" |

"De" return DE;



 

"care au avut loc" return LOC;



"Este" |

"E"    |

"e"    |

"sunt" |

"Sunt" |

"este" return ESTE;



"ce s-a intamplat"  return INTREBARE;



"La revedere" |

"la revedere" |

"Pa" |

"pa" |

"Zi faina" |

"zi faina" |

"Zi frumoasa" |

"zi frumoasa" |

"Revedere" return REVE;



"ne" |

"Ne" return NE;



"Mai" | 

"mai" return MAI;



"auzim" |

"Auzim" | 

"vedem" |

"Vedem" return AUVE;



"Ajuta" |

"ajuta" return AJUTA;



"Poti" |

"poti" return POTI;



"Cum" | 

"cum" return CUM;



"Carti"  | 

"Carte"  |

"Cartea" |

"cartea" |

"cartile" |

"Cartile" |

"carti"  |

"carte" return CARTE;



"o"      |

"niste"  |

"cateva" |

"O"	 |

"Niste"  |

"pentru" |

"Pentru" |

"vreo"   |

"Cateva" return PREPOZITIE;



"Mi-ai putea" |

"mi-ai putea" |

"ai putea" |

"Ai putea"  return POATE;





"Fictiune" |

"fictiune" return FICTIUNE;



"Poezie" |

"Poezii" |

"poezie" |

"poezii" return POEZIE;



"Aventuri"   | 

"aventuri"   |

"Aventura"   |

"aventura"  return AVENTURA;



"imi" |

"mi-as" |

"as"

"Imi" return IMI;



"Spui" |

"spune" |

"Spune" |

"Spune-mi" |

"spune-mi" |

"zi-mi" |

"spui" return SPUI;



"Curiozitati" |

"Curiozitatile" |

"curiozitate" |

"Curiozitate" |

"curiozitatile" |

"Informatii"      |

"informatii"  |

"Informatie"  |

"informatie"  |

"cunostinta" |

"cunostintele" |

"curiozitati" return CURIOZ;



"Stii" |

"Stiu" |

"stii" return STI;



"cunosc" |

"cunosti" return CUNOSC;



"Biologie" |

"Bio" |

"bio" |

"biologie" return BIO;



"Matematica" |

"Mate" |

"mate" |

"matematica" return MATE;





"istorie" |

"Istorie" return ISTORIE;



"Geogra" |

"geogra" |

"geografie" |

"Geografie" |

"Geo" |

"geo" {yylval.strvalue=yytext; return GEO;}



"Invata" |

"invat"

"Cum pot sa invat" |

"cum pot sa invat" |

"mi-as dori sa invat" |

"invata" {yylval.strvalue=yytext;  return INVATA;}







"Exerseaza" |

"exersez" |

"Exersez" |

"exerseaza" return EXERSEAZA;

"verific" |

"verifica" |

"verifica-mi" {yylval.strvalue=yytext; return VERIFIC;}



"tara"     |

"tari"     |	

"Anglia"   |

"Angliei"  |

"Austria"  |

"Austriei" |

"China"	   |

"Chinei"   |

"Franta"   |

"Frantei"  |

"Italia"   |

"Italiei"  |

"Peru"	   |

"Perului" |

"Romania"  |

"Romaniei" |

"Spania"   |

"Spaniei"  |

"Turcia"   |

"Turciei"  |

"Ungaria"  |

"Ungariei" |

"Greciei"  |

"Grecia"   {yylval.strvalue=strdup(yytext);  return TARA;}







"capitala"  |

"capitale"  |

"Londra"    |

"Londrei"   |

"Vienna"    |

"Vienei"    |    

"Beijing"   |

"Beijingului" |    

"Paris"     |

"Parisului" |

"Atena"     |

"Atenei"    |

"Roma"      |

"Romei"     |

"Lima"      |

"Limei"     |

"Bucuresti" |

"Bucurestiuluui" |

"Madrid"    |

"Madridului" |

"Ankara"    |

"Ankarei"   |

"Budapestei" |

"Budapesta" {yylval.strvalue=strdup(yytext);  return CAPITALA;}



"Jocuri Olimpice" |

"jocuri olimpice" |

"jocurile Olimpice" |

"jocurile olimpice" |

"Jocurile olimpice" |

"Campionatul Mondial" |

"campionatul mondial" |

"Campionat Mondial" {yylval.strvalue=yytext;  return JOCURI_OLIMPICE;}





"spune-mi capitala" |

"spune capitala" |

"scrie-mi capitala" |

"scrie capitala"  |

"furnizeaza-mi capitala" |

"furnizeaza capitala" |

"genereaza-mi capitala" |

"genereaza capitala" |

"zi-mi capitala " return ZI;





[1-9][0-9]{3}	{yylval.svalue= atoi(yytext); return AN;}

[\t\n]	;

.    ;





%%
