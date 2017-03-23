(* yeezyGraph compiler *)

type action = Ast | LLVM | Compile

let _ = 
	let action = if Array.length Sys.argv > 1 then
		List.assoc Sys.argv.(1) [("-a", ast); (* print ast *)
			("-l", llvm); (* generate llvm, no checking *)
			("-c", compile)] (* generate, check llvm *)
	else Compile in (* go straight to compile if no options added *)

	let lexbuf = Lexing.from_channel stdin in (* lexbuf = tokens from scanner *)
	let ast = Parser.program Scanner.token lexbuf in (* ast = parser(lexbuf) *)
	(*Semant.check ast; *) (* uncomment after we write semantic analyzer *)

	match action with
		Ast -> print_string (Ast.string_of_program ast) (* print out string of ast *)
	  | LLVM -> print_string (Llvm.string_of_llmodule (Codegen.translate ast)) (* print out llvm *)
	  | Compile -> let m = Codegen.translate ast in
	  	Llvm_analysis.assert_valid_module m;
	  	print_string (Llvm.string_of_llmodule m)