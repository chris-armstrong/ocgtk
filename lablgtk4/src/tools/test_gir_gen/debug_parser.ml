(* Debug parser test *)

let test_code = {|CAMLexport CAMLprim value ml_gtk_widget_process(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = gtk_widget_process(GtkWidget_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}|}

let () =
  Printf.printf "=== PARSER DEBUG ===\n";
  let functions = C_parser.parse_c_code test_code in
  match functions with
  | [] -> Printf.printf "ERROR: No functions parsed!\n"
  | f :: _ ->
      Printf.printf "Function: %s\n" f.C_ast.name;
      Printf.printf "Body has %d statements\n" (List.length f.C_ast.body);
      List.iteri (fun i stmt ->
        match stmt with
        | C_ast.IfStmt (_, then_stmts, else_stmts) ->
            Printf.printf "  Statement %d: IfStmt (then: %d, else: %d)\n"
              i (List.length then_stmts) (List.length else_stmts);
            Printf.printf "    Then statements:\n";
            List.iter (fun s ->
              match s with
              | C_ast.Return (C_ast.Macro (name, _)) ->
                  Printf.printf "      - Return(Macro(%s))\n" name
              | _ -> Printf.printf "      - Other\n"
            ) then_stmts;
            Printf.printf "    Else statements:\n";
            List.iter (fun s ->
              match s with
              | C_ast.Return (C_ast.Macro (name, _)) ->
                  Printf.printf "      - Return(Macro(%s))\n" name
              | _ -> Printf.printf "      - Other\n"
            ) else_stmts
        | C_ast.VarDecl (t, name, _) ->
            Printf.printf "  Statement %d: VarDecl %s %s\n" i t name
        | C_ast.Return _ ->
            Printf.printf "  Statement %d: Return\n" i
        | C_ast.Empty ->
            Printf.printf "  Statement %d: Empty\n" i
        | _ ->
            Printf.printf "  Statement %d: Other\n" i
      ) f.C_ast.body;
      Printf.printf "\nhas_error_handling: %b\n" (C_validation.has_error_handling f);
      Printf.printf "has_var_decl error: %b\n" (C_ast.has_var_decl f "error")
