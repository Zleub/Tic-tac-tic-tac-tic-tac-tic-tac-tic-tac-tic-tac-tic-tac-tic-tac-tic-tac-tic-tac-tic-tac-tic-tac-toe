(*
* @Author: adebray
* @Date:   2015-11-08 01:01:00
* @Last Modified by:   adebray
* @Last Modified time: 2015-11-08 19:11:44
*)

module Cell =
struct

	type state = Undefined | Red | Blue

	let stringState = function
		| Undefined -> "_"
		| Red -> "O"
		| Blue -> "X"

end

let size = 3

let play state index grid =
	let assign x = function
		| i when i = index -> state
		| _ -> x
	in List.mapi (fun i x -> assign x i ) grid

let newGrid () =
	let rec loop ?(stack=[]) acc =
		if acc <> 0 then
			loop ~stack:(stack @ [ Cell.Undefined ]) (acc - 1)
		else stack
	in loop ((size * size) * (size * size))

let rec stringGrid ?(str="") ?(i=0) ?(cmp=0)grid =
	let stringify i =
		let elem = List.nth grid i
		in if (i = 20 || i = 23 || i = 26 || i = 47 || i = 50 || i = 53 || i = 74 || i = 77 || i = 80) then (Cell.stringState elem) ^ "\n"
		else (Cell.stringState elem) ^ " "
	in let rec bythree ?(acc=0) ?(cmp=0) ?(str="") i =
		if acc >= 3 then str
		else if cmp >= 3 then bythree ~acc:(acc + 1) ~str:(str) (i + 9)
		else if i < 81 then bythree ~acc:(acc) ~cmp:(cmp + 1) ~str:(str ^ (stringify (i + cmp))) i
		else str
	in if i < 81 then
		if cmp >= 3 then stringGrid ~str:(str) ~i:(i + 18) grid
		else stringGrid ~str:(str ^ (bythree i)) ~i:(i + 3) ~cmp:(cmp + 1) grid
	else str
