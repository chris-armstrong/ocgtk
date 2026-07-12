(* Constant Code Generation *)

open StdLabels
open Printf
open Types

(** Derive the OCaml name for a constant by lowercasing the GIR name.
    GIR constant names are SCREAMING_SNAKE_CASE (e.g. "PANGO_SCALE",
    "KEY_BackSpace"). Lowercasing produces valid OCaml identifiers
    (e.g. "pango_scale", "key_backspace"). *)
let ocaml_name_of_constant name =
  String.lowercase_ascii name

(** Map a GIR type name to its OCaml type string for constant declarations.
    Returns [None] for unmappable types (should be skipped with a warning). *)
let ocaml_type_of_gir_type_name type_name =
  match type_name with
  | "utf8" | "filename" | "gchararray" -> Some "string"
  | "gint" | "gint32" | "gint64" | "guint" | "guint32" | "guint64"
  | "gsize" | "gssize" | "gchar" | "gunichar" | "gulong" ->
      Some "int"
  | "gdouble" | "gfloat" | "double" | "float" -> Some "float"
  | "gboolean" -> Some "bool"
  | "Glyph" | "PangoGlyph" -> Some "int"
  | _ -> None

(** Serialize a constant value string to an OCaml literal.
    [ocaml_type] is the resolved OCaml type string (e.g. "string", "int"). *)
let serialize_value ~ocaml_type value =
  match ocaml_type with
  | "string" ->
      (* OCaml string literal with escaping for quotes and backslashes *)
      sprintf "%S" value
  | "bool" ->
      (* GIR uses "true"/"false" literally *)
      value
  | "float" ->
      (* Ensure OCaml float syntax: add ".0" if no decimal point *)
      if String.contains value '.' then value
      else value ^ ".0"
  | _ ->
      (* int and other numeric types: decimal literal as-is *)
      value

(** Generate the .mli content for constants in a namespace. *)
let generate_constants_interface ~namespace constants =
  if List.length constants = 0 then ""
  else begin
    let buf = Buffer.create 4096 in
    bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
    bprintf buf "(* %s Constants *)\n\n" namespace;

    List.iter
      ~f:(fun (cst : gir_constant) ->
        let ocaml_name = ocaml_name_of_constant cst.constant_name in
        match ocaml_type_of_gir_type_name cst.value_type.name with
        | None ->
            (* Skip unmappable types with a warning *)
            eprintf "  Warning: skipping constant %s with unmappable type %s\n"
              cst.constant_name cst.value_type.name
        | Some ocaml_type ->
            (* Emit doc comment if present *)
            (match cst.constant_doc with
            | Some doc ->
                let doc_text = Utils.sanitize_doc doc in
                bprintf buf "(** %s" doc_text;
                (match cst.version with
                | Some v -> bprintf buf "\n    @since %s" v
                | None -> ());
                bprintf buf " *)\n"
            | None ->
                (match cst.version with
                | Some v ->
                    bprintf buf "(** [%s] @since %s *)\n" cst.constant_c_type v
                | None -> ()));
            bprintf buf "val %s : %s\n\n" ocaml_name ocaml_type)
      constants;

    Buffer.contents buf
  end

(** Generate the .ml content for constants in a namespace. *)
let generate_constants_implementation ~namespace constants =
  if List.length constants = 0 then ""
  else begin
    let buf = Buffer.create 4096 in
    bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
    bprintf buf "(* %s Constants *)\n\n" namespace;

    List.iter
      ~f:(fun (cst : gir_constant) ->
        let ocaml_name = ocaml_name_of_constant cst.constant_name in
        match ocaml_type_of_gir_type_name cst.value_type.name with
        | None ->
            (* Skip unmappable types — warning already emitted in interface *)
            ()
        | Some ocaml_type ->
            let value = serialize_value ~ocaml_type cst.value in
            bprintf buf "let %s = %s\n" ocaml_name value)
      constants;

    Buffer.contents buf
  end

(** Generate both .mli and .ml files for constants in a namespace.
    Skips generation entirely if [constants] is empty. *)
let generate_constants_files ~ctx ~namespace ~output_dir =
  let constants = ctx.constants in
  if List.length constants = 0 then ()
  else begin
    let ns_lower = String.lowercase_ascii namespace in
    let mli_path = Filename.concat output_dir (sprintf "%s_constants.mli" ns_lower) in
    let ml_path = Filename.concat output_dir (sprintf "%s_constants.ml" ns_lower) in

    let mli_content = generate_constants_interface ~namespace constants in
    let ml_content = generate_constants_implementation ~namespace constants in

    (* Write files *)
    let oc = open_out mli_path in
    output_string oc mli_content;
    close_out oc;
    printf "Writing %s...\n" mli_path;

    let oc = open_out ml_path in
    output_string oc ml_content;
    close_out oc;
    printf "Writing %s...\n" ml_path
  end
