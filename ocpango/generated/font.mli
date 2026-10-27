(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Font from cyclic group Context_and__font_and__font_map_and__fontset *)

(** A [PangoFont] is used to represent a font in a rendering-system-independent
    manner.

    Its methods, signals and properties are on {!class-type-font_t}. The
    functions it is built on are in {!Ocpango.Raw.Font}. *)

class type font_t = Context_and__font_and__font_map_and__fontset.font_t
(** The methods, signals and properties of a [PangoFont]. *)

class font : Raw.Font.t -> font_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Font.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoFont], give one already wrapped. *)
