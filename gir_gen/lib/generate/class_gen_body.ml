(* Class body generation (Step 3) - orchestrators *)

(*E110-removed*)

open StdLabels
open Gen_buffer
open Types

(* Use Common.StringSet for type compatibility across all modules *)
module StringSet = Common.StringSet

(** Add each chunk of a class section (methods or properties), each followed by
    a blank line *)
let add_chunks buf chunks =
  List.iter chunks ~f:(fun chunk ->
      Buffer.add_string buf chunk;
      Buffer.add_char buf '\n')

(** Generate the body of a class module (implementation) *)
let generate_class_module_body ~(ctx : Types.generation_context)
    ~(buf : Buffer.t) ~(layer1_module_name : string)
    ~(current_layer2_module : string) ~(class_name : string)
    ~(class_snake : string) ~(c_type : string)
    ~(methods : Types.gir_method list) ~(entity_kind : Filtering.entity_kind)
    ~(properties : Types.gir_property list) ~(signals : Types.gir_signal list)
    ~(same_cluster_classes : string list) ~(parent_name : string option) () :
    unit =
  let members =
    Emitted_members.l2 ~ctx ~class_name ~c_type ~entity_kind ~methods
      ~properties
  in

  (* Parent class inheritance — skip if parent is in the same cyclic cluster *)
  (match
     Class_gen_helpers.resolve_parent_gir_type ~same_cluster_classes
       ~parent_name
   with
  | Some gir_type -> (
      match
        Class_gen_type_resolution.resolve_layer2_class_name ~ctx
          ~current_layer2_module ~gir_type
      with
      | Some parent_class_name ->
          let parent_l1 =
            if String.contains gir_type.name '.' then
              (* Cross-namespace parent: use type mapping for qualified L1 path *)
              match
                Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type
              with
              | Some tm ->
                  (* ocaml_type is e.g. "Ocgtk_gio.Gio.Wrappers.Application.t" — strip ".t" *)
                  let ot = tm.ocaml_type in
                  if Filename.check_suffix ot ".t" then
                    String.sub ot ~pos:0 ~len:(String.length ot - 2)
                  else ot
              | None -> Class_utils.get_qualified_module_name ~ctx gir_type.name
            else Class_utils.get_qualified_module_name ~ctx gir_type.name
          in
          bprintf buf "  inherit %s (obj :> %s.t)\n" parent_class_name parent_l1
      | None -> ())
  | None -> ());

  (* Interface inheritance: look up class implements from ctx *)
  let class_implements =
    match
      List.find_opt
        ~f:(fun cls -> String.equal cls.class_name class_name)
        ctx.classes
    with
    | Some cls -> cls.implements
    | None -> [] (* interfaces/records have no implements *)
  in
  List.iter class_implements ~f:(fun iface_name ->
      (* Skip if: (a) the interface is in the same cyclic cluster (OCaml class
       types cannot mutually recurse within a combined module), or (b) a class in
       the parent chain already provides this interface (diamond inheritance —
       would trigger warning 7 treated as error). *)
      let in_same_cycle =
        List.exists same_cluster_classes ~f:(fun n -> String.equal n iface_name)
      in
      let parent_provides =
        Class_gen_conflict_detection.parent_chain_provides_interface ~ctx
          ~class_name iface_name
      in
      if (not in_same_cycle) && not parent_provides then begin
        (* Look up the c_type for same-namespace interfaces (implements uses GIR
         interface_name, but type_mappings lookup uses c_type). Cross-namespace
         interfaces include a "." and are looked up as-is. *)
        let lookup_name =
          if String.contains iface_name '.' then iface_name
          else
            match
              List.find_opt
                ~f:(fun iface -> String.equal iface.interface_name iface_name)
                ctx.interfaces
            with
            | Some iface -> iface.c_type
            | None -> iface_name (* fallback; will likely not find a mapping *)
        in
        let iface_gir_type =
          {
            Types.name = lookup_name;
            c_type = None;
            nullable = false;
            transfer_ownership = Types.TransferNone;
            array = None;
          }
        in
        match
          Type_mappings.find_type_mapping_for_gir_type ~ctx iface_gir_type
        with
        | Some { layer2_class = Some lc; ocaml_type; _ } ->
            (* Derive the Layer 2 class name by stripping _t suffix from class_type *)
            let iface_class_name =
              let ct = lc.class_type in
              if
                String.length ct > 2
                && String.equal
                     (String.sub ct ~pos:(String.length ct - 2) ~len:2)
                     "_t"
              then String.sub ct ~pos:0 ~len:(String.length ct - 2)
              else ct
            in
            (* Qualify with module prefix unless we're in the same Layer 2 module *)
            let module_prefix =
              if String.equal current_layer2_module lc.class_module then ""
              else lc.class_module ^ "."
            in
            (* Layer 1 module: strip ".t" from ocaml_type *)
            let l1_module =
              if
                String.length ocaml_type > 2
                && String.equal
                     (String.sub ocaml_type
                        ~pos:(String.length ocaml_type - 2)
                        ~len:2)
                     ".t"
              then
                String.sub ocaml_type ~pos:0 ~len:(String.length ocaml_type - 2)
              else ocaml_type
            in
            bprintf buf "  inherit %s%s (%s.from_gobject obj)\n" module_prefix
              iface_class_name l1_module
        | Some { layer2_class = None; _ } ->
            () (* interface has no L2 class — skip *)
        | None -> () (* interface not in type mappings (filtered out) — skip *)
      end);

  (* L2 signal forwarder methods — one per supported signal.
     Error branch silently skips: the skip was already logged at L1 emission. *)
  List.iter (Emitted_members.signals ~ctx signals) ~f:(fun emission ->
      Buffer.add_string buf
        (Signal_gen.emit_l2_method ~current_layer2_module ~layer1_module_name
           ~class_snake emission));

  bprintf buf "\n";

  (* Methods *)
  add_chunks buf
    (List.map members.l2_methods
       ~f:
         (Class_gen_method.generate_method_wrappers ~ctx
            ~module_name:layer1_module_name ~class_name ~c_type
            ~current_layer2_module ~same_cluster_classes));
  (* Properties *)
  add_chunks buf
    (List.map members.l2_properties
       ~f:
         (Class_gen_property.generate_property_methods ~ctx
            ~module_name:layer1_module_name ~current_layer2_module
            ~same_cluster_classes));

  (* Converter methods — skip if parent already provides the same accessor *)
  let self_accessor = Utils.ocaml_class_name class_name in
  let parent_provides_accessor =
    match parent_name with
    | Some p ->
        let parent_accessor =
          Utils.ocaml_class_name (Utils.normalize_class_name p)
        in
        String.equal self_accessor parent_accessor
    | None -> false
  in
  if not parent_provides_accessor then
    Class_gen_converter.generate_class_converter_method_impl ~class_name buf

(* A section of a class type body: a floating heading, then its members. A
   section that declares no method (all filtered, or only conflict comments)
   is left out. The blank lines keep the heading floating. *)

(** Generate the body of a class signature *)
let add_class_type_section buf ~label ~title body =
  let declares_a_method =
    String.split_on_char ~sep:'\n' body
    |> List.exists ~f:(String.starts_with ~prefix:"    method ")
  in
  if declares_a_method then
    bprintf buf "\n    (** {2:%s %s} *)\n\n%s" label title body

let generate_class_signature_body ~(ctx : Types.generation_context)
    ~(buf : Buffer.t) ~layer1_module_name:(_ : string)
    ~(current_layer2_module : string) ~(class_name : string)
    ~class_snake:(_ : string) ~(c_type : string)
    ~(methods : Types.gir_method list) ~(entity_kind : Filtering.entity_kind)
    ~(properties : Types.gir_property list) ~(signals : Types.gir_signal list)
    ~(same_cluster_classes : string list) ~(parent_name : string option) () :
    unit =
  let members =
    Emitted_members.l2 ~ctx ~class_name ~c_type ~entity_kind ~methods
      ~properties
  in

  (* Parent class inheritance — skip if parent is in the same cyclic cluster *)
  (match
     Class_gen_helpers.resolve_parent_gir_type ~same_cluster_classes
       ~parent_name
   with
  | Some gir_type -> (
      match
        Class_gen_type_resolution.resolve_layer2_class_ref ~ctx
          ~current_layer2_module ~gir_type
      with
      | Some parent_class_type ->
          bprintf buf "    inherit %s\n" parent_class_type
      | None -> ())
  | None -> ());

  (* Interface class types in the class type definition *)
  let class_implements =
    match
      List.find_opt
        ~f:(fun cls -> String.equal cls.class_name class_name)
        ctx.classes
    with
    | Some cls -> cls.implements
    | None -> []
  in
  List.iter class_implements ~f:(fun iface_name ->
      (* Same cycle and diamond-inheritance guards as in generate_class_module_body *)
      let in_same_cycle =
        List.exists same_cluster_classes ~f:(fun n -> String.equal n iface_name)
      in
      let parent_provides =
        Class_gen_conflict_detection.parent_chain_provides_interface ~ctx
          ~class_name iface_name
      in
      if (not in_same_cycle) && not parent_provides then begin
        let lookup_name =
          if String.contains iface_name '.' then iface_name
          else
            match
              List.find_opt
                ~f:(fun iface -> String.equal iface.interface_name iface_name)
                ctx.interfaces
            with
            | Some iface -> iface.c_type
            | None -> iface_name
        in
        let iface_gir_type =
          {
            Types.name = lookup_name;
            c_type = None;
            nullable = false;
            transfer_ownership = Types.TransferNone;
            array = None;
          }
        in
        match
          Type_mappings.find_type_mapping_for_gir_type ~ctx iface_gir_type
        with
        | Some { layer2_class = Some lc; _ } ->
            let module_prefix =
              if String.equal current_layer2_module lc.class_module then ""
              else lc.class_module ^ "."
            in
            bprintf buf "    inherit %s%s\n" module_prefix lc.class_type
        | Some { layer2_class = None; _ } -> ()
        | None -> ()
      end);

  (* L2 signal method type signatures — one per supported signal.
     Error branch silently skips: already logged at L1 emission. *)
  let section = Buffer.create 1024 in
  List.iter (Emitted_members.signals ~ctx signals) ~f:(fun emission ->
      Buffer.add_string section
        (Signal_gen.emit_l2_method_sig
           ~refs:(Doc_resolve.class_member (Doc_resolve.env_of_ctx ctx))
           ~current_layer2_module emission));

  add_class_type_section buf ~label:"signals" ~title:"Signals"
    (Buffer.contents section);

  (* Methods *)
  add_class_type_section buf ~label:"methods" ~title:"Methods"
    (String.concat ~sep:""
       (List.map members.l2_methods
          ~f:
            (Class_gen_method.generate_method_signatures ~ctx
               ~current_layer2_module ~same_cluster_classes)));

  (* Properties *)
  add_class_type_section buf ~label:"properties" ~title:"Properties"
    (String.concat ~sep:""
       (List.map members.l2_properties
          ~f:
            (Class_gen_property.generate_property_signatures ~ctx ~class_name
               ~current_layer2_module ~same_cluster_classes)));

  (* Converter methods — skip if parent already provides the same accessor *)
  let self_accessor = Utils.ocaml_class_name class_name in
  let parent_provides_accessor =
    match parent_name with
    | Some p ->
        String.equal self_accessor
          (Utils.ocaml_class_name (Utils.normalize_class_name p))
    | None -> false
  in
  if not parent_provides_accessor then begin
    let section = Buffer.create 128 in
    Class_gen_converter.generate_class_converter_method_sig ~ctx ~class_name
      section;
    add_class_type_section buf ~label:"conversions" ~title:"Conversions"
      (Buffer.contents section)
  end
