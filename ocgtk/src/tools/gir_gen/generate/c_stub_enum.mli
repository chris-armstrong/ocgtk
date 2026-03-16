(** C Stub Code Generation - Enum Support *)

(** [emit_enum_proto buf ~namespace enum] emits the C function prototypes for
    enum conversion functions (OCaml value to C enum and vice versa) to the
    given buffer. *)
val emit_enum_proto : Buffer.t -> namespace:string -> Types.gir_enum -> unit

(** [generate_forward_decls ~namespace_prefix ~gtk_enums]
    generates forward declarations for enum converter functions.
    
    - [namespace_prefix]: The namespace prefix for GTK enum converters
    - [gtk_enums]: List of GTK enums to generate forward declarations for
    
    Returns a string containing all forward declarations. *)
val generate_forward_decls :
  namespace_prefix:string ->
  gtk_enums:Types.gir_enum list ->
  string
