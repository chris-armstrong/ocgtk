(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for FontFamily from cyclic group Font_face_and__font_family *)

(** A [PangoFontFamily] is used to represent a family of related font faces.

    Its methods, signals and properties are on {!class-type-font_family_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Font_family}. *)

(** {1:class Class} *)

class type font_family_t = Font_face_and__font_family.font_family_t
(** {b The methods, signals and properties of a [FontFamily].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}

    A [PangoFontFamily] is used to represent a family of related font faces.

    The font faces in a family share a common design, but differ in slant,
    weight, width or other aspects. *)

class font_family : Raw.Font_family.t -> font_family_t
(** Wraps a raw handle of {!Ocpango.Raw.Font_family.t}. *)

(** {1:description Description}

    A [PangoFontFamily] is used to represent a family of related font faces.

    The font faces in a family share a common design, but differ in slant,
    weight, width or other aspects. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
