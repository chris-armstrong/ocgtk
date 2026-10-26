(* Package, library and module names for generated code *)

open StdLabels
open Types

let package_name namespace = "oc" ^ String.lowercase_ascii namespace
let main_module namespace = String.capitalize_ascii (package_name namespace)
let raw_module namespace = main_module namespace ^ "_raw"
let enums_module namespace = main_module namespace ^ "_enums"
let enums_file_stem namespace = package_name namespace ^ "_enums"
let raw_alias_module = "Raw"
let enums_alias_module = "Enums"
let constants_module = "Constants"
let raw_library_public_name namespace = package_name namespace ^ ".raw"
let enums_library_public_name namespace = package_name namespace ^ ".enums"
let stubs_library_name namespace = package_name namespace ^ "_raw_stubs"
let stubs_library_public_name namespace = package_name namespace ^ ".raw.stubs"

let stubs_batch_library_name namespace i =
  Fmt.str "%s_batch_%d" (stubs_library_name namespace) i

let stubs_batch_library_public_name namespace i =
  Fmt.str "%s.raw.stubs_batch_%d" (package_name namespace) i

let raw_generated_dir = Filename.concat "raw" "generated"
let raw_core_dir = Filename.concat "raw" "core"
let enums_generated_dir = Filename.concat "enums" "generated"
let main_generated_dir = "generated"
let main_core_dir = "core"
let layer2_module_name name = Utils.module_name_of_class name

let layer2_module_filename name =
  String.uncapitalize_ascii (layer2_module_name name)

let in_cluster ~cluster simple =
  if String.equal cluster simple then simple else cluster ^ "." ^ simple

let same_ns_layer1_module ~ctx name =
  let simple = Utils.module_name_of_class name in
  match ctx.target_library with
  | Main_library -> raw_alias_module ^ "." ^ simple
  | Raw_library ->
      if List.mem name ~set:ctx.current_cycle_classes then simple
      else
        Hashtbl.find_opt ctx.module_groups name
        |> Option.fold ~none:simple ~some:(fun cluster ->
            in_cluster ~cluster simple)

let cross_ns_layer1_module ~ctx ~namespace name =
  let simple = Utils.module_name_of_class name in
  match ctx.target_library with
  | Main_library ->
      main_module namespace ^ "." ^ raw_alias_module ^ "." ^ simple
  | Raw_library -> raw_module namespace ^ "." ^ simple

let is_current_namespace ~ctx namespace =
  String.equal namespace ctx.namespace.namespace_name

let namespace_enums_module ~ctx namespace =
  match ctx.target_library with
  | Raw_library -> enums_module namespace
  | Main_library ->
      if is_current_namespace ~ctx namespace then enums_alias_module
      else main_module namespace ^ "." ^ enums_alias_module

let namespace_constants_module ~ctx namespace =
  if is_current_namespace ~ctx namespace then constants_module
  else main_module namespace ^ "." ^ constants_module

let cross_ns_layer2_module ~namespace name =
  main_module namespace ^ "." ^ layer2_module_name name

let raw_library_ctx ctx = { ctx with target_library = Raw_library }
let main_library_ctx ctx = { ctx with target_library = Main_library }
