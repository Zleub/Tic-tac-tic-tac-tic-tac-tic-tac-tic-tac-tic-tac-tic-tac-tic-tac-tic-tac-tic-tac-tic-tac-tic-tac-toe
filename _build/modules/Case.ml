(*
* @Author: Work
* @Date:   2015-11-08 05:39:44
* @Last Modified by:   adebray
* @Last Modified time: 2015-11-08 20:03:16
*)

type t = Grid.Cell.state list

let getCase target grid =
	let rec returnC originList index retList = match originList with
		| head::tail ->
			if index = 9 then retList
			else returnC tail (index + 1) (retList @ [head])
		| [] -> retList
	in let rec getCaseLoop i l = match i, l with
		| (i,head::tail)
			when i = (target * 9) -> returnC (head::tail) 0 []
		| (_, head::tail) -> getCaseLoop (i + 1) tail
		| (_, []) -> invalid_arg "Invalid argument for getCase"
	in
		getCaseLoop 0 grid

let stringRow case row =
	let rec returnS i max ret currentCase = match currentCase with
		| head::tail -> if i < max
			then returnS (i + 1) max (ret ^ (Grid.Cell.stringState head)) tail
			else ret
		| [] -> ret
	in let rec getRowLoop i case = match i, case with
		| (i, head::tail) when i = (row * 3) -> returnS 0 3 "" (head::tail)
		| (_, head::tail) -> getRowLoop (i + 1) tail
		| (_, []) -> invalid_arg "Invalid argument for stringRow"
	in
		getRowLoop 0 case


let stringFirstRowOfCase target grid =
	let case = getCase target grid
	in
	stringRow case 0


let stringSecondRowOfCase target grid =
	let case = getCase target grid
	in
	stringRow case 1


let stringThirdRowOfCase target grid =
	let case = getCase target grid
	in
	stringRow case 2

let getCellState case index =
	let rec loop i currentCell = match i, currentCell with
		| i, head::tail when i = index	-> head
		| _, head::tail -> loop (i + 1) tail
		| _, [] -> invalid_arg "Invalid argument for getCellState"
	in
		loop 0 case

let hasDiagonal case state =
	let upLeftCell		= getCellState case 0
	and middleCell		= getCellState case 4
	and downRightCell	= getCellState case 8
	and upRightCell		= getCellState case 2
	and downLeftCell	= getCellState case 6
in
	if middleCell != state then false
	else if upLeftCell = state && downRightCell = state then true
	else if upRightCell = state && downLeftCell = state then true
	else false

let rec hasLine case state = match case with
	| case1::case2::case3::tail ->
		if case1 = state && case2 = state && case3 = state then true
		else hasLine tail state
	| [] -> false
	| _::_ -> invalid_arg "Invalid arg for hasLine"

let hasColumn case state = match case with
	| case1::case2::case3::case4::case5::case6::case7::case8::case9::tail	->
		if
			(case1 = state && case4 = state && case7 = state)
			|| (case2 = state && case5 = state && case8 = state)
			|| (case3 = state && case6 = state && case9 = state) then
			true
		else
			false
	| []	-> false
	| _::_	-> invalid_arg "Invalid arg for hasColumn"

let isRed case =
	(hasDiagonal case Grid.Cell.Red)
		|| (hasLine case Grid.Cell.Red)
		|| (hasColumn case Grid.Cell.Red)

let isBlue case =
	(hasDiagonal case Grid.Cell.Blue)
		|| (hasLine case Grid.Cell.Blue)
		|| (hasColumn case Grid.Cell.Blue)

let isTicTac case =
	isBlue case || isRed case

let printCase case =
	print_endline (stringRow case 0) ;
	print_endline (stringRow case 1) ;
	print_endline (stringRow case 2)
