(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Font from cyclic group Context_and__font_and__font_map_and__fontset *)

(** A [PangoFont] is used to represent a font in a rendering-system-independent
    manner.

    Its methods, signals and properties are on {!class-type-font_t}. The
    functions it is built on are in {!Ocpango.Raw.Font}. *)

class type font_t = Context_and__font_and__font_map_and__fontset.font_t
(** {b The methods, signals and properties of a [Font].}

    A [PangoFont] is used to represent a font in a rendering-system-independent
    manner. *)

class font : Raw.Font.t -> font_t
(** Wraps a raw handle of {!Ocpango.Raw.Font.t}. *)
