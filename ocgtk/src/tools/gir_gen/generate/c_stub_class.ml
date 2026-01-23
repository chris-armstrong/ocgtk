(* C Stub Code Generation - Class/Interface Support *)

open Printf
open Containers
open StdLabels
open Types

module Log =
  (val Logs.src_log
         (Logs.Src.create "gir_gen.c_stub_class"
            ~doc:"C stub code generation for class/interface support"))

(* [generate_forward_decls ~classes ~interfaces] generates forward declaration macros for
    class and interface conversion functions. Creates #define macros for Val_<type> and <type>_val
    conversions that map between OCaml values and C pointers using helper functions. The Val_<type>
    macro wraps ml_gobject_val_of_ext, while <type>_val extracts via ml_gobject_ext_of_val.
    Avoids duplicate declarations using a hashtable of seen types to handle shared inheritance.
    Returns the complete C macro declarations as a string. *)
let generate_forward_decls ~classes ~interfaces =
  let buf = Buffer.create 2048 in
  let seen = Hashtbl.create 97 in

  (* Generate class conversion macros *)
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
