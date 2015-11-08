(*
* @Author: adebray
* @Date:   2015-11-08 05:14:11
* @Last Modified by:   adebray
* @Last Modified time: 2015-11-08 22:00:40
*)

let convert = function
	| '1' -> 1
	| '2' -> 2
	| '3' -> 3
	| '4' -> 4
	| '5' -> 5
	| '6' -> 6
	| '7' -> 7
	| '8' -> 8
	| '9' -> 9
	| _ -> 42

let rec get_line grid =
	let query () =
		print_endline "It's your turn ! Which case do you want to populate ?" ;
		read_line ()
	in let simple_split str =
		if String.length str != 3 || String.get str 1 != ' ' then
			(42, 42)
		else
			(convert (String.get str 0), convert (String.get str 2))
	in let ret = simple_split (query ())
	in
		if (fst ret) = 42 || (snd ret) = 42 then begin
			print_endline "Invalid input ! (expecting \"x y\")" ;
			get_line grid
		end
		else if List.nth grid (((fst ret) - 1) * 9 + ((snd ret) - 1)) <> Grid.Cell.Undefined then
			begin
			print_endline "Already full !" ;
			get_line grid
			end
		else if Case.isTicTac (Case.getCase ((fst ret) - 1) grid) <> Grid.Cell.Undefined then
			begin
			print_endline "Already won !" ;
			get_line grid
			end
		else
			ret

let rec loop ?(cmp=0) grid =
	let graphic = function
		| Grid.Cell.Red -> "Red won"
		| Grid.Cell.Blue -> "Blue won"
		| Grid.Cell.Undefined -> "Keep Playing"
	in let final = function
		| Grid.Cell.Red -> true
		| Grid.Cell.Blue -> true
		| Grid.Cell.Undefined -> false
	in let rec check_every_cell ?(cmp=0) ?(acc=[]) grid =
		if cmp < 9 then
			let l = Case.isTicTac (Case.getCase cmp grid)
			in check_every_cell ~cmp:(cmp + 1) ~acc:(acc @ [l]) grid
		else Case.isTicTac acc
	in let play coord player =
		Grid.play player (((fst coord) - 1) * 9 + ((snd coord) - 1)) grid
	in
		print_endline (Grid.stringGrid grid) ;
		print_endline "--------------------------------------------------------" ;
		print_endline ( "Game State : " ^ graphic( check_every_cell grid)) ;
		print_endline "--------------------------------------------------------" ;
		if final (check_every_cell grid) then ()
		else if (cmp mod 2) = 0 then loop ~cmp:(cmp + 1) (play (get_line grid) Grid.Cell.Red)
		else loop ~cmp:(cmp + 1) (play (get_line grid) Grid.Cell.Blue)
