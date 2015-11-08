(*
* @Author: adebray
* @Date:   2015-11-08 05:14:11
* @Last Modified by:   adebray
* @Last Modified time: 2015-11-08 20:12:46
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

let rec get_line () =
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
			get_line ()
		end (* end else if  then *)
		else
			ret

(*
	[a] [b] [c]
	[d] [e] [f]
	[g] [h] [i]
 *)

let rec loop ?(cmp=0) grid =
	let check_victory = function
		| a::b::c::d::e::f::g::h::i::[] when a = b = c -> true
		| a::b::c::d::e::f::g::h::i::[] when a = d = g -> true
		| a::b::c::d::e::f::g::h::i::[] when a = e = i -> true
		| a::b::c::d::e::f::g::h::i::[] when c = f = i -> true
		| a::b::c::d::e::f::g::h::i::[] when c = e = g -> true
		| a::b::c::d::e::f::g::h::i::[] when g = h = i -> true
		| a::b::c::d::e::f::g::h::i::[] when d = e = f -> true
		| a::b::c::d::e::f::g::h::i::[] when b = e = h -> true
		| _ -> false
	in let rec check_every_cell ?(cmp=0) ?(acc=[]) grid =
		if cmp < 9 then
			let b = Case.isTicTac (Case.getCase cmp grid)
			in check_every_cell ~cmp:(cmp + 1) ~acc:(acc @ [b]) grid
		else acc
	in let play coord player =
		Grid.play player (((fst coord) - 1) * 9 + ((snd coord) - 1)) grid
	in
		print_endline (Grid.stringGrid grid) ;
		Case.printCase (Case.getCase 0 grid);
		Case.printCase (Case.getCase 2 grid);
		print_endline "--------------------------------------------------------" ;
		print_endline ( string_of_bool (check_victory (check_every_cell grid))) ;
		print_endline "--------------------------------------------------------" ;
		if check_victory (check_every_cell grid) then ()
		else if (cmp mod 2) = 0 then loop ~cmp:(cmp + 1) (play (get_line ()) Grid.Cell.Red)
		else loop ~cmp:(cmp + 1) (play (get_line ()) Grid.Cell.Blue)
