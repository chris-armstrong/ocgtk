(** C Stub Code Generation - Enum Support *)

(** [emit_enum_proto buf ~namespace enum] emits the C function prototypes for
    enum conversion functions (OCaml value to C enum and vice versa) to the
    given buffer. *)
val emit_enum_proto : Buffer.t -> namespace:string -> Types.gir_enum -> unit

(** [generate_forward_decls ~namespace_prefix ~gtk_enums ~external_enums]
    generates forward declarations for enum converter functions.
    
    - [namespace_prefix]: The namespace prefix for GTK enum converters
    - [gtk_enums]: List of GTK enums to generate forward declarations for
    - [external_enums]: List of (namespace, enum) pairs for external namespace enums
    
    Returns a string containing all forward declarations. *)
val generate_forward_decls :
  namespace_prefix:string ->
  gtk_enums:Types.gir_enum list ->
  external_enums:(string * Types.gir_enum) list ->
  string
