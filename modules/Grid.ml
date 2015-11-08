(*
* @Author: adebray
* @Date:   2015-11-08 01:01:00
* @Last Modified by:   adebray
* @Last Modified time: 2015-11-08 06:54:50
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

let rec printGrid g =
	let stringify = function x -> print_string (Cell.stringState x)
	in let rec loop ?(acc=3) ?(start=0) ?(index=0) f grid= match acc, index with
		| acc, index when acc <> 0 -> begin
			print_string ((Cell.stringState (List.nth grid index)) ^ " ") ;
			loop ~acc:(acc - 1) ~start:(start) ~index:(index + 1) f grid
		end
		| acc, index when index >= ((size * size) * (size * size)) -> begin
			print_endline ""
		end
		| acc,index -> begin
				if index >= start + 21
				then
				begin
					print_endline "" ;
					loop ~acc:(3) ~start:(start + 3) ~index:(start + 3) f grid
				end
				else loop ~acc:(3) ~start:(start) ~index:(index + 6) f grid
			end
	in loop stringify g


