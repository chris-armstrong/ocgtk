(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for FontFamily from cyclic group Font_face_and__font_family *)

(** A [PangoFontFamily] is used to represent a family of related font faces.

    The font faces in a family share a common design, but differ in slant,
    weight, width or other aspects.

    Its methods, signals and properties are on {!class-type-font_family_t}. The
    functions it is built on are in {!Ocpango.Raw.Font_family}. *)

class type font_family_t = Font_face_and__font_family.font_family_t
(** The methods, signals and properties of a [PangoFontFamily]. *)

class font_family : Raw.Font_family.t -> font_family_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Font_family.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoFontFamily], give one already wrapped. *)
