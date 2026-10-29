(* Layer 1 Main - Main interface generation functions for OCaml .mli/.ml files *)

open StdLabels
open Gen_buffer
open Types

(** Generate type declaration for the module. Both records and classes are
    represented as [[ tag... ] Gobject.obj], computed by the caller; we just
    emit it. *)
let generate_type_declaration ~output_mode:_ ~base_type buf : unit =
  bprintf buf "type t = %s\n\n" base_type

(** Generate constructors section *)
let generate_constructors_section ~ctx ~class_name ~constructors buf : unit =
  List.iter
    ~f:(fun (ctor : gir_constructor) ->
      if Layer1_constructor.should_generate_constructor ~ctx ctor then
        Layer1_constructor.generate_constructor_decl ~ctx ~class_name ~buf ctor)
    (constructors |> Option.value ~default:[])

(** Generate methods section *)
let generate_methods_section ~ctx ~class_name ~c_type ~c_symbol_prefix
    ~entity_kind ~methods buf : unit =
  bprintf buf "(* Methods *)\n";
  List.iter
    ~f:(fun (meth : gir_method) ->
      Layer1_method.generate_method_decl ~ctx ~class_name ~c_type
        ~c_symbol_prefix ~entity_kind ~buf meth)
    (List.rev methods)

(** Generate properties section *)
let generate_properties_section ~ctx ~class_name ~methods ~properties buf : unit
    =
  if List.length properties > 0 then begin
    bprintf buf "(* Properties *)\n\n";
    List.iter
      ~f:(fun (prop : gir_property) ->
        Layer1_property.generate_property_decl ~ctx ~class_name ~buf ~methods
          prop)
      properties
  end

let emit_one_signal ~ctx ~output_mode ~class_name buf signal =
  match Signal_gen.classify ~ctx signal with
  | Error reason ->
      Fmt.epr "Skipping signal '%s' for %s (%s)\n" signal.signal_name class_name
        reason
  | Ok emission -> (
      match output_mode with
      | Layer1_helpers.Interface ->
          Buffer.add_string buf
            (Signal_gen.emit_l1_val
               ~refs:(Doc_resolve.env_of_ctx ctx)
               ~current_class:class_name emission)
      | Layer1_helpers.Implementation ->
          Buffer.add_string buf
            (Signal_gen.emit_l1_let ~current_class:class_name emission))

let generate_signal_bindings_section ~ctx ~output_mode ~class_name
    (signals : gir_signal list) buf : unit =
  List.iter signals ~f:(emit_one_signal ~ctx ~output_mode ~class_name buf)

let generate_ml_interface_internal ~ctx ~output_mode ~class_name ~c_type
    ~constructors ~methods ~properties ~base_type ?c_symbol_prefix ~entity_kind
    ?from_gobject_c_name ?(signals = []) ?glib_get_type buf : unit =
  generate_type_declaration ~output_mode ~base_type buf;
  (match glib_get_type with
  | Some _ ->
      (* [gtype], not [get_type]: entities can have a GIR method or property
         accessor named [get_type] (e.g. GSocketClient's [type] property
         getter), so the bare name would collide. Emitted at the top of the
         module because OCaml implementations are sequential: the signal
         closure bodies further down reference it. Records were previously
         emitted with a bottom-of-module [get_type] external; they now use
         the same [gtype] name as classes and interfaces. *)
      let ns_snake = Utils.to_snake_case ctx.namespace.namespace_name in
      let class_snake = Utils.to_snake_case class_name in
      let c_stub = Fmt.str "ml_%s_%s_get_type" ns_snake class_snake in
      bprintf buf "external gtype : unit -> Gobject.Type.t = \"%s\"\n\n" c_stub
  | _ -> ());
  Option.iter (fun c_name ->
      bprintf buf "external from_gobject : 'a Gobject.obj -> t = \"%s\"\n\n"
        c_name)
  @@ from_gobject_c_name;
  generate_constructors_section ~ctx ~class_name ~constructors buf;
  generate_methods_section ~ctx ~class_name ~c_type ~c_symbol_prefix
    ~entity_kind ~methods buf;
  generate_properties_section ~ctx ~class_name ~methods ~properties buf;
  generate_signal_bindings_section ~ctx ~output_mode ~class_name signals buf

let generate_ml_interface ~ctx ~output_mode ~class_name ~class_doc ~c_type
    ~parent_chain ~constructors ~methods ~properties ?c_symbol_prefix
    ~entity_kind ?from_gobject_c_name ?(signals = []) ?glib_get_type () : string
    =
  let ctx = Module_paths.raw_library_ctx ctx in
  let buf = Buffer.create 1024 in

  let class_type_name, base_type =
    Layer1_helpers.detect_class_hierarchy_names ~ctx ~class_name ~parent_chain
      ()
  in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* %s: %s *)\n\n" class_type_name class_name;

  (* The blank line makes this a floating module comment. Without it, the
     comment attaches to the first type, odoc no longer shows it as the
     module's synopsis on parent pages, and ocamlformat keeps it there. *)
  Option.iter (fun doc -> bprintf buf "%s\n\n" (Doc_emit.floating doc))
  @@ Entity_doc.l1_module
       ~refs:(Doc_resolve.env_of_ctx ctx)
       ~class_name ~class_doc;
  generate_ml_interface_internal ~ctx ~output_mode ~class_name ~c_type
    ~constructors ~methods ~properties ?c_symbol_prefix ~base_type ~entity_kind
    ?from_gobject_c_name ~signals ?glib_get_type buf;
  Buffer.contents buf

(** Format module declaration (module rec X | and X), after the arm's doc
    comment when it has one *)
let format_module_declaration buf ~doc module_name is_start : unit =
  if is_start then
    bprintf buf "%smodule rec %s" (Doc_emit.before_item doc) module_name
  else bprintf buf "\n%sand %s\n" (Doc_emit.before_item doc) module_name

(** Generate module signature for a single entity *)
let generate_module_signature ~ctx ~entity ~base_type ?from_gobject_c_name buf :
    unit =
  let signature_contents =
    let inner_buf = Buffer.create 1024 in
    generate_ml_interface_internal ~ctx ~output_mode:Layer1_helpers.Interface
      ~class_name:entity.name ~c_type:entity.c_type
      ~constructors:
        (if List.length entity.constructors > 0 then Some entity.constructors
         else None)
      ~methods:entity.methods
      ~entity_kind:(Filtering.entity_kind_of_entity entity)
      ~properties:entity.properties ~signals:entity.signals ~base_type
      ?from_gobject_c_name
      ~glib_get_type:(Types.entity_glib_get_type entity)
      inner_buf;
    Buffer.contents inner_buf
  in
  Layer1_helpers.print_indent signature_contents buf

(** Generate module implementation for a single entity *)
let generate_module_implementation ~ctx ~output_mode ~entity ~base_type
    ?from_gobject_c_name buf : unit =
  let single_content =
    let inner_buf = Buffer.create 1024 in
    generate_ml_interface_internal ~ctx ~output_mode ~class_name:entity.name
      ~c_type:entity.c_type ~base_type
      ~constructors:
        (if List.length entity.constructors > 0 then Some entity.constructors
         else None)
      ~methods:entity.methods
      ~entity_kind:(Filtering.entity_kind_of_entity entity)
      ~properties:entity.properties ~signals:entity.signals ?from_gobject_c_name
      ~glib_get_type:(Types.entity_glib_get_type entity)
      inner_buf;
    Buffer.contents inner_buf
  in
  Layer1_helpers.print_indent single_content buf

(** Generate a single combined module entity *)
let generate_combined_module_entity ~ctx ~output_mode ~entity
    ~parent_chain_for_entity ~index ~from_gobject_c_name_for_entity buf : unit =
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
  let from_gobject_c_name = from_gobject_c_name_for_entity entity in
  (* Only the interface's docs reach odoc. *)
  let doc =
    if is_impl then None
    else
      Entity_doc.l1_module
        ~refs:(Doc_resolve.env_of_ctx ctx)
        ~class_name ~class_doc:entity.doc
  in

  format_module_declaration buf ~doc module_name is_start;

  if is_impl then begin
    bprintf buf " : sig\n";
    generate_module_signature ~ctx ~entity ~base_type ?from_gobject_c_name buf;
    bprintf buf "end = struct\n"
  end
  else begin
    bprintf buf " : sig\n"
  end;

  generate_module_implementation ~ctx ~output_mode ~entity ~base_type
    ?from_gobject_c_name buf;
  bprintf buf "end\n%s" (Doc_emit.after_item doc)

(* Generate combined modules for cyclic dependencies *)
let generate_combined_ml_modules ~ctx ~output_mode ~entities
    ~parent_chain_for_entity ?(from_gobject_c_name_for_entity = fun _ -> None)
    () : string =
  let ctx = Module_paths.raw_library_ctx ctx in
  let buf = Buffer.create 4096 in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* Combined modules for cyclic dependencies *)\n\n";
  (match output_mode with
  | Layer1_helpers.Implementation -> ()
  | Layer1_helpers.Interface ->
      Option.iter (fun doc -> bprintf buf "%s\n\n" (Doc_emit.floating doc))
      @@ Entity_doc.combined_module ~namespace:ctx.namespace.namespace_name
           ~layer:Entity_doc.Layer1
           ~class_names:(List.map ~f:(fun e -> e.name) entities));

  let sorted_entities =
    List.sort ~cmp:(fun e1 e2 -> String.compare e1.name e2.name) entities
  in

  List.iteri
    ~f:(fun i entity ->
      generate_combined_module_entity ~ctx ~output_mode ~entity
        ~parent_chain_for_entity ~index:i ~from_gobject_c_name_for_entity buf)
    sorted_entities;

  Buffer.contents buf

(* Each member of a cycle lives inside the combined module, so dune's main
   module of the raw library has no alias for it. A file per member restores
   the short path ([Ocgio_raw.File] for [App_info_cycle_<hash>.File]) that
   other namespaces and [Raw] refer to; the strengthened signature keeps its
   types equal to the combined module's. *)
let generate_cycle_member_shim ~output_mode ~refs ~combined_module_name
    ~member_name ~member_doc =
  let member =
    combined_module_name ^ "." ^ Utils.module_name_of_class member_name
  in
  let body =
    match output_mode with
    | Layer1_helpers.Interface ->
        (* The member's doc is on its declaration in the combined module,
           which the included signature does not carry, so the shim repeats
           it. *)
        let preamble =
          Entity_doc.l1_module ~refs ~class_name:member_name
            ~class_doc:member_doc
          |> Option.fold ~none:"" ~some:(fun doc ->
              Doc_emit.floating doc ^ "\n\n")
        in
        Fmt.str "%sinclude module type of struct\n  include %s\nend\n" preamble
          member
    | Layer1_helpers.Implementation -> Fmt.str "include %s\n" member
  in
  Fmt.str
    "(* GENERATED CODE - DO NOT EDIT *)\n\
     (* %s, a member of the cyclic module %s *)\n\n\
     %s"
    member_name combined_module_name body
