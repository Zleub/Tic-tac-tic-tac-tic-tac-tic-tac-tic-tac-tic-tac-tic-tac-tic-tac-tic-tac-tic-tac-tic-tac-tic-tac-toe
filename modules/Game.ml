(*
* @Author: adebray
* @Date:   2015-11-08 05:14:11
* @Last Modified by:   Work
* @Last Modified time: 2015-11-08 12:06:38
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
		end else
			ret

let rec loop grid =
	let play coord =
		Grid.play Grid.Cell.Red (((fst coord) - 1) * 9 + ((snd coord) - 1)) grid
	in
		Grid.printGrid grid ;
		loop (play (get_line ()))
