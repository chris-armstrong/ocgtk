(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Fontset from cyclic group Context_and__font_and__font_map_and__fontset *)

(** A [PangoFontset] represents a set of [PangoFont] to use when rendering text.

    Its methods, signals and properties are on {!class-type-fontset_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Fontset}. *)

(** {1:class Class} *)

class type fontset_t = Context_and__font_and__font_map_and__fontset.fontset_t
(** {b The methods, signals and properties of a [Fontset].}

    Inherits from: [GObject.Object]

    A [PangoFontset] represents a set of [PangoFont] to use when rendering text.

    A [PangoFontset] is the result of resolving a [PangoFontDescription] against
    a particular [PangoContext]. It has operations for finding the component
    font for a particular Unicode character, and for finding a composite set of
    metrics for the entire fontset. *)

class fontset : Raw.Fontset.t -> fontset_t
(** Wraps a raw handle of {!Ocpango.Raw.Fontset.t}. *)

(** {1:description Description}

    A [PangoFontset] represents a set of [PangoFont] to use when rendering text.

    A [PangoFontset] is the result of resolving a [PangoFontDescription] against
    a particular [PangoContext]. It has operations for finding the component
    font for a particular Unicode character, and for finding a composite set of
    metrics for the entire fontset. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
