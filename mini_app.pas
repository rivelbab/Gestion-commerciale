{
   mini_app.pas
   
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
        (*        Module du programme principal                *)
        (*                                                     *)
        (*******************************************************)


(* Etablie les connections entres differentes procedures et fonctions *)

PROGRAM   Micro_App;

Uses      crt,U_Menu,U_Achat,U_Vente,U_Stock;

{_________________ Declaration des variables __________________________}

var
          ff:f_fournisseur;fp:fichier_produits;fct:fichier_categorie;
          fc:f_client;{fa:fichier_produit_achete;}

          x,x1,x2,x3,x21,x22,x31,x32 :integer;

          bon , bon1 , bon2  :boolean;

{________________ Fin de declaration et debut d'instruction executable__}

BEGIN

clrscr;

(* assignation des fichiers *)

textbackground(0);

menu_principal; (* appel a la procedure menu_principal de U_Menu *)

bon:=false;


REPEAT (* repeter jusqu'a la saisie de [4 => sortir] *)

(*________________  phase de controle ____________________________*)

repeat (* repeter jusqu'a la saisie d'un entier naturel(N\0) *)

{$I-}

writeln;writeln;

write(' Tapez l''un des chiffres en rouge: ');

readln(x);

writeln;

{$I+}

if (IOResult=0) then bon:=true

                else begin

						writeln;
						write(' valeur incorrecte, entrez un entier');
						writeln;

					  end;

until bon; (*fin de la boucle repeat *)

while (x<>1) and (x<>2) and (x<>3) and (x<>4) do (* x=nbre d'options possible,x appartient a [1,4],x element de N *)

begin

	clrscr;
	menu_principal;
	bon:=false;
	write('Entrez un chiffre compris entre 1 et 4 : ');

	repeat

	{$I-}

		readln(x);
		writeln;

	{$I+}

	if (IOResult=0) then bon:=true

					else writeln; { Entrer un chiffre compris entre 1 et 4 :}

	until bon;

end;


{______________________ fin de la phase de controle ___________________}


if (x=1) then begin { Option num 1 => Gestion_Achat }

				bon:=false;
				bon1:=false;

				repeat{repeter jusqu'a la saisie de [5 => retour MenuPrincipal }

				menu_achat; { appel de la proc menu_achat de U_Menu }

				repeat      { control de saisie d'entier naturel (N\0) }

				{$I-}

					writeln;writeln;
					write(' Tapez l''un des chiffres en rouge: ');
					readln(x1);
					writeln;

				{$I+}

				if (IOResult=0) then bon:=true

								else begin

										writeln;
										write(' valeur incorrecte, entrez un entier');
										writeln;
										
									  end;
               until bon;

               while (x1<>1) and (x1<>2) and (x1<>3) and (x1<>4) and (x1<>5) do

               begin

					clrscr;
					menu_achat;
					bon:=false;
					write('Entrez un chiffre compris entre 1 et 5 : ');

					repeat

					{$I-}

						readln(x1);
						writeln;

					{$I+}

					if (IOResult=0) then bon:=true

									else writeln;

					until bon;

				end; { fin de controle de saisie d'entier comprie entre 1 et 5}

(*__________________ phase de choix d'options _________________________________________*)

               if (x1=1) then creer_fournisseur(ff) (* enregistrer fournisseur *)

                         else

               if (x1=2) then afficher_liste_fournisseur(ff) (* liste fournisseur *)

                         else

               if (x1=3) then  enregistrer_facture_achat (* facture achat *)								

                         else

               if (x1=4) then statistique_fournisseur  (* stat fournisseur *)

                         else

               if (x1=5) then begin

									menu_principal; (* retour *)
									bon1:=true;

							   end;

               until bon1 {end of the big repeat}


              end


          else

if (x=2) then begin {option n num 2 => Gestion_Vente }

				bon:=false;
				bon1:=false;

				repeat{repeter jusqu'a la saisie de [5 => retour MenuPrincipal }

				menu_vente; {appel de la proc menu_vente de U_Menu}

				repeat

				{$I-}

				writeln;writeln;
				write(' Tapez l''un des chiffres en rouge: ');
				readln(x2);
				writeln;

				{$I+}

				if (IOResult=0) then bon:=true

								else begin

										writeln;
										write(' valeur incorrecte, entrez un entier');
										writeln;

									 end;
				until bon;

				while (x2<>1) and (x2<>2) and (x2<>3) and (x2<>4) and (x2<>5) and (x2<>6) do

				begin

				clrscr;
				menu_vente;
				bon:=false;
				writeln;writeln;writeln;writeln;
				write('Entrez un chiffre compris entre 1 et 6 : ');

				repeat

               {$I-}

               readln(x2);
               writeln;

               {$I+}

               if (IOResult=0) then bon:=true

                               else writeln;

               until bon;

               end;

               if (x2=1) then creer_client(fc) (* nouveau client *)

                         else

               if (x2=2) then afficher_liste_client(fc) (* listeclient *)

                         else

               if (x2=3) then enregistrer_facture_vente (* facture vente *)               
								
                         else

               if (x2=4) then begin        {this part must be repeated until bon2 is true }

                              menu_chiffre_affaire;  (* chiffre d'affaire *)

                              bon:=false;
                              bon2:=false;

                              repeat {repeat only this part until bon2 is true }

                              repeat

                              {$I-}

                              writeln;writeln;

                              write(' Tapez l''un des chiffres en rouge: ');

                              readln(x21);

                              writeln;

                              {$I+}

                              if (IOResult=0) then bon:=true

                              else begin

                                    writeln;

                                    write(' valeur incorrecte, entrez un entier');

                                    writeln;

                                    end;

                              until bon;

                              while (x21<>1) and (x21<>2) and (x21<>3) and (x21<>4) do

                              begin

                              clrscr;

                              menu_chiffre_affaire;

                              bon:=false;

                              write('Entrez un chiffre compris entre 1 et 4 : ');

                              repeat

                              {$I-}

                              readln(x21);

                              writeln;

                              {$I+}

                              if (IOResult=0) then bon:=true

                                              else writeln;

                              until bon;

                              end;


                              if (x21=1) then  chiffre_aff_global (* chiffre affaire globale *)

                                         else

                              if (x21=2) then  chiffre_aff_par_categorie (* chiffre aff par categorie *)

                                         else

                              if (x21=3) then  chiffre_aff_par_produit (* chiffre affaire par prod *)

                                         else

                              if (x21=4) then begin

                                              menu_vente;  (* stat fournisseur *)
                                              bon2:=true;

                                              end;

                              until bon2  {end of the first small repeat}

                              end

                         else

               if (x2=5) then begin

                              menu_statistique_vente;  (* stat vente *)

                              bon:=false;
                              bon2:=false;

                              repeat {second small repeat }

                              repeat

                              {$I-}

                              writeln;writeln;

                              write(' Tapez l''un des chiffres en rouge: ');

                              readln(x22);

                              writeln;

                              {$I+}

                              if (IOResult=0) then bon:=true

                              else begin

                                    writeln;

                                    write(' valeur incorrecte, entrez un entier');

                                    writeln;

                                    end;
                              until bon;

                              while (x22<>1) and (x22<>2) and (x22<>3) and (x22<>4) do

                              begin

                              clrscr;

                              menu_chiffre_affaire;

                              bon:=false;

                              write('Entrez un chiffre compris entre 1 et 4 : ');

                              repeat

                              {$I-}

                              readln(x22);

                              writeln;

                              {$I+}

                              if (IOResult=0) then bon:=true

                                              else writeln;

                              until bon;

                              end;


                              if (x22=1) then  statistique_client (* stat par client *)

                                         else

                              if (x22=2) then  statistique_produit (*  stat par produit *)

                                         else

                              if (x22=3) then statistique_categorie (* stat par categorie *)

                                         else

                              if (x22=4) then begin

                                              menu_vente;  (* retour menu statistique *)

                                              bon2:=true;

                                              end;

                              until bon2 {end}

                              end

                         else

               if (x2=6) then begin

                              menu_principal; (* retour *)

                              bon1:=true;

                              end;

               until bon1

               end


          else

if (x=3) then begin {Option 3 ==> Gestion des stocks }

               menu_stock; (* appel de la procedure menu stock *)

               bon:=false;
               bon1:=false;

               repeat {................}

               (* controle du choix au menu stock *)

               repeat

               {$I-}

                writeln;writeln;

                write(' Tapez l''un des chiffres en rouge: ');

                readln(x3);

                writeln;

                {$I+}

                if (IOResult=0) then bon:=true

                                else begin

                                     writeln;

                                     write(' valeur incorrecte, entrez un entier');

                                     writeln;

                                     end;
                until bon;

                while (x3<>1) and (x3<>2) and (x3<>3) and (x3<>4) and (x3<>5) do

                begin

                clrscr;

                menu_stock;

                bon:=false;

                writeln;writeln;writeln;writeln;

                write('Entrez un chiffre compris entre 1 et 5 : ');

                repeat

                {$I-}

                readln(x3);

                writeln;

                {$I+}

                if (IOResult=0) then bon:=true

                                else writeln;

                until bon;

                end;

                if (x3=1) then begin
                
								menu_produit; (* nouveau produit et categorie *)

							  bon:=false;
                              bon2:=false;
                              x31:=0;

                              repeat {second small repeat }

                              repeat

                              {$I-}

                              writeln;writeln;

                              write(' Tapez l''un des chiffres en rouge: ');

                              readln(x31);

                              writeln;

                              {$I+}

                              if (IOResult=0) then bon:=true

                              else begin

                                    writeln;

                                    write(' valeur incorrecte, entrez un entier');

                                    writeln;

                                    end;
                              until bon;

                              while (x31<>1) and (x31<>2) and (x31<>3) and (x31<>4) do

                              begin

                              clrscr;

                              menu_produit;

                              bon:=false;

                              write('Entrez un chiffre compris entre 1 et 4 : ');

                              repeat

                              {$I-}

                              readln(x31);

                              writeln;

                              {$I+}

                              if (IOResult=0) then bon:=true

                                              else writeln;

                              until bon;

                              end;


                              if (x31=1) then  creer_categorie(fct) (*  creation de la categorie *)

                                         else

                              if (x31=2) then liste_cetegorie(fct)

                                         else
                                         
                               if(x31=3) then  creer_produit(fp)
                               
										 else	

                              if (x31=4) then begin

                                              menu_stock;  (* retour menu stock *)

                                              bon2:=true;

                                              end;

                              until bon2 {end}

                              end
{****************************************************************************************************}

                          else

                if (x3=2) then consulter_stock (* consulter stock *)

                          else

                if (x3=3) then begin 
                
								menu_inventaire; (* inventaire *)
								
								bon:=false;
                              bon2:=false;
                              x32:=0;

                              repeat {second small repeat }

                              repeat

                              {$I-}

                              writeln;writeln;

                              write(' Tapez l''un des chiffres en rouge: ');

                              readln(x32);

                              writeln;

                              {$I+}

                              if (IOResult=0) then bon:=true

                              else begin

                                    writeln;

                                    write(' valeur incorrecte, entrez un entier');

                                    writeln;

                                    end;
                              until bon;

                              while (x32<>1) and (x32<>2) and (x32<>3)  do

                              begin

                              clrscr;

                              menu_inventaire;

                              bon:=false;

                              write('Entrez un chiffre compris entre 1 et 4 : ');

                              repeat

                              {$I-}

                              readln(x32);

                              writeln;

                              {$I+}

                              if (IOResult=0) then bon:=true

                                              else writeln;

                              until bon;

                              end;


                              if (x32=1) then  inventaire_global

                                         else

                              if (x32=2) then  inventaire_de_la_categorie

                                         else
                                         
                              if (x32=3) then begin

                                              menu_stock;  (* retour menu stock *)

                                              bon2:=true;

                                              end;

                              until bon2 {end}

                              end
         {**************************************************************************}

                          else

                if (x3=4) then mise_a_jour_inventaire (* mise a jour inventaire *)

                          else

                if (x3=5) then begin

                               menu_principal; (* retour *)

                               bon1:=true;

                               end;

                until bon1;

                end;

until (x=4); { [4 ==> quitter le programme correctement ] }


END.

