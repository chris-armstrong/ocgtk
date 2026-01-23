(** C Stub Code Generation - Class/Interface Support *)

(** {1 Public API} *)

val generate_forward_decls :
  classes:Types.gir_class list -> interfaces:Types.gir_interface list -> string
(** Generate forward declaration macros for class and interface conversion
    functions. Creates #define macros for Val_<type> and <type>_val conversions
    that map between OCaml values and C pointers using helper functions. Avoids
    duplicate declarations using a hashtable of seen types to handle shared
    inheritance. Returns the complete C macro declarations as a string. *)
