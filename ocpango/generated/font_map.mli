(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for FontMap from cyclic group Context_and__font_and__font_map_and__fontset *)

(** A [PangoFontMap] represents the set of fonts available for a particular
    rendering system.

    This is a virtual object with implementations being specific to particular
    rendering systems.

    Its methods, signals and properties are on {!class-type-font_map_t}. The
    functions it is built on are in {!Ocpango.Raw.Font_map}. *)

class type font_map_t = Context_and__font_and__font_map_and__fontset.font_map_t
(** The methods, signals and properties of a [PangoFontMap]. *)

class font_map : Raw.Font_map.t -> font_map_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Font_map.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoFontMap], give one already wrapped. *)
