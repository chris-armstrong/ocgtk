(* C Stub Code Generation - Class/Interface Support *)

open Printf
open Containers
open StdLabels
open Types

(* Re-export from method module *)
module C_stub_method = C_stub_method

(* Re-export from constructor module *)
module C_stub_constructor = C_stub_constructor

(* Re-export from property module *)
module C_stub_property = C_stub_property

module Log =
  (val Logs.src_log
         (Logs.Src.create "gir_gen.c_stub_class"
            ~doc:"C stub code generation for class/interface support"))

(* [generate_class_c_code ~ctx ~c_type class_name constructors methods properties]
   generates the complete C stub code for a class or interface. Produces C header,
   C wrapper functions for constructors, methods, and properties. Skips constructors with
   unsupported features (throws, varargs, cross-namespace types, array params). Generates
   property getters and setters only if configured to be generated. Returns the full C file
   content including header and all wrapper functions as a single string. *)
let generate_class_c_code ~ctx ~c_type class_name constructors methods
    properties =
  let buf = Buffer.create 4096 in

  (* Add header *)
  Buffer.add_string buf
    (C_stub_helpers.generate_c_file_header ~ctx ~class_name
       ~external_enums:ctx.external_enums
       ~external_bitfields:ctx.external_bitfields ());

  (* Note: Record-specific conversions are generated in generate_record_c_code, not here *)

   (* Constructors - skip those that throw GError, are variadic, have cross-namespace types, or have array params *)
   C_stub_helpers.generate_constructors ~ctx ~c_type ~class_name ~buf
     ~generator:C_stub_constructor.generate_c_constructor constructors;

   (* Generate methods, skip duplicates *)
   C_stub_helpers.generate_methods ~ctx ~c_type ~class_name ~buf
     ~generator:C_stub_method.generate_c_method methods;

   (* Generate property getters and setters *)
   List.iter
     ~f:(fun (prop : gir_property) ->
       if Filtering.should_generate_property ~ctx ~class_name ~methods prop then begin
         if prop.readable then
           Buffer.add_string buf
             (C_stub_property.generate_c_property_getter ~ctx ~c_type prop class_name);
         if prop.writable && not prop.construct_only then
           Buffer.add_string buf
             (C_stub_property.generate_c_property_setter ~ctx ~c_type prop class_name)
       end)
     properties;

   Buffer.contents buf

(* [generate_forward_decls ~classes ~interfaces] generates forward declaration macros for
   class and interface conversion functions. Creates #define macros for Val_<type> and <type>_val
   conversions that map between OCaml values and C pointers using helper functions. The Val_<type>
   macro wraps ml_gobject_val_of_ext, while <type>_val extracts via ml_gobject_ext_of_val.
   Avoids duplicate declarations using a hashtable of seen types to handle shared inheritance.
   Returns the complete C macro declarations as a string. *)
let generate_forward_decls ~classes ~interfaces =
  let buf = Buffer.create 2048 in
  let seen = Hashtbl.create 97 in

  Buffer.add_string buf "/* Class-specific conversion macros (shared) */\n";
  List.iter
    ~f:(fun (cls : gir_class) ->
      if not (Hashtbl.mem seen cls.c_type) then begin
        Hashtbl.add seen cls.c_type ();
        bprintf buf "#ifndef Val_%s\n" cls.c_type;
        bprintf buf "#define %s_val(val) ((%s*)ml_gobject_ext_of_val(val))\n"
          cls.c_type cls.c_type;
        bprintf buf
          "#define Val_%s(obj) ((value)(ml_gobject_val_of_ext(obj)))\n"
          cls.c_type;
        bprintf buf "#endif /* Val_%s */\n\n" cls.c_type
      end)
    classes;
  (* Add interface conversion macros *)
  Buffer.add_string buf "/* Interface-specific conversion macros (shared) */\n";
  List.iter
    ~f:(fun (intf : gir_interface) ->
      if not (Hashtbl.mem seen intf.c_type) then begin
        Hashtbl.add seen intf.c_type ();
        bprintf buf "#ifndef Val_%s\n" intf.c_type;
        bprintf buf "#define %s_val(val) ((%s*)ml_gobject_ext_of_val(val))\n"
          intf.c_type intf.c_type;
        bprintf buf
          "#define Val_%s(obj) ((value)(ml_gobject_val_of_ext(obj)))\n"
          intf.c_type;
        bprintf buf "#endif /* Val_%s */\n\n" intf.c_type
      end)
    interfaces;

  Buffer.contents buf

(* Re-export generate_c_constructor for backward compatibility *)
let generate_c_constructor = C_stub_constructor.generate_c_constructor

(* Re-export generate_c_method for backward compatibility *)
let generate_c_method = C_stub_method.generate_c_method

(* Re-export generate_c_property_getter for backward compatibility *)
let generate_c_property_getter = C_stub_property.generate_c_property_getter

(* Re-export generate_c_property_setter for backward compatibility *)
let generate_c_property_setter = C_stub_property.generate_c_property_setter
