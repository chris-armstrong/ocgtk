open StdLabels
open Types

type t = {
  ctx : generation_context;
  entities : entity list;
  module_groups : Dependency_analysis.module_group list;
  header_overrides : Override_types.header_override list;
  ignored_entities : string list;
  override_warnings : string list;
}

type error =
  | Override_error of { file : string; error : Override_parser.parse_error }
  | Reference_error of { file : string; reason : string }

let format_error = function
  | Override_error { file; error } ->
      Fmt.str "override file %s: %s" file (Override_parser.format_error error)
  | Reference_error { file; reason } ->
      Fmt.str "references file %s: %s" file reason

let namespace_cross_references (crn : cross_reference_namespace) =
  {
    ncr_namespace_name = crn.cr_namespace_name;
    ncr_namespace_packages = crn.cr_namespace_packages;
    ncr_namespace_c_includes = crn.cr_namespace_c_includes;
    ncr_namespace_includes = crn.cr_namespace_includes;
    ncr_entities =
      List.fold_left crn.cr_entities ~init:StringMap.empty
        ~f:(fun entities (cr : cross_reference_entity) ->
          StringMap.add cr.cr_name cr entities);
  }

(* [load_sexp_conv] reports conversion errors as a value, but reading and
   parsing the file still raise. *)
let load_reference_file file =
  match Sexplib.Sexp.load_sexp_conv file cross_reference_namespace_of_sexp with
  | `Result crn -> Ok (namespace_cross_references crn)
  | `Error (exn, _) ->
      Error (Reference_error { file; reason = Printexc.to_string exn })
  | exception ((Sys_error _ | Failure _ | Sexplib.Sexp.Parse_error _) as exn) ->
      Error (Reference_error { file; reason = Printexc.to_string exn })

let load_reference_files reference_files =
  List.fold_left reference_files ~init:(Ok StringMap.empty) ~f:(fun acc file ->
      let ( let* ) = Result.bind in
      let* loaded = acc in
      let* ncr = load_reference_file file in
      Ok (StringMap.add ncr.ncr_namespace_name ncr loaded))

let build_generation_context ~namespace ~repository ~classes ~interfaces ~enums
    ~bitfields ~records ~constants ~cross_references =
  let generated_classes =
    List.filter ~f:Generate.Filtering.should_generate_class classes
  in
  let generated_interfaces =
    List.filter ~f:Generate.Filtering.should_generate_interface interfaces
  in
  let records =
    List.filter ~f:Generate.Filtering.should_generate_record records
  in
  let ctx_initial : generation_context =
    {
      namespace;
      repository;
      classes;
      interfaces;
      enums;
      bitfields;
      records;
      constants;
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references;
      target_library = Raw_library;
      doc_index =
        Generate.Doc_index.build ~namespace:namespace.namespace_name ~classes
          ~interfaces ~records ~enums ~bitfields ~constants ~cross_references;
    }
  in
  let entities =
    List.map ~f:entity_of_class generated_classes
    @ List.map ~f:entity_of_interface generated_interfaces
    @ List.map ~f:entity_of_record records
  in
  let module_groups_list =
    Dependency_analysis.compute_module_groups ctx_initial entities
  in
  let module_groups =
    Dependency_analysis.create_module_groups_table module_groups_list
  in
  let ctx = { ctx_initial with module_groups } in
  let ctx =
    { ctx with doc_index = Generate.Doc_index.with_members ~ctx entities }
  in
  (ctx, entities, module_groups_list)

let no_overrides ~classes ~interfaces ~enums ~bitfields ~records :
    Override_apply.apply_result * Override_types.header_override list =
  ( {
      classes;
      interfaces;
      enums;
      bitfields;
      records;
      functions = [];
      ignored_entities = [];
      warnings = [];
    },
    [] )

(* Overrides are applied before the context is built: ignored entities must be
   absent from it so that [find_type_mapping_for_gir_type] returns [None] for
   their types. [parse_gir_file] does not extract namespace-level functions, so
   there are none to filter. *)
let apply_overrides_file ~classes ~interfaces ~enums ~bitfields ~records file =
  match Override_parser.parse_overrides file with
  | Error error -> Error (Override_error { file; error })
  | Ok overrides ->
      Ok
        ( Override_apply.apply_overrides ~overrides ~classes ~interfaces ~enums
            ~bitfields ~records ~functions:[],
          overrides.headers )

let load ?(filter_classes = []) ?overrides_file ~reference_files gir_file =
  let ( let* ) = Result.bind in
  let ( repository,
        namespace,
        classes,
        interfaces,
        enums,
        bitfields,
        records,
        constants ) =
    Parse.Gir_parser.parse_gir_file gir_file filter_classes
  in
  let* (applied : Override_apply.apply_result), header_overrides =
    Option.fold
      ~none:(Ok (no_overrides ~classes ~interfaces ~enums ~bitfields ~records))
      ~some:
        (apply_overrides_file ~classes ~interfaces ~enums ~bitfields ~records)
      overrides_file
  in
  let* cross_references = load_reference_files reference_files in
  let ctx, entities, module_groups =
    build_generation_context ~namespace ~repository ~classes:applied.classes
      ~interfaces:applied.interfaces ~enums:applied.enums
      ~bitfields:applied.bitfields ~records:applied.records ~constants
      ~cross_references
  in
  Ok
    {
      ctx;
      entities;
      module_groups;
      header_overrides;
      ignored_entities = applied.ignored_entities;
      override_warnings = applied.warnings;
    }
