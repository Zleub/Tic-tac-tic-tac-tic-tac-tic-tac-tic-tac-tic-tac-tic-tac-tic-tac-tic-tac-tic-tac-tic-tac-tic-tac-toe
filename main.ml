(*
* @Author: adebray
* @Date:   2015-11-08 01:00:50
* @Last Modified by:   adebray
* @Last Modified time: 2015-11-08 04:24:55
*)

let () =
	print_endline "Hello World" ;

	let g = Grid.Cell.Red
	in
	print_endline (Grid.Cell.stringState g) ;

	print_endline "----------------------------" ;

	let g = Grid.newGrid ()
	in Grid.printGrid g ;
	print_endline "" ;
	print_endline "----------------------------" ;
	Grid.printGrid (Grid.play Grid.Cell.Red 3 g)

