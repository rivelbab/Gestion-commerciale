{
   U_STOCK.PAS
   
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
        (*        Module de Gestion des Stocks                 *)
        (*                                                     *)
        (*******************************************************)


(* Enregistre les operations de gestion des Stocks *)


 UNIT   U_Stock;


 INTERFACE

 uses     crt,U_Menu;

(* Declaration des Types necessaires a sa realistaion *)

 type 	   produit = record
 
					code_prdt:string;
					designation:string;
					code_categorie:string;
					prix_achat:real;
					prix_vente:real;
					qte_stock:integer;
					stock_secu:integer;
					
					end;
					
 fichier_produits=file of produit;

			categorie=record
			
					code_cat:string;
					intitule:string;
					
					end;
					
 fichier_categorie=file of categorie;



(* 1er point: Creer un nouveau Produit *)

(* creer une categorie de produit *)

function  verifier_categorie(code_cat:string;var fct:fichier_categorie):boolean;

procedure creer_categorie(var fct:fichier_categorie);

function  designation_categorie(code_cat:string;var fct:fichier_categorie):string;

procedure afficher_categorie(var fct:fichier_categorie);

procedure liste_cetegorie(var fct:fichier_categorie);



(* creer un produit *)

function  verifier_produit(code_prdt:string;var fp:fichier_produits):boolean;

function  designation_produit(code_prdt:string;var fp:fichier_produits):string;

procedure creer_produit(var fp:fichier_produits);

(* 2e point: Consulter le stock d'un produit *)

procedure afficher_produit;

function  consulter_stock:boolean;

(* 3e point: produire l'inventaire du stock *)

(* global *)

procedure inventaire_global;

(* par categorie *)

function  appartient_categorie:boolean;

procedure inventaire_de_la_categorie;

(* 4e point: Faire la mise a jour de l'inventaire *)

procedure chercher_produit;

procedure modifier_stock;

procedure mise_a_jour_inventaire;


IMPLEMENTATION

(*************** 1er point ******************)


(* creer une categorie de produit *)

function  verifier_categorie(code_cat:string;var fct:fichier_categorie):boolean;

var        trouver:boolean;cat:categorie;

 begin

 reset(fct);
 trouver :=false;
 while (not eof(fct)) do

                       begin
                       read(fct,cat);
                       if(code_cat = cat.code_cat ) then trouver:=true;
                       end;
 
 verifier_categorie:=trouver;

 end;
(*_________________________________end _________________________________*)

procedure creer_categorie(var fct:fichier_categorie);

var           cat:categorie;i:integer;
              x:char;code:string;

   begin

   clrscr;

   assign(fct,'fichier_fcat.dat'); (* assignation du fichier *)

(**** controle erreur fichier ****)

   {$I-} reset(fct);
   if(ioresult <>0) then rewrite(fct);
   {$I+}

   textcolor(15);


   writeln;
   writeln;
   writeln;
   writeln('                     _________________________________________________');
   writeln('                     |                                               |');
   writeln('                     |       CREATION D_UNE CATEGORIE                |');
   writeln('                     |                                               |');
   writeln('                     |_______________________________________________|');
   writeln;
   writeln;
   writeln;

   i:=0;

   repeat

   i:=i+1;
   writeln('          Categorie ',i);
   writeln('          -------- ');
   writeln;writeln;
   write('code de la categorie       : ');readln(cat.code_cat);writeln;
   
   if ( verifier_categorie(cat.code_cat,fct) ) then 	begin 
														repeat
														
														writeln('Attention,ce code est deja occupe !');
														writeln;write('Changer le : ');
														readln(code);writeln;
														
														until (code <> cat.code_cat);
														cat.code_cat:=code;
													end;  writeln;														


   write('nom de la categorie        : ');readln(cat.intitule); writeln;

   write(fct,cat);
   writeln;writeln;writeln;
   write('Creer une autre Categorie:(''O'' =>oui) ou (''N'' =>non) : ');
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

   menu_produit;

   close(fct);

   end;

(*_________________________________end__________________________________*)

function  designation_categorie(code_cat:string;var fct:fichier_categorie):string;

var        cat:categorie;intitule:string;

 begin
 
 intitule:=' ';
 reset(fct);
 
 while (not eof(fct)) do

                       begin
                       read(fct,cat);
                       if(code_cat = cat.code_cat ) then begin 
															intitule:=cat.intitule;															
														  end;
                       end;

 
 designation_categorie:=intitule ;
  
 end;

(*_______________________________end______________________________________*)

procedure afficher_categorie(var fct:fichier_categorie);

var        cat:categorie;

   begin

   read(fct,cat);

   writeln('code de la categorie       : ',cat.code_cat);writeln;
   writeln('intitule de la categorie   : ',cat.intitule);writeln;
   writeln;

   end;

(*_______________________________end___________________________________________*)

procedure liste_cetegorie(var fct:fichier_categorie);

var        i:integer;

   begin


   highvideo;

   clrscr;
   reset(fct);

   writeln;
   writeln;
   writeln;
   writeln;
   writeln('               ______________________________________');
   writeln('               |                                    |');
   writeln('               |      LISTE DES CATEGORIES          |');
   writeln('               |                                    |');
   writeln('               |____________________________________|');
   writeln;writeln;writeln;

   i:=1;

   while (not eof(fct)) do

   begin

   writeln('    categorie   ',i);
   writeln('    ---------    ');
   writeln;

   afficher_categorie(fct);

   i:=i+1;

   end;

   writeln;writeln;
   writeln('taper <ENTRER> pour repartir au menu principal');
   readln;
   menu_produit;

   close(fct);

   end;

(*______________________________end____________________________________*)

(* creer un produit *)

function  verifier_produit(code_prdt:string;var fp:fichier_produits):boolean;

var        trouver:boolean;p:produit;

 begin

 reset(fp);
 trouver :=false;
 while (not eof(fp)) do

                       begin
                       read(fp,p);
                       if(code_prdt = p.code_prdt ) then trouver:=true;
                       end;

 verifier_produit:=trouver;

 end;

(*_______________________________end___________________________________*)

function  designation_produit(code_prdt:string;var fp:fichier_produits):string;

var        p:produit;designation:string;

 begin
 
 designation:=' ';
 reset(fp);
 
 while (not eof(fp)) do

                       begin
                       read(fp,p);
                       if(code_prdt = p.code_prdt ) then begin 
															designation:=p.designation;															
														  end;
                       end;

 
 designation_produit:=designation ;
  
 end;

(*_______________________________end______________________________________*)


procedure creer_produit(var fp:fichier_produits);

var          p:produit;i:integer;
              x:char;code:string;

   begin

   clrscr;

   assign(fp,'fichier_prod.dat'); (* assignation du fichier *)

(**** controle erreur fichier ****)

   {$I-} reset(fp);
   if(ioresult <>0) then rewrite(fp);
   {$I+}

   textcolor(15);


   writeln;
   writeln;
   writeln;
   writeln('                     _________________________________________________');
   writeln('                     |                                               |');
   writeln('                     |           CREATION DES PRODUITS               |');
   writeln('                     |                                               |');
   writeln('                     |_______________________________________________|');
   writeln;
   writeln;
   writeln;

   i:=0;

   repeat

   i:=i+1;
   writeln('          Produit ',i);
   writeln('          ------- ');
   writeln;writeln;
   write('code du produit            : ');readln(p.code_prdt);writeln;
   
   if ( verifier_produit(p.code_prdt,fp) ) then 	begin 
														repeat
														
														writeln('Attention,ce code est deja occupe !');
														writeln;write('Changer le : ');
														readln(code);writeln;
														
														until (code <> p.code_prdt);
														p.code_prdt:=code;
													end;  writeln;														


   write('designation du produit     : ');readln(p.designation); writeln;
   write('code_categorie du produit  : ');readln(p.code_categorie);writeln;
   write('Prix_achat du produit      : ');readln(p.prix_achat);writeln;
   write('Prix_vente du produit      : ');readln(p.prix_vente);writeln;
   write('Quantite_stock du produit  : ');readln(p.qte_stock);writeln;
   write('Stock de securite          : ');readln(p.stock_secu);

   write(fp,p);
   writeln;writeln;writeln;
   write('continuer ? :(''O'' =>oui) ou (''N'' =>non) : ');
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

   menu_produit;

   close(fp);

   end;

(*___________________________________end_______________________________*)

(***************** 2e point:***********************)

procedure afficher_produit;

begin

end;

function  consulter_stock:boolean;

var x:boolean;

begin

x:=false;

consulter_stock:=x;

end;

(***************** 3e point:**********************)

(* global *)

procedure inventaire_global;

begin

end;

(* par categorie *)

function  appartient_categorie:boolean;

var x:boolean;

begin

x:=false;
appartient_categorie:=x;

end;

procedure inventaire_de_la_categorie;

begin

end;

(****************** 4e point:*******************)

procedure chercher_produit;

begin

end;

procedure modifier_stock;

begin

end;

procedure mise_a_jour_inventaire;

begin

end;

(*------------------------------------------------*)

BEGIN

END.














































