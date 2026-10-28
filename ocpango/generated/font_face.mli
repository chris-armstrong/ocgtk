(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for FontFace from cyclic group Font_face_and__font_family *)

(** A [PangoFontFace] is used to represent a group of fonts with the same
    family, slant, weight, and width, but varying sizes.

    Its methods, signals and properties are on {!class-type-font_face_t}. The
    functions it is built on are in {!Ocpango.Raw.Font_face}. *)

class type font_face_t = Font_face_and__font_family.font_face_t
(** The methods, signals and properties of a [FontFace]. *)

class font_face : Raw.Font_face.t -> font_face_t
(** Wraps a raw handle of {!Ocpango.Raw.Font_face.t}. *)
