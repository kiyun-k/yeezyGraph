(* yeezyGraph compiler *)

type action = ast | llvm | compile

let _ = 
	let action = if Array.length Sys.argv > 1 then
		List.assoc Sys.argv.(1) [("-a", ast); (* print ast *)
			("-l", llvm); (* generate llvm, no checking *)
			("-c", compile)] (* generate, check llvm *)