(* SPDX-License-Identifier: MIT *)
(* Copyright (C) 2025 - LablGtk contributors *)

open Types
open Utils

(* Generate a top-level library module that exposes:
   1. Direct references to each class (including mutually recursive classes)
   2. A Wrappers submodule with module aliases for layer 1 modules
   3. Direct references to each enumeration at the same level as classes

   This makes it easier to find each class and enumeration by putting them
   at the top-level instead of in their respective modules, while still
   taking advantage of module aliasing to prevent needing to reference
   everything in the library at compile time.
*)

let get_class_module_reference ~ctx class_name =
  (* Get the qualified module path for a class *)
  match Hashtbl.find_opt ctx.module_groups class_name with
  | Some combined_module_name when combined_module_name <> module_name_of_class class_name ->
      (* This is part of a cyclic module *)
      Printf.sprintf "%s.%s" combined_module_name (module_name_of_class class_name)
  | _ ->
      (* This is a standalone module *)
      module_name_of_class class_name

let generate_library_interface ~ctx =
  (* Generate the .mli signature file *)
  let buf = Buffer.create 4096 in

  Buffer.add_string buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  Buffer.add_string buf "(* Top-level library module with direct references to all classes and enumerations *)\n\n";

  (* Collect all class/interface names *)
  let all_entities =
    (List.map (fun (c : gir_class) -> c.class_name) ctx.classes) @
    (List.map (fun (i : gir_interface) -> i.interface_name) ctx.interfaces)
  in
  let sorted_entities = List.sort String.compare all_entities in

  (* Generate class references (layer 2 wrapper classes) *)
  if List.length sorted_entities > 0 then begin
    Buffer.add_string buf "(** {1 Classes and Interfaces} *)\n\n";
    List.iter (fun name ->
      let class_name_lower = to_snake_case name in
      let g_module_name = "G" ^ module_name_of_class name in
      Printf.bprintf buf "class %s = %s.%s\n" class_name_lower g_module_name class_name_lower
    ) sorted_entities;
    Buffer.add_string buf "\n"
  end;

  (* Generate Wrappers submodule with layer 1 module aliases *)
  if List.length sorted_entities > 0 then begin
    Buffer.add_string buf "(** {1 Layer 1 Module Wrappers}\n";
    Buffer.add_string buf "    \n";
    Buffer.add_string buf "    This submodule provides aliases to the layer 1 (low-level) modules.\n";
    Buffer.add_string buf "    These are the modules containing external declarations and basic bindings.\n";
    Buffer.add_string buf " *)\n";
    Buffer.add_string buf "module Wrappers : sig\n";
    List.iter (fun name ->
      let module_ref = get_class_module_reference ~ctx name in
      Printf.bprintf buf "  module %s = %s\n" (module_name_of_class name) module_ref
    ) sorted_entities;
    Buffer.add_string buf "end\n\n"
  end;

  (* Generate enumeration and bitfield references *)
  let namespace_lower = String.lowercase_ascii ctx.namespace.namespace_name in
  let has_enums = List.length ctx.enums > 0 in
  let has_bitfields = List.length ctx.bitfields > 0 in

  if has_enums || has_bitfields then begin
    Buffer.add_string buf "(** {1 Enumerations and Bitfields} *)\n\n";

    if has_enums then begin
      let sorted_enums = List.sort (fun (a : gir_enum) (b : gir_enum) ->
        String.compare a.enum_name b.enum_name) ctx.enums in
      List.iter (fun (enum : gir_enum) ->
        let enum_module = module_name_of_class enum.enum_name in
        Printf.bprintf buf "module %s = %s_enums.%s\n"
          enum_module namespace_lower enum_module
      ) sorted_enums
    end;

    if has_bitfields then begin
      let sorted_bitfields = List.sort (fun (a : gir_bitfield) (b : gir_bitfield) ->
        String.compare a.bitfield_name b.bitfield_name) ctx.bitfields in
      List.iter (fun (bitfield : gir_bitfield) ->
        let bitfield_module = module_name_of_class bitfield.bitfield_name in
        Printf.bprintf buf "module %s = %s_enums.%s\n"
          bitfield_module namespace_lower bitfield_module
      ) sorted_bitfields
    end
  end;

  Buffer.contents buf

let generate_library_implementation ~ctx =
  (* Generate the .ml implementation file *)
  let buf = Buffer.create 4096 in

  Buffer.add_string buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  Buffer.add_string buf "(* Top-level library module with direct references to all classes and enumerations *)\n\n";

  (* Collect all class/interface names *)
  let all_entities =
    (List.map (fun (c : gir_class) -> c.class_name) ctx.classes) @
    (List.map (fun (i : gir_interface) -> i.interface_name) ctx.interfaces)
  in
  let sorted_entities = List.sort String.compare all_entities in

  (* Generate class references (layer 2 wrapper classes) *)
  if List.length sorted_entities > 0 then begin
    Buffer.add_string buf "(** Classes and Interfaces *)\n\n";
    List.iter (fun name ->
      let class_name_lower = to_snake_case name in
      let g_module_name = "G" ^ module_name_of_class name in
      Printf.bprintf buf "class %s = %s.%s\n" class_name_lower g_module_name class_name_lower
    ) sorted_entities;
    Buffer.add_string buf "\n"
  end;

  (* Generate Wrappers submodule *)
  if List.length sorted_entities > 0 then begin
    Buffer.add_string buf "(** Layer 1 Module Wrappers *)\n";
    Buffer.add_string buf "module Wrappers = struct\n";
    List.iter (fun name ->
      let module_ref = get_class_module_reference ~ctx name in
      Printf.bprintf buf "  module %s = %s\n" (module_name_of_class name) module_ref
    ) sorted_entities;
    Buffer.add_string buf "end\n\n"
  end;

  (* Generate enumeration and bitfield references *)
  let namespace_lower = String.lowercase_ascii ctx.namespace.namespace_name in
  let has_enums = List.length ctx.enums > 0 in
  let has_bitfields = List.length ctx.bitfields > 0 in

  if has_enums || has_bitfields then begin
    Buffer.add_string buf "(** Enumerations and Bitfields *)\n\n";

    if has_enums then begin
      let sorted_enums = List.sort (fun (a : gir_enum) (b : gir_enum) ->
        String.compare a.enum_name b.enum_name) ctx.enums in
      List.iter (fun (enum : gir_enum) ->
        let enum_module = module_name_of_class enum.enum_name in
        Printf.bprintf buf "module %s = %s_enums.%s\n"
          enum_module namespace_lower enum_module
      ) sorted_enums
    end;

    if has_bitfields then begin
      let sorted_bitfields = List.sort (fun (a : gir_bitfield) (b : gir_bitfield) ->
        String.compare a.bitfield_name b.bitfield_name) ctx.bitfields in
      List.iter (fun (bitfield : gir_bitfield) ->
        let bitfield_module = module_name_of_class bitfield.bitfield_name in
        Printf.bprintf buf "module %s = %s_enums.%s\n"
          bitfield_module namespace_lower bitfield_module
      ) sorted_bitfields
    end
  end;

  Buffer.contents buf

let generate_library_module ~ctx =
  (* Generate both .ml and .mli files *)
  let mli_content = generate_library_interface ~ctx in
  let ml_content = generate_library_implementation ~ctx in
  (ml_content, mli_content)
