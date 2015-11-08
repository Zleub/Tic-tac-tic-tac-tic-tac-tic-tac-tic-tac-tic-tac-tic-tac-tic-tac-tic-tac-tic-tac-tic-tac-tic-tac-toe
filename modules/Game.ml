(*
* @Author: adebray
* @Date:   2015-11-08 05:14:11
* @Last Modified by:   adebray
* @Last Modified time: 2015-11-08 06:51:03
*)

let num = [ "1"; "2"; "3"; "4"; "5"; "6"; "7"; "8"; "9" ]

let convert = function
	| "1" -> 1
	| "2" -> 2
	| "3" -> 3
	| "4" -> 4
	| "5" -> 5
	| "6" -> 6
	| "7" -> 7
	| "8" -> 8
	| "9" -> 9
	| _ -> 0

let rec loop grid =
	let rec test str var = function
		| [] -> ("0", "0")
		| lst::t -> if str = var ^ " " ^ lst
			then begin print_string str ; (var, lst) end
			else test str var t
	in let rec build str lst =
		(* It's quite hard to get only the coord out of the iteration *)
		List.fold_left (fun x y -> test str y num) ("0", "0") lst
	in let interact x y =
		print_int x;
		print_int y;
		print_endline "";
		Grid.play Grid.Cell.Red ((x - 1) * 9 + (y - 1)) grid
	in let play str =
		let t = build str num
		in let tmp = interact (convert (fst t)) (convert (snd t)) ;
		in Grid.printGrid tmp ;
		tmp
	in loop (play (read_line ()))
