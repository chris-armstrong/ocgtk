(** Enum and bitfield code generation: OCaml type declarations, C converters,
    and the C implementations of the OCaml converters. *)

val generate_ocaml_enum : Types.gir_enum -> string
(** The OCaml polymorphic-variant type and converter declarations for an enum.
*)

val generate_ocaml_enum_impl : Types.gir_enum -> string
(** The OCaml converter implementations for an enum. *)

val generate_ocaml_bitfield : Types.gir_bitfield -> string
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
