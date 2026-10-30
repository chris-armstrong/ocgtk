(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for FontFace from cyclic group Font_face_and__font_family *)

(** A [PangoFontFace] is used to represent a group of fonts with the same
    family, slant, weight, and width, but varying sizes.

    Its methods, signals and properties are on {!class-type-font_face_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocpango.Raw.Font_face}. *)

(** {1:class Class} *)

class type font_face_t = Font_face_and__font_family.font_face_t
(** {b The methods, signals and properties of a [FontFace].}

    A [PangoFontFace] is used to represent a group of fonts with the same
    family, slant, weight, and width, but varying sizes. *)

class font_face : Raw.Font_face.t -> font_face_t
(** Wraps a raw handle of {!Ocpango.Raw.Font_face.t}. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
