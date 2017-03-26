(* Top-level of the yeezyGraph compiler: scan & parse the input,
   check the resulting AST, generate LLVM IR, and dump the module *)

type action = Ast | LLVM_IR | Compile

let _ = 
	let action = if Array.length Sys.argv > 1 then
		List.assoc Sys.argv.(1) [("-a", Ast); (* Print the AST only *)
			("-l", LLVM_IR); (* Generate LLVM, don't check *)
			("-c", Compile)] (* Generate, check LLVM IR *)
	else Compile in (* Go straight to compile if no options added *)
	
	let lexbuf = Lexing.from_channel stdin in (* lexbuf = tokens from scanner *)
	let ast = Parser.program Scanner.token lexbuf in (* ast = parser(lexbuf) *)
	Semant.check ast;  (* uncomment after we write semantic analyzer *)

	match action with
		Ast -> print_string (Ast.string_of_program ast) (* print out string of ast *)
	  | LLVM_IR -> print_string (Llvm.string_of_llmodule (Codegen.translate ast)) (* print out llvm *)
	  | Compile -> let m = Codegen.translate ast in
	  	Llvm_analysis.assert_valid_module m;
	  	print_string (Llvm.string_of_llmodule m)