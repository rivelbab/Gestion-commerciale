{
   U_ACHAT.PAS
   
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
        (*        Module de Gestion des Achats                 *)
        (*                                                     *)
        (*******************************************************)


(* Enregistre les operations de gestion des Achats *)


 UNIT   U_Achat;


 INTERFACE

 uses     crt,U_Menu,U_Vente,U_Stock;

(* Declaration des Types necessaires a sa realistaion *)

type      fournisseur = record

                        code_fr       :string[10];
                        adresse_fr    :string[20];
                        code_postal_fr:string[10];
                        ville_fr      :string[20];
                        tel_fr        :string[10];

                        end;
                        
            produit_achete = record
          
							code_prdt_ach:string;
							qte_achete     :integer;
							num_facture  :string;
							prix_achat   :integer;
							code_fournisseur:string;
							date_achat   :string;
							prix_unit    :integer;
							
						  end;


		 fichier_produit_achete=file of produit_achete;

         f_fournisseur=file of fournisseur;


(* 1er point: Enregistrer un nouveau Fournisseur *)

function  verifier_fournisseur(code_fr:string;var ff:f_fournisseur):boolean;

procedure creer_fournisseur(var ff:f_fournisseur);

(* 2e point: Afficher le Liste des Fournisseurs *)

procedure afficher_fournisseur(var ff:f_fournisseur);

procedure afficher_liste_fournisseur(var ff:f_fournisseur);

(* 3e point: Enregistrer les factures d'achat  *)

procedure creer_produit_achete(var fa:fichier_produit_achete);

procedure augmenter_stock(code_produit:string;qte_achete:integer;prix_achat:real;var fp:fichier_produits);

procedure enregistrer_facture_achat;

(* 4e point: Afiicher les statistiques Fournisseurs *)

function  depense_fournisseur:real;

procedure statistique_fournisseur;


 IMPLEMENTATION


 (******************** 1er point *******************)

 function verifier_fournisseur(code_fr:string;var ff:f_fournisseur):boolean;

 var      trouver:boolean;f:fournisseur;

 begin

 reset(ff);
 trouver :=false;
 while (not eof(ff)) do

                       begin
                       read(ff,f);
                       if(code_fr = f.code_fr ) then trouver:=true;
														
                       end;
 
 verifier_fournisseur:=trouver;

 end;

 procedure creer_fournisseur(var ff:f_fournisseur);

 var        f:fournisseur;i:integer;
              x:char;code:string;

   begin

   clrscr;

   assign(ff,'fichier_fr.dat');

(**** controle erreur fichier ****)

   {$I-} reset(ff);
   if(ioresult <>0) then rewrite(ff);
   {$I+}

   textcolor(15);


   writeln;
   writeln;
   writeln;
   writeln('                     _________________________________________________');
   writeln('                     |                                               |');
   writeln('                     |       ENREGISTREMENT DES FOURNISSEURS         |');
   writeln('                     |                                               |');
   writeln('                     |_______________________________________________|');
   writeln;
   writeln;
   writeln;

   i:=0;

   repeat

   i:=i+1;
   writeln('          fournisseur ',i);
   writeln('          ----------- ');
   writeln;writeln;
   write('code du fournisseur        : ');readln(f.code_fr);writeln;
   
   if ( verifier_fournisseur(f.code_fr,ff) ) then 	begin 
														repeat
														
														writeln('Attention,ce code est deja occupe !');
														writeln;write('Changer le : ');
														readln(code);writeln;
														
														until (code <> f.code_fr);
														f.code_fr:=code;
													end;  writeln;														

   write('Adresse du fournisseur     : ');readln(f.adresse_fr); writeln;
   write('code_postal du fournisseur : ');readln(f.code_postal_fr);writeln;
   write('ville du fournisseur       : ');readln(f.ville_fr);writeln;
   write('Tel du fournisseur         : ');readln(f.tel_fr);writeln;

   write(ff,f);
   writeln;writeln;writeln;
   write('enregistrer un autre fournisseur:(''O'' =>oui) ou (''N'' =>non) : ');
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

   menu_achat;

   close(ff);

   end;


(******************** 2e point ***********************)

procedure afficher_fournisseur(var ff:f_fournisseur);

var        f:fournisseur;

   begin

   read(ff,f);

   writeln('code du fournisseur        : ',f.code_fr);writeln;
   writeln('adresse du fournisseur     : ',f.adresse_fr);writeln;
   writeln('code_postal du fournisseur : ',f.code_postal_fr);writeln;
   writeln('ville du fournisseur       : ',f.ville_fr);writeln;
   writeln('Tel du fournisseur         : ',f.tel_fr); writeln;writeln;
   writeln(' fin d''information');writeln;writeln;

   end;


procedure afficher_liste_fournisseur(var ff:f_fournisseur);

var        i:integer;

   begin


   highvideo;

   clrscr;
   reset(ff);

   writeln;
   writeln;
   writeln;
   writeln;
   writeln('               ______________________________________');
   writeln('               |                                    |');
   writeln('               |      LISTE DES FOURNISSEURS        |');
   writeln('               |                                    |');
   writeln('               |____________________________________|');
   writeln;writeln;writeln;

   i:=1;

   while (not eof(ff)) do

   begin

   writeln('    fournisseur ',i);
   writeln('    -----------   ');
   writeln;

   afficher_fournisseur(ff);

   i:=i+1;

   end;

   writeln;writeln;
   writeln('taper <ENTRER> pour repartir au menu principal');
   readln;
   menu_achat;

   close(ff);

   end;


(******************** 3e point ************************)

procedure creer_produit_achete(var fa:fichier_produit_achete);

{var       pa:produit_achete;i:integer;
		    ff:f_fournisseur;f:fournisseur;
		    fp:fichier_produits;}
            

   begin

	textcolor(15);
	assign(fa,'fichier_pa.dat');

(**** controle erreur fichier ****)

   {$I-} reset(fa);
   if(ioresult <>0) then rewrite(fa);
   {$I+}

   {__________________________affichage de la facture ___________________________}
   
	
   
   
   close(fa);

   end;
(*________________________end______________________________*)

procedure augmenter_stock(code_produit:string;qte_achete:integer;prix_achat:real;var fp:fichier_produits);

var      trouver:boolean;p:produit;

 begin

 reset(fp);
 trouver :=false;
 while (not eof(fp)) do

                       begin
                       read(fp,p);
                       if(code_produit = p.code_prdt ) then trouver:=true;
                       end;

 if (trouver=true) then begin
                         p.qte_stock := (p.qte_stock + qte_achete);
                         p.prix_achat:= ((p.prix_achat+prix_achat)/2);
                        end;


 end;

{______________________facture _________________________________}

procedure enregistrer_facture_achat;

var    		ff:f_fournisseur;   f:fournisseur;
		    fp:fichier_produits;p:produit;
		    fa:fichier_produit_achete;pa:produit_achete;


begin

clrscr;


textcolor(15);

gotoxy(5,5);   	writeln('___________________________________________________________');
gotoxy(15,8);  	writeln('Facture n° : ');
gotoxy(25,8);	readln(pa.num_facture);
gotoxy(45,10);	writeln('Libreville,le ');
gotoxy(60,10);	readln(pa.date_achat);
gotoxy(25,12);  writeln('Code Fournisseur :  ');
gotoxy(45,12);  readln(f.code_fr);
	
if(verifier_fournisseur(f.code_fr,ff)) then begin 
														
												gotoxy(25,14); write('BP : ',f.code_postal_fr);
												gotoxy(45,14); write(f.ville_fr);
												gotoxy(25,16); write('Tel : ',f.tel_fr);
												gotoxy(45,16); write(f.adresse_fr); 
																								
											end;
gotoxy(5,18);   writeln('___________________________________________________________');


 menu_achat;

end;

(********************** 4e point *************************)

function depense_fournisseur:real;

var      depense:real;

begin

depense:=0;
depense_fournisseur := depense;

end;

procedure statistique_fournisseur;

begin

clrscr;

 writeln(' Statistique fournisseur');
 writeln;writeln;
 writeln(' Taper <ENTRER> pour sortir ');
 readln;

 menu_achat;

end;


(*------------------------------------------------------------*)

BEGIN

END.


