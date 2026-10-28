(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for FontMap from cyclic group Context_and__font_and__font_map_and__fontset *)

(** A [PangoFontMap] represents the set of fonts available for a particular
    rendering system.

    Its methods, signals and properties are on {!class-type-font_map_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocpango.Raw.Font_map}. *)

(** {1:class Class} *)

class type font_map_t = Context_and__font_and__font_map_and__fontset.font_map_t
(** {b The methods, signals and properties of a [FontMap].}

    A [PangoFontMap] represents the set of fonts available for a particular
    rendering system.

    This is a virtual object with implementations being specific to particular
    rendering systems. *)

class font_map : Raw.Font_map.t -> font_map_t
(** Wraps a raw handle of {!Ocpango.Raw.Font_map.t}. *)

(** {1:description Description}

    A [PangoFontMap] represents the set of fonts available for a particular
    rendering system.

    This is a virtual object with implementations being specific to particular
    rendering systems. *)
