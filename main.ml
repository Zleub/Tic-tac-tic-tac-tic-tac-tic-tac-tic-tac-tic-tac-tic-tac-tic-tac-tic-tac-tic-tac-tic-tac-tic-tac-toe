(*
* @Author: adebray
* @Date:   2015-11-08 01:00:50
* @Last Modified by:   Work
* @Last Modified time: 2015-11-08 06:49:55
*)

let () =
	print_endline "Hello World" ;

	let g = Grid.Cell.Red
	in
	print_endline (Grid.Cell.stringState g) ;

	print_endline "----------------------------" ;

	let g = Grid.newGrid ()
	in
	Grid.printGrid g ;
	print_endline "" ;
	print_endline "----------------------------" ;
	Grid.printGrid (Grid.play Grid.Cell.Red 4 g) ;
	print_endline "----------------------------" ;

	print_endline (Case.stringFirstRowOfCase 0 (Grid.play Grid.Cell.Red 1 (Grid.play Grid.Cell.Red 5 (Grid.play Grid.Cell.Red 9 g)))) ;
	print_endline (Case.stringSecondRowOfCase 0 (Grid.play Grid.Cell.Red 1 (Grid.play Grid.Cell.Red 5 (Grid.play Grid.Cell.Red 9 g)))) ;
	print_endline (Case.stringThirdRowOfCase 0 (Grid.play Grid.Cell.Red 1 (Grid.play Grid.Cell.Red 5 (Grid.play Grid.Cell.Red 9 g)))) ;

	print_endline "----------------------------" ;

	Case.printCase (Case.getCase 0 (Grid.play Grid.Cell.Red 1 (Grid.play Grid.Cell.Red 5 (Grid.play Grid.Cell.Red 9 g))))
