(* Layer 1 Main - Main interface generation functions for OCaml .mli/.ml files *)

open StdLabels
open Printf
open Types

(** Generate type declaration for the module *)
let generate_type_declaration ~output_mode ~is_record ~base_type buf =
  match (is_record, output_mode) with
  | true, Layer1_helpers.Interface -> bprintf buf "type t\n\n"
  | _ -> bprintf buf "type t = %s\n\n" base_type

(** Generate constructors section *)
let generate_constructors_section ~ctx ~class_name ~constructors buf =
  List.iter
    ~f:(fun (ctor : gir_constructor) ->
      if Layer1_constructor.should_generate_constructor ~ctx ctor then
        Layer1_constructor.generate_constructor_decl ~ctx ~class_name ~buf ctor)
    (constructors |> Option.value ~default:[])

(** Generate methods section *)
let generate_methods_section ~ctx ~class_name ~c_type ~c_symbol_prefix
    ~is_record ~methods buf =
  bprintf buf "(* Methods *)\n";
  List.iter
    ~f:(fun (meth : gir_method) ->
      Layer1_method.generate_method_decl ~ctx ~class_name ~c_type
        ~c_symbol_prefix ~is_record ~buf meth)
    (List.rev methods)

(** Generate properties section *)
let generate_properties_section ~ctx ~class_name ~methods ~properties buf =
  if List.length properties > 0 then begin
    bprintf buf "(* Properties *)\n\n";
    List.iter
      ~f:(fun (prop : gir_property) ->
        Layer1_property.generate_property_decl ~ctx ~class_name ~buf ~methods
          prop)
      properties
  end

let generate_ml_interface_internal ~ctx ~output_mode ~class_name ~c_type
    ~constructors ~methods ~properties ~base_type ?c_symbol_prefix
    ?(is_record = false) buf =
  generate_type_declaration ~output_mode ~is_record ~base_type buf;
  generate_constructors_section ~ctx ~class_name ~constructors buf;
  generate_methods_section ~ctx ~class_name ~c_type ~c_symbol_prefix ~is_record
    ~methods buf;
  generate_properties_section ~ctx ~class_name ~methods ~properties buf

let generate_ml_interface ~ctx ~output_mode ~class_name ~class_doc ~c_type
    ~parent_chain ~constructors ~methods ~properties ?c_symbol_prefix
    ?record_base_type ?(is_record = false) () =
  let buf = Buffer.create 1024 in

  let class_type_name, base_type =
    Layer1_helpers.detect_class_hierarchy_names ~ctx ~class_name ~parent_chain
      ?record_base_type ~is_record ()
  in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* %s: %s *)\n\n" class_type_name class_name;

  (match class_doc with
  | Some doc -> bprintf buf "(** %s *)\n" (Utils.sanitize_doc doc)
  | None -> ());
  generate_ml_interface_internal ~ctx ~output_mode ~class_name ~c_type
    ~constructors ~methods ~properties ?c_symbol_prefix ~base_type ~is_record
    buf;
  Buffer.contents buf

(** Format module declaration (module rec X | and X) *)
let format_module_declaration buf module_name is_start =
  if is_start then bprintf buf "module rec %s" module_name
  else bprintf buf "\nand %s\n" module_name

(** Generate module signature for a single entity *)
let generate_module_signature ~ctx ~entity ~base_type buf =
  let signature_contents =
    let inner_buf = Buffer.create 1024 in
    generate_ml_interface_internal ~ctx ~output_mode:Layer1_helpers.Interface
      ~class_name:entity.name ~c_type:entity.c_type
      ~constructors:
        (if List.length entity.constructors > 0 then Some entity.constructors
         else None)
      ~methods:entity.methods ~properties:entity.properties ~base_type inner_buf;
    Buffer.contents inner_buf
  in
  Layer1_helpers.print_indent signature_contents buf

(** Generate module implementation for a single entity *)
let generate_module_implementation ~ctx ~output_mode ~entity ~base_type buf =
  let single_content =
    let inner_buf = Buffer.create 1024 in
    generate_ml_interface_internal ~ctx ~output_mode ~class_name:entity.name
      ~c_type:entity.c_type ~base_type
      ~constructors:
        (if List.length entity.constructors > 0 then Some entity.constructors
         else None)
      ~methods:entity.methods ~properties:entity.properties inner_buf;
    Buffer.contents inner_buf
  in
  Layer1_helpers.print_indent single_content buf

(** Generate a single combined module entity *)
let generate_combined_module_entity ~ctx ~output_mode ~entity
    ~parent_chain_for_entity ~index buf =
  let parent_chain = parent_chain_for_entity entity.name in
  let class_name = entity.name in
  let _, base_type =
    Layer1_helpers.detect_class_hierarchy_names ~ctx ~class_name ~parent_chain
      ()
  in
  let module_name = Utils.module_name_of_class class_name in
  let is_impl =
    match output_mode with
    | Layer1_helpers.Implementation -> true
    | Layer1_helpers.Interface -> false
  in
  let is_start = index = 0 in

  format_module_declaration buf module_name is_start;

  if is_impl then begin
    bprintf buf " : sig\n";
    generate_module_signature ~ctx ~entity ~base_type buf;
    bprintf buf "end = struct\n"
  end
  else begin
    bprintf buf " : sig\n"
  end;

  generate_module_implementation ~ctx ~output_mode ~entity ~base_type buf;
  bprintf buf "end\n"

(* Generate combined modules for cyclic dependencies *)
let generate_combined_ml_modules ~ctx ~output_mode ~entities
    ~parent_chain_for_entity () =
  let buf = Buffer.create 4096 in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* Combined modules for cyclic dependencies *)\n\n";

  let sorted_entities =
    List.sort ~cmp:(fun e1 e2 -> String.compare e1.name e2.name) entities
  in

  List.iteri
    ~f:(fun i entity ->
      generate_combined_module_entity ~ctx ~output_mode ~entity
        ~parent_chain_for_entity ~index:i buf)
    sorted_entities;

  Buffer.contents buf
