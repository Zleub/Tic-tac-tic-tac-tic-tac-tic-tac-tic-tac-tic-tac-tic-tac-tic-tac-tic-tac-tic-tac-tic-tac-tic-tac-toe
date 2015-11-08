(*
* @Author: adebray
* @Date:   2015-11-08 01:00:50
* @Last Modified by:   adebray
* @Last Modified time: 2015-11-08 14:18:21
* @Last Modified by:   adebray
* @Last Modified time: 2015-11-08 06:55:09
*)

(*
	Yo Arnaud ! Tu verras ça sûrement avant de me voir moi :)

	Alors voilà j'ai fait quelques fonctions utiles dans le module Case, les principales
	sont présentées ici, à savoir :
		- 	getCase qui te renvoie une liste des neuf Cell.state
			correspondantes à la case (AUCUN ERROR HANDLING POUR LE MOMENT)
		- 	isRed / isBlue qui te permettent de check une victoire pour la case filée en paramètre
		- 	printCase qui chope les lignes des cases une par une, qu'on peut spécialiser dans le cas
			où une case répond à isRed ou isBlue (pratique pour l'output, check donc l'implémentation dans Case.ml
			pour voir d'autres fonctions du genre stringRow qui t'envoie une string en fonction d'une case et d'une
			ligne de cette case !)

	J'ai aussi fix la boucle d'entrée des paramètres avec un petit message qui va bien si l'input pue du cul.

	Comme je le vois il manque simplement une fonction du genre "insert" qui renverrait une grid avec une case
	modifée. Un truc dans le genre insert caseAInserer -> gridAModifier -> indexDeLaCase -> gridModifie. Et après ça ne
	resterait plus que de l'habillage, grossièrement.

	La game loop est commentée pour que ça te foute pas en l'air mes exemples, mais dès que t'as check je t'invite
	à les effacer sans sommation !
*)

let () =
	let g = Grid.newGrid ()

(* 	in let gDiag1	= Grid.play Grid.Cell.Red 0 (Grid.play Grid.Cell.Red 4 (Grid.play Grid.Cell.Red 8 g))
	in let gDiag2	= Grid.play Grid.Cell.Red 2 (Grid.play Grid.Cell.Red 4 (Grid.play Grid.Cell.Red 6 g))
	in let gRow1	= Grid.play Grid.Cell.Red 0 (Grid.play Grid.Cell.Red 1 (Grid.play Grid.Cell.Red 2 g))
	in let gRow2	= Grid.play Grid.Cell.Red 3 (Grid.play Grid.Cell.Red 4 (Grid.play Grid.Cell.Red 5 g))
	in let gRow3	= Grid.play Grid.Cell.Red 6 (Grid.play Grid.Cell.Red 7 (Grid.play Grid.Cell.Red 8 g))
	in let gColumn1	= Grid.play Grid.Cell.Red 0 (Grid.play Grid.Cell.Red 3 (Grid.play Grid.Cell.Red 6 g))
	in let gColumn2 = Grid.play Grid.Cell.Red 1 (Grid.play Grid.Cell.Red 4 (Grid.play Grid.Cell.Red 7 g))
	in let gColumn3 = Grid.play Grid.Cell.Red 2 (Grid.play Grid.Cell.Red 5 (Grid.play Grid.Cell.Red 8 g))
	in let gTicTac	= Grid.play Grid.Cell.Red 2 (Grid.play Grid.Cell.Blue 5 (Grid.play Grid.Cell.Red 8 g))

	in let diag1	= Case.getCase 0 gDiag1
	in let diag2	= Case.getCase 0 gDiag2
	in let row1		= Case.getCase 0 gRow1
	in let row2		= Case.getCase 0 gRow2
	in let row3		= Case.getCase 0 gRow3
	in let column1 	= Case.getCase 0 gColumn1
	in let column2 	= Case.getCase 0 gColumn2
	in let column3 	= Case.getCase 0 gColumn3
	in let ticTac 	= Case.getCase 0 gTicTac
	in

		Case.printCase diag1 ;
		print_endline ("Is this a win ? " ^ string_of_bool (Case.isRed diag1) ^ "\n") ;

		Case.printCase diag2 ;
		print_endline ("Is this a win ? " ^ string_of_bool (Case.isRed diag2) ^ "\n") ;

		Case.printCase row1 ;
		print_endline ("Is this a win ? " ^ string_of_bool (Case.isRed row1) ^ "\n") ;

		Case.printCase row2 ;
		print_endline ("Is this a win ? " ^ string_of_bool (Case.isRed row2) ^ "\n") ;

		Case.printCase row3 ;
		print_endline ("Is this a win ? " ^ string_of_bool (Case.isRed row3) ^ "\n") ;

		Case.printCase column1 ;
		print_endline ("Is this a win ? " ^ string_of_bool (Case.isRed column1) ^ "\n") ;

		Case.printCase column2 ;
		print_endline ("Is this a win ? " ^ string_of_bool (Case.isRed column2) ^ "\n") ;

		Case.printCase column3 ;
		print_endline ("Is this a win ? " ^ string_of_bool (Case.isRed column3) ^ "\n") ;

		Case.printCase ticTac ;
		print_endline ("Is this a tictac ? " ^ string_of_bool (Case.isTicTac ticTac)) ; *)
		in Game.loop g
