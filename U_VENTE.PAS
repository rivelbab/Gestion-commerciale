{
   U_VENTE.PAS
   
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
        (*        Module de Gestion des Ventes                 *)
        (*                                                     *)
        (*******************************************************)


(* Enregistre les operations de gestion des Ventes *)


 UNIT   U_Vente;


 INTERFACE

 uses     crt,U_Menu;

(* Declaration des Types necessaires a sa realistaion *)

type
           client = record

					code_cl       :string[10];
					adresse_cl    :string[20];
					code_postal_cl:string[10];					
					ville_cl      :string[20];
					tel_cl        :string[10];

				  end;
           
           


           f_client = file of client;




(* 1er point: Enregistrer un nouveau Client *)

function  verifier_client(code_cl:string;var fc:f_client): boolean;

procedure creer_client(var fc:f_client);

(* 2e point: Afficher la liste des Clients *)

procedure afficher_client(var fc:f_client);

procedure afficher_liste_client(var fc:f_client);

(* 3e point: Enregistrer les produits achetes et produire les Factures *)

procedure creer_produit_vendu;

procedure diminuer_stock;

procedure enregistrer_facture_vente;

(* 4e point: Donner le chiffre d'affaire journalier *)

(* Global *)

     function  chiffre_aff_global:real;

(* par produit *)

     function  chiffre_aff_du_produit:real;

     procedure chiffre_aff_par_produit;

(* par categorie *)

     function  chiffre_de_la_categorie:real;

     procedure chiffre_aff_par_categorie;

(* par client

     function  chiffre_aff_du_client:real;

     function  chiffre_aff_par_client:real; *)

(* 5e point: Produire les Statistiques de ventes *)

(* par Client *)

     function ventes_client:real;

     procedure statistique_client;

(* par produit *)

     procedure vente_du_produit;

     procedure statistique_produit;

(* par categorie *)

     function vente_de_la_categorie:real;

     procedure statistique_categorie;


IMPLEMENTATION


(***************** 1er point **********************)

function verifier_client(code_cl:string;var fc:f_client):boolean;

var      trouver:boolean;c:client;

 begin

 reset(fc);
 trouver :=false;
 while (not eof(fc)) do

                       begin
                       read(fc,c);
                       if(code_cl = c.code_cl ) then trouver:=true;
                       end;

 verifier_client:=trouver;

 end;

(*________________________end_____________________________________*)

procedure creer_client(var fc:f_client);

var        c:client;i:integer;
            x:char;code:string;

   begin

   clrscr;

   assign(fc,'fichier_cl.dat'); (* assignation du ficher fc *)

(**** controle erreur fichier ****)

   {$I-} reset(fc);
   if(ioresult <>0) then rewrite(fc);
   {$I+}

   textcolor(15);


   writeln;
   writeln;
   writeln;
   writeln('                     _________________________________________________');
   writeln('                     |                                               |');
   writeln('                     |           ENREGISTREMENT DES CLIENTS          |');
   writeln('                     |                                               |');
   writeln('                     |_______________________________________________|');
   writeln;
   writeln;
   writeln;

   i:=0;

   repeat

   i:=i+1;
   writeln('          Client ',i);
   writeln('          ------ ');
   writeln;writeln;
   write('code du client        : ');readln(c.code_cl);writeln;
   
   if ( verifier_client(c.code_cl,fc) ) then 	begin 
														repeat
														
														writeln('Attention,ce code est deja occupe !');
														writeln;write('Changer le : ');
														readln(code);writeln;
														
														until (code <> c.code_cl);
														c.code_cl:=code;
													end;  writeln;														


   write('Adresse du client     : ');readln(c.adresse_cl); writeln;
   write('code_postal du client : ');readln(c.code_postal_cl);writeln;
   write('ville du client       : ');readln(c.ville_cl);writeln;
   write('Tel du client         : ');readln(c.tel_cl);

   write(fc,c);
   writeln;writeln;writeln;
   write('continuer? :(''O'' =>oui) ou (''N'' =>non) : ');
   readln(x);writeln;writeln;

   while (x<>'o') and (x<>'n') do

   begin
   write('error, taper ''O'' pour OUI ou ''N'' pour NON  : ');
   readln(x);writeln;
   end;

   until (x= 'n');

   writeln('Sauvegarde Terminer');
   writeln;writeln;
   writeln('taper <ENTRER> pour sortir ');
   readln;

   menu_vente;

   close(fc);

   end;

(*_________________________________end____________________________*)

(**************** 2e point ************************)

procedure afficher_client(var fc:f_client);

var        c:client;

   begin

   read(fc,c);

   writeln('code du client        : ',c.code_cl);writeln;
   writeln('adresse du client     : ',c.adresse_cl);writeln;
   writeln('code_postal du client : ',c.code_postal_cl);writeln;
   writeln('ville du client       : ',c.ville_cl);writeln;
   writeln('Tel du client         : ',c.tel_cl); writeln;writeln;
   writeln(' fin d''information');writeln;writeln;

   end;



procedure afficher_liste_client(var fc:f_client);

var        i:integer;

   begin


   highvideo;

   clrscr;
   reset(fc);

   writeln;
   writeln;
   writeln;
   writeln;
   writeln('               ______________________________________');
   writeln('               |                                    |');
   writeln('               |           LISTE DES CLIENTS        |');
   writeln('               |                                    |');
   writeln('               |____________________________________|');
   writeln;writeln;writeln;

   i:=1;

   while (not eof(fC)) do

   begin

   writeln('    client ',i);
   writeln('    ------   ');
   writeln;

   afficher_client(fc);

   i:=i+1;

   end;

   writeln;writeln;
   writeln('taper <ENTRER> pour repartir au menu principal');
   readln;
   menu_achat;

   close(fc);

   end;

(*__________________________________end_______________________________________*)

(**************** 3e point ************************)

procedure creer_produit_vendu;

begin

end;

procedure diminuer_stock;

begin

end;

procedure enregistrer_facture_vente;

begin

clrscr;

 writeln(' Facture Vente ');
 writeln;writeln;
 writeln(' Taper <ENTRER> pour sortir ');
 readln;

 menu_vente;

end;

(**************** 4e point **************************)

(* Global *)

     function  chiffre_aff_global:real;
     
     var x:real;

     begin

     clrscr;
	x:=0;
     writeln(' Chiffre Global ');
     writeln;writeln;
     writeln(' Taper <ENTRER> pour sortir ');
     chiffre_aff_global:=x;     

     menu_chiffre_affaire;

	readkey;
     end;

(* par produit *)

     function  chiffre_aff_du_produit:real;

     var       chiffre:real;

     begin
     
     chiffre:=0;

     chiffre_aff_du_produit:=chiffre;

     end;

     procedure chiffre_aff_par_produit;

     begin

      clrscr;

      writeln(' Chiffre Aff Par Produit ');
      writeln;writeln;
      writeln(' Taper <ENTRER> pour sortir ');
      readln;

      menu_chiffre_affaire;

     end;

(* par categorie *)

     function  chiffre_de_la_categorie:real;

     var       chiffre:real;

     begin
     
     chiffre:=0;

     chiffre_de_la_categorie:=chiffre;

     end;

     procedure chiffre_aff_par_categorie;

     begin

         clrscr;

     writeln(' Chiffre Aff Par Categorie ');
     writeln;writeln;
     writeln(' Taper <ENTRER> pour sortir ');
     readln;

     menu_chiffre_affaire;

     end;

(* par client

     function  chiffre_aff_du_client:real;

     var       chiffre:real;

     begin

     chiffre_aff_du_client:=chiffre;

     end;

     function  chiffre_aff_par_client:real;

     var       chiffre:real;

     begin

     chiffre_aff_par_client:=chiffre;

     end; *)

(* 5e point: Produire les Statistiques de ventes *)

(* par Client *)

     function ventes_client:real;
     
     var x:real;

     begin
     
     x:=0;
     ventes_client:=x;

     end;

     procedure statistique_client;

     begin

     clrscr;

      writeln(' Statistique client ');
      writeln;writeln;
      writeln(' Taper <ENTRER> pour sortir ');
      readln;

      menu_statistique_vente;

     end;

(* par produit *)

     procedure vente_du_produit;

     begin

     end;

     procedure statistique_produit;

     begin

     clrscr;

      writeln(' Statistique produit ');
      writeln;writeln;
      writeln(' Taper <ENTRER> pour sortir ');
      readln;

      menu_statistique_vente;

     end;

(* par categorie *)

     function vente_de_la_categorie:real;
     
     var x:real;

     begin
	
	x:=0;
	vente_de_la_categorie:=x;
     end;

     procedure statistique_categorie;

     begin

     clrscr;

      writeln(' Statistique categorie ');
      writeln;writeln;
      writeln(' Taper <ENTRER> pour sortir ');
      readln;

      menu_statistique_vente;

     end;

(*--------------------------------------------------------------*)

BEGIN

END.



























































































