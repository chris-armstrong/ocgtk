(** C Stub Code Generation - Bitfield Support *)

val emit_bitfield_proto :
  Buffer.t -> namespace:string -> Types.gir_bitfield -> unit
(** [emit_bitfield_proto buf ~namespace bitfield] emits the C function
    prototypes for bitfield conversion functions (OCaml value to C bitfield and
    vice versa) to the given buffer. *)

val generate_forward_decls :
  namespace_prefix:string -> gtk_bitfields:Types.gir_bitfield list -> string
(** [generate_forward_decls ~namespace_prefix ~gtk_bitfields] generates forward
    declarations for bitfield converter functions.

    - [namespace_prefix]: The namespace prefix for GTK bitfield converters
    - [gtk_bitfields]: List of GTK bitfields to generate forward declarations
      for

    Returns a string containing all forward declarations. *)
