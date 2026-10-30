(* Constant Code Generation *)

open Types

val ocaml_name_of_constant : string -> string
(** The OCaml value of a GIR constant name: ["PANGO_SCALE"] -> ["pango_scale"].
*)

val is_generated : gir_constant -> bool
(** Whether the constant is emitted: its type has an OCaml literal form.
    Constants of other types are skipped. *)

val generate_constants_interface :
  refs:Doc_resolve.env -> namespace:string -> gir_constant list -> string
(** Generate the .mli file content for the constants of a namespace. Returns
    just the file header when [constants] is empty. [refs] resolves the docs'
    references; constant docs link like layer 2 docs. *)

val generate_constants_implementation :
  namespace:string -> gir_constant list -> string
(** Generate the .ml file content for the constants of a namespace. Returns just
    the file header when [constants] is empty. *)
