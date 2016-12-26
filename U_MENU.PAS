{
   U_MENU.PAS
   
   Copyright 2014 rivelnet <rivelnet@rivelnet-Aspire-5733Z>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}




        (*******************************************************)
        (*                                                     *)
        (*        Institut Africain d'Informatique             *)
        (*                                                     *)
        (*        Micro-application de Gestion commerciale     *)
        (*                                                     *)
        (*        Utilisataion  des fichiers Binaire & text    *)
        (*                                                     *)
        (*        Cycle : AP 2 => 2013/2014                    *)
        (*                                                     *)
        (*        Module de Gestion des Menus                  *)
        (*                                                     *)
        (*******************************************************)


(* definie tous les menus du micro-app*)


 UNIT   U_Menu;


 INTERFACE

 uses     crt;

 procedure menu_principal;

 procedure menu_achat;

 procedure menu_vente;

 procedure menu_stock;

 procedure menu_chiffre_affaire;

 procedure menu_statistique_vente;

 procedure menu_inventaire;
 
 procedure menu_produit;

 IMPLEMENTATION


procedure menu_principal;

var
    a,v,s,e : string;

begin

clrscr;

a:='1.Gestion_Achat';
v:='2.Gestion_Vente';
s:='3.Gestion_Stocks';
e:='4.Exit' ;


               textcolor(15);
               textbackground(0);
gotoxy(30,6);                         writeln('GESTION COMMERCIALE');
gotoxy(8,11);  textcolor(4);          write(a[1]);
               textcolor(15);         write('.Gestion_Achat');
               textbackground(0);     write('      ');
               textcolor(4);          write(v[1]);
               textcolor(15);         write('.Gestion_Vente');
               textbackground(0);     write('      ');
               textcolor(4);          write(s[1]);
               textcolor(15);         write('.Gestion_Stocks');
               textbackground(0);     write('    ');
               textcolor(4);          write(e[1]);
               textcolor(15);         write('.Exit');
               textbackground(0);
               textcolor(2);

gotoxy(5,9);   write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,13);  textcolor(2);

               write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,10);   textcolor(2);writeln('*');
gotoxy(5,11);                writeln('*');
gotoxy(5,12);                writeln('*');
gotoxy(77,10);  textcolor(1);writeln('*');
gotoxy(77,11);               writeln('*');
gotoxy(77,12);               writeln('*');
gotoxy(28,4);  textcolor(14);writeln('************************');
gotoxy(28,5);  textcolor(14);writeln('*');
gotoxy(28,6);                writeln('*');
gotoxy(28,7);                writeln('*');
gotoxy(28,8);                writeln('*');
gotoxy(51,5);                writeln('*');
gotoxy(51,6);                writeln('*');
gotoxy(51,7);                writeln('*');
gotoxy(51,8);                writeln('*');
textcolor(15);
gotoxy(4,17);

end;



 procedure menu_achat;

var
    n,l,f,s,r : string;

begin

clrscr;

n:='1.Nouveau_Fr';
l:='2.Liste_Fr';
f:='3.Facture_Achat';
s:='4.Statistique_Fr';
r:='5.Retour';

               textcolor(15);
               textbackground(0);
gotoxy(30,6);                         writeln('GESTION des ACHATS');
gotoxy(6,11);  textcolor(4);          write(n[1]);
               textcolor(15);         write('.Nouveau_Fr');
               textbackground(0);     write('  ');
               textcolor(4);          write(l[1]);
               textcolor(15);         write('.Liste_Fr');
               textbackground(0);     write('  ');
               textcolor(4);          write(f[1]);
               textcolor(15);         write('.Facture_Achat');
               textbackground(0);     write('  ');
               textcolor(4);          write(s[1]);
               textcolor(15);         write('.Statistique_Fr');
               textbackground(0);     write('  ');
               textcolor(4);          write(r[1]);
               textcolor(15);         write('.Retour');
               textcolor(2);

gotoxy(5,9);   write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,13);  textcolor(2);

               write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,10);   textcolor(2);writeln('*');
gotoxy(5,11);                writeln('*');
gotoxy(5,12);                writeln('*');
gotoxy(77,10);  textcolor(1);writeln('*');
gotoxy(77,11);               writeln('*');
gotoxy(77,12);               writeln('*');
gotoxy(28,4);  textcolor(14);writeln('************************');
gotoxy(28,5);  textcolor(14);writeln('*');
gotoxy(28,6);                writeln('*');
gotoxy(28,7);                writeln('*');
gotoxy(28,8);                writeln('*');
gotoxy(51,5);                writeln('*');
gotoxy(51,6);                writeln('*');
gotoxy(51,7);                writeln('*');
gotoxy(51,8);                writeln('*');
textcolor(15);
gotoxy(4,17);

end;


 procedure menu_vente;

 var
    n,l,f,c,s,r : string;

begin

clrscr;

n:='1.Nouveau_Client';
l:='2.Liste_Client';
f:='3.Facture_Vente';
c:='4.Chiffre_Affaire/j';
s:='5.Statistique_Vente';
r:='6.Retour';

               textcolor(15);
               textbackground(0);
gotoxy(30,6);                         writeln('GESTION des VENTES');
gotoxy(8,11);  textcolor(4);          write(n[1]);
               textcolor(15);         write('.Nouveau_Client');
               textbackground(0);     write('       ');
               textcolor(4);          write(l[1]);
               textcolor(15);         write('.Liste_Client');
               textbackground(0);     write('             ');
               textcolor(4);          write(f[1]);
               textcolor(15);         write('.Facture_Vente');
               textbackground(0);     write('         ');
gotoxy(8,14);  textcolor(4);          write(c[1]);
               textcolor(15);         write('.Chiffre_Affaire/j');
               textbackground(0);     write('    ');
               textcolor(4);          write(s[1]);
               textcolor(15);         write('.Statistique_Vente');
               textbackground(0);     write('       ');
               textcolor(4);          write(r[1]);
               textcolor(15);         write('.Retour');
               textcolor(2);

gotoxy(5,9);   write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,17);  textcolor(2);

               write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,10);   textcolor(2);writeln('*');
gotoxy(5,11);                writeln('*');
gotoxy(5,12);                writeln('*');
gotoxy(5,13);                writeln('*');
gotoxy(5,14);                writeln('*');
gotoxy(5,15);                writeln('*');
gotoxy(5,16);                writeln('*');
gotoxy(5,17);                writeln('*');
gotoxy(77,10);  textcolor(1);writeln('*');
gotoxy(77,11);               writeln('*');
gotoxy(77,12);               writeln('*');
gotoxy(77,13);               writeln('*');
gotoxy(77,14);               writeln('*');
gotoxy(77,15);               writeln('*');
gotoxy(77,16);               writeln('*');
gotoxy(77,17);               writeln('*');
gotoxy(28,4);  textcolor(14);writeln('************************');
gotoxy(28,5);  textcolor(14);writeln('*');
gotoxy(28,6);                writeln('*');
gotoxy(28,7);                writeln('*');
gotoxy(28,8);                writeln('*');
gotoxy(51,5);                writeln('*');
gotoxy(51,6);                writeln('*');
gotoxy(51,7);                writeln('*');
gotoxy(51,8);                writeln('*');
textcolor(15);
gotoxy(4,17);

end;



 procedure menu_stock;

 var
    n,c,i,m,r : string;

begin

clrscr;

n:='1.Produit';
c:='2.Consulter_Stock';
i:='3.Inventaire';
m:='4.Mise_a_Jour';
r:='5.Retour';

               textcolor(15);
               textbackground(0);
gotoxy(30,6);                         writeln('GESTION des STOCKS');
gotoxy(6,11);  textcolor(4);          write(n[1]);
               textcolor(15);         write('.Produit');
               textbackground(0);     write('  ');
               textcolor(4);          write(c[1]);
               textcolor(15);         write('.Consulter_Stock');
               textbackground(0);     write('  ');
               textcolor(4);          write(i[1]);
               textcolor(15);         write('.Iventaire');
               textbackground(0);     write('  ');
               textcolor(4);          write(m[1]);
               textcolor(15);         write('.Mise_a_Jour');
               textbackground(0);     write('  ');
               textcolor(4);          write(r[1]);
               textcolor(15);         write('.Retour');
               textcolor(2);

gotoxy(3,9);   write('*************************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(3,13);  textcolor(2);

               write('*************************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(3,10);   textcolor(2);writeln('*');
gotoxy(3,11);                writeln('*');
gotoxy(3,12);                writeln('*');
gotoxy(77,10);  textcolor(1);writeln('*');
gotoxy(77,11);               writeln('*');
gotoxy(77,12);               writeln('*');
gotoxy(28,4);  textcolor(14);writeln('************************');
gotoxy(28,5);  textcolor(14);writeln('*');
gotoxy(28,6);                writeln('*');
gotoxy(28,7);                writeln('*');
gotoxy(28,8);                writeln('*');
gotoxy(51,5);                writeln('*');
gotoxy(51,6);                writeln('*');
gotoxy(51,7);                writeln('*');
gotoxy(51,8);                writeln('*');
textcolor(15);
gotoxy(4,17);

end;

procedure menu_chiffre_affaire;

var
    g,c,p,r : string;

begin

clrscr;

g:='1.Global';
c:='2.Par Categorie de Produit';
p:='3.Par Produit';
r:='4.Retour';

               textcolor(15);
               textbackground(0);
gotoxy(30,6);                         writeln('CHIFFRE D''AFFAIRE');
gotoxy(8,11);  textcolor(4);          write(g[1]);
               textcolor(15);         write('.Global');
               textbackground(0);     write('    ');
               textcolor(4);          write(c[1]);
               textcolor(15);         write('.Par Categorie de Produit');
               textbackground(0);     write('    ');
               textcolor(4);          write(p[1]);
               textcolor(15);         write('.Par Produit');
               textbackground(0);     write('    ');
               textcolor(4);          write(r[1]);
               textcolor(15);         write('.Retour');
               textcolor(2);

gotoxy(5,9);   write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,13);  textcolor(2);

               write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,10);   textcolor(2);writeln('*');
gotoxy(5,11);                writeln('*');
gotoxy(5,12);                writeln('*');
gotoxy(77,10);  textcolor(1);writeln('*');
gotoxy(77,11);               writeln('*');
gotoxy(77,12);               writeln('*');
gotoxy(28,4);  textcolor(14);writeln('************************');
gotoxy(28,5);  textcolor(14);writeln('*');
gotoxy(28,6);                writeln('*');
gotoxy(28,7);                writeln('*');
gotoxy(28,8);                writeln('*');
gotoxy(51,5);                writeln('*');
gotoxy(51,6);                writeln('*');
gotoxy(51,7);                writeln('*');
gotoxy(51,8);                writeln('*');
textcolor(15);
gotoxy(4,17);

end;


procedure menu_statistique_vente;

var
    g,c,p,r : string;

begin

clrscr;

g:='1.Par Client';
c:='2.Par Produit';
p:='3.Par Categorie de Produit';
r:='4.Retour';

               textcolor(15);
               textbackground(0);
gotoxy(30,6);                         writeln('STATISTIQUE de VENTE');
gotoxy(8,11);  textcolor(4);          write(g[1]);
               textcolor(15);         write('.Par Client');
               textbackground(0);     write('   ');
               textcolor(4);          write(c[1]);
               textcolor(15);         write('.Par Produit');
               textbackground(0);     write('   ');
               textcolor(4);          write(p[1]);
               textcolor(15);         write('.Par Categorie de Produit');
               textbackground(0);     write('   ');
               textcolor(4);          write(r[1]);
               textcolor(15);         write('.Retour');
               textcolor(2);

gotoxy(5,9);   write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,13);  textcolor(2);

               write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,10);   textcolor(2);writeln('*');
gotoxy(5,11);                writeln('*');
gotoxy(5,12);                writeln('*');
gotoxy(77,10);  textcolor(1);writeln('*');
gotoxy(77,11);               writeln('*');
gotoxy(77,12);               writeln('*');
gotoxy(28,4);  textcolor(14);writeln('************************');
gotoxy(28,5);  textcolor(14);writeln('*');
gotoxy(28,6);                writeln('*');
gotoxy(28,7);                writeln('*');
gotoxy(28,8);                writeln('*');
gotoxy(51,5);                writeln('*');
gotoxy(51,6);                writeln('*');
gotoxy(51,7);                writeln('*');
gotoxy(51,8);                writeln('*');
textcolor(15);
gotoxy(4,17);

end;


procedure menu_inventaire;

var
    g,c,r : string;

begin

clrscr;

g:='1.Inventaire Global';
c:='2.Inventaire Par Categorie';
r:='3.Retour';

               textcolor(15);
               textbackground(0);
gotoxy(30,6);                         writeln('     INVENTAIRE  ');
gotoxy(8,11);  textcolor(4);          write(g[1]);
               textcolor(15);         write('.Inventaire Global');
               textbackground(0);     write('    ');
               textcolor(4);          write(c[1]);
               textcolor(15);         write('.Inventaire Par Categorie');
               textbackground(0);     write('    ');
               textcolor(4);          write(r[1]);
               textcolor(15);         write('.Retour');
               textcolor(2);

gotoxy(5,9);   write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,13);  textcolor(2);

               write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,10);   textcolor(2);writeln('*');
gotoxy(5,11);                writeln('*');
gotoxy(5,12);                writeln('*');
gotoxy(77,10);  textcolor(1);writeln('*');
gotoxy(77,11);               writeln('*');
gotoxy(77,12);               writeln('*');
gotoxy(28,4);  textcolor(14);writeln('************************');
gotoxy(28,5);  textcolor(14);writeln('*');
gotoxy(28,6);                writeln('*');
gotoxy(28,7);                writeln('*');
gotoxy(28,8);                writeln('*');
gotoxy(51,5);                writeln('*');
gotoxy(51,6);                writeln('*');
gotoxy(51,7);                writeln('*');
gotoxy(51,8);                writeln('*');
textcolor(15);
gotoxy(4,17);

end;

procedure menu_produit;

var
    c,l,p,s : string;

begin

clrscr;

c:='1.Creer_categorie';
l:='2.Liste_Categorie';
p:='3.Creer_produit' ;
s:='4.Retour';


               textcolor(15);
               textbackground(0);
gotoxy(30,6);                         writeln('NOUVEAU  PRODUIT');
gotoxy(8,11); textcolor(4);          write(c[1]);
               textcolor(15);         write('.Creer_categorie');
               textbackground(0);     write('  ');                   
			   textcolor(4);          write(l[1]);
               textcolor(15);         write('.Liste_categorie');
               textbackground(0);     write('  ');
		   	   textcolor(4);          write(p[1]);
               textcolor(15);         write('.Creer_Produit');
               textbackground(0);	  write('  ');
               textcolor(4);		  write(s[1]);
               textcolor(15);		  write('.Retour');
               textbackground(0);	
               textcolor(2);

gotoxy(5,9);   write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,14);  textcolor(2);

               write('***********************');
               textcolor(14);
               write('************************');
               textcolor(1);
               writeln('**************************');
gotoxy(5,10);   textcolor(2);writeln('*');
gotoxy(5,11);                writeln('*');
gotoxy(5,12);                writeln('*');
gotoxy(5,13);                writeln('*');
gotoxy(77,10);  textcolor(1);writeln('*');
gotoxy(77,11);               writeln('*');
gotoxy(77,12);               writeln('*');
gotoxy(77,13);               writeln('*');
gotoxy(28,4);  textcolor(14);writeln('************************');
gotoxy(28,5);  textcolor(14);writeln('*');
gotoxy(28,6);                writeln('*');
gotoxy(28,7);                writeln('*');
gotoxy(28,8);                writeln('*');
gotoxy(51,5);                writeln('*');
gotoxy(51,6);                writeln('*');
gotoxy(51,7);                writeln('*');
gotoxy(51,8);                writeln('*');
textcolor(15);
gotoxy(4,17);

end;


 (*--------------------------------------------------*)

 BEGIN

 END.
