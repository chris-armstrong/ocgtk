(** Enum and bitfield code generation: OCaml type declarations, C converters,
    and the C implementations of the OCaml converters. *)

val variant_name_of_member : string -> string
(** The polymorphic variant tag of an enumeration or bitfield member, without
    the backtick: the name in upper case, prefixed with [V] when it starts with
    a digit. *)

val generate_ocaml_enum : refs:Doc_resolve.env -> Types.gir_enum -> string
(** The OCaml polymorphic-variant type and converter declarations for an enum.
    [refs] resolves the docs' references; enum docs are shared by both layers
    and link like layer 2 docs. *)

val generate_ocaml_enum_impl : Types.gir_enum -> string
(** The OCaml converter implementations for an enum. *)

val generate_ocaml_bitfield :
  refs:Doc_resolve.env -> Types.gir_bitfield -> string
(** The OCaml polymorphic-variant type and converter declarations for a
    bitfield. *)

val generate_ocaml_bitfield_impl : Types.gir_bitfield -> string
(** The OCaml converter implementations for a bitfield. *)

val generate_c_enum_converters :
  namespace:string -> class_version:string option -> Types.gir_enum -> string
(** The C converters between OCaml variants and the enum's C values. *)

val generate_c_bitfield_converters :
  namespace:string ->
  class_version:string option ->
  Types.gir_bitfield ->
  string
(** The C converters between OCaml variants and the bitfield's C flags. *)
