(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Fontset from cyclic group Context_and__font_and__font_map_and__fontset *)

(** A [PangoFontset] represents a set of [PangoFont] to use when rendering text.

    A [PangoFontset] is the result of resolving a [PangoFontDescription] against
    a particular [PangoContext]. It has operations for finding the component
    font for a particular Unicode character, and for finding a composite set of
    metrics for the entire fontset.

    Its methods, signals and properties are on {!class-type-fontset_t}. The
    functions it is built on are in {!Ocpango.Raw.Fontset}. *)

class type fontset_t = Context_and__font_and__font_map_and__fontset.fontset_t
(** The methods, signals and properties of a [PangoFontset]. *)

class fontset : Raw.Fontset.t -> fontset_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Fontset.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoFontset], give one already wrapped. *)
