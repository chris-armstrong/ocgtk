(* Layer 1 Helpers - Shared utilities for OCaml interface generation *)

open StdLabels
open Printf
open Types

(** Mode for generating code output *)
type output_mode =
  | Interface  (** Generate .mli interface file *)
  | Implementation  (** Generate .ml implementation file *)

let generate_signal_bindings ~output_mode:_ ~module_name:_ ~has_widget_parent:__
    _signals =
  "" (* Signals are only generated in high-level g*.ml wrappers *)

(** Build parent chain variants up to hierarchy root *)
let build_parent_chain_variants ~normalized_class ~parent_chain ~hier_info =
  if
    String.lowercase_ascii normalized_class
    = String.lowercase_ascii hier_info.gir_root
  then []
  else
    List.fold_left parent_chain ~init:[] ~f:(fun acc parent ->
        let tag =
          "`" ^ (Utils.to_snake_case parent |> Utils.sanitize_identifier)
        in
        acc @ [ tag ])

(** Build hierarchy variants for a monomorphic class *)
let build_hierarchy_variants ~normalized_class ~parent_chain =
  let self_variant =
    "`" ^ (Utils.to_snake_case normalized_class |> Utils.sanitize_identifier)
  in
  let parent_variants =
    List.map parent_chain ~f:(fun p ->
        "`" ^ (Utils.to_snake_case p |> Utils.sanitize_identifier))
  in
  let all_variants = self_variant :: parent_variants in
  String.concat ~sep:" | " all_variants

let detect_class_hierarchy_names ~ctx ~class_name ~parent_chain
    ?record_base_type ?(is_record = false) () =
  let normalized_class = Utils.normalize_class_name class_name in
  let parent_chain =
    if is_record then []
    else (* parent_chain is ordered immediate parent -> root *)
      List.map ~f:Utils.normalize_class_name parent_chain
  in
  if is_record then ("Record", Option.value record_base_type ~default:"Obj.t")
  else
    (* Use hierarchy detection to determine type *)
    match Hierarchy_detection.get_hierarchy_info ctx class_name with
    | Some hier_info when hier_info.hierarchy <> MonomorphicType ->
        (* This class is in a known hierarchy *)
        let self_variant =
          "`"
          ^ (Utils.to_snake_case normalized_class |> Utils.sanitize_identifier)
        in
        let parent_variants =
          build_parent_chain_variants ~normalized_class ~parent_chain ~hier_info
        in
        let variants =
          String.concat ~sep:" | " (self_variant :: parent_variants)
        in
        let type_name =
          match hier_info.hierarchy with
          | WidgetHierarchy -> "Widget"
          | EventControllerHierarchy -> "Event controller"
          | CellRendererHierarchy -> "Cell renderer"
          | LayoutManagerHierarchy -> "Layout manager"
          | ExpressionHierarchy -> "Expression"
          | MonomorphicType -> class_name
        in
        (type_name, sprintf "[%s] Gobject.obj" variants)
    | _ ->
        (* Monomorphic type or unknown - still use polymorphic variant since all GTK classes inherit from GObject *)
        let variants =
          build_hierarchy_variants ~normalized_class ~parent_chain
        in
        (class_name, sprintf "[%s] Gobject.obj" variants)

(** Indent content with 2 spaces, preserving empty lines *)
let print_indent contents buf =
  let lines = String.split_on_char ~sep:'\n' contents in
  (* Indent the content *)
  List.iter
    ~f:(fun line ->
      if String.trim line <> "" then bprintf buf "  %s\n" line
      else bprintf buf "\n")
    lines

(** Combine return type and output parameters into final type *)
let combine_return_and_out_types ret_type out_types =
  match (ret_type, out_types) with
  | "unit", [] -> "unit"
  | "unit", [ single ] -> single
  | "unit", lst -> String.concat ~sep:" * " lst
  | ret, [] -> ret
  | ret, lst -> String.concat ~sep:" * " (ret :: lst)

(** Check if any method handles the given property *)
let method_handles_property prop_name methods =
  List.exists
    ~f:(fun m ->
      m.set_property
      |> Option.map (String.equal prop_name)
      |> Option.value ~default:false
      || m.get_property
         |> Option.map (String.equal prop_name)
         |> Option.value ~default:false)
    methods

(** Map a GIR type to its OCaml representation with self-reference simplification.
    Returns "unit" for unknown types with a warning to stderr. *)
let map_gir_type_to_ocaml ~ctx ~class_name ~gir_type ~is_nullable =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some mapping ->
      let simplified_type = Type_mappings.simplify_self_reference ~class_name ~ocaml_type:mapping.ocaml_type in
      if is_nullable then
        sprintf "%s option" simplified_type
      else
        simplified_type
  | None ->
      eprintf "Warning: Unknown type: name=%s type=%s\n"
        gir_type.name gir_type.name;
      "unit"

(** Convert a constructor parameter to its OCaml type representation *)
let map_constructor_param ~ctx ~class_name p =
  map_gir_type_to_ocaml ~ctx ~class_name ~gir_type:p.param_type
    ~is_nullable:p.nullable

(** Convert a method parameter to its OCaml type representation *)
let convert_method_param_to_ocaml_type ~ctx ~class_name p =
  match p.direction with
  | Out -> None
  | In | InOut ->
      Some
        (map_gir_type_to_ocaml ~ctx ~class_name
           ~gir_type:p.param_type ~is_nullable:p.nullable)

(** Convert an out parameter to its OCaml type representation *)
let convert_out_param_to_ocaml_type ~ctx ~class_name p =
  match p.direction with
  | Out ->
      Some
        (map_gir_type_to_ocaml ~ctx ~class_name
           ~gir_type:p.param_type ~is_nullable:p.nullable)
  | In | InOut -> None

(** Check if we should generate an accessor method for this class *)
let should_generate_accessor ~class_name hier_info =
  (* Only generate accessor if this is NOT the hierarchy root itself *)
  (* (e.g., Button should have as_widget, but Widget should not have as_widget : t -> Widget.t) *)
  class_name <> hier_info.gir_root

(** Build the base type reference for a hierarchy accessor *)
let build_accessor_base_type ~ctx ~hier_info =
  let gir_root_class = hier_info.gir_root in
  (* Check if the root class is in a cyclic group *)
  match Hashtbl.find_opt ctx.module_groups gir_root_class with
  | Some combined_module_name ->
      let simple_module_name = Utils.module_name_of_class gir_root_class in
      (* Check if this is actually a cyclic module (combined != simple) *)
      if combined_module_name <> simple_module_name then
        (* For cyclic modules, use CombinedModule.ClassName.t *)
        combined_module_name ^ "." ^ simple_module_name ^ ".t"
      else
        (* Single-class module, just use ClassName.t *)
        simple_module_name ^ ".t"
  | None ->
      (* Not in module_groups table at all, use simple ClassName.t *)
      Utils.module_name_of_class gir_root_class ^ ".t"

(** Format an accessor declaration based on output mode *)
let format_accessor_declaration ~output_mode ~accessor ~base_type =
  match output_mode with
  | Implementation ->
      sprintf "let %s (obj : t) : %s = Obj.magic obj\n\n" accessor base_type
  | Interface -> sprintf "val %s : t -> %s\n\n" accessor base_type
