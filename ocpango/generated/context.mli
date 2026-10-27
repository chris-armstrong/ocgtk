(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Context from cyclic group Context_and__font_and__font_map_and__fontset *)

(** A [PangoContext] stores global information used to control the itemization
    process.

    The information stored by [PangoContext] includes the fontmap used to look
    up fonts, and default values such as the default language, default gravity,
    or default font.

    To obtain a [PangoContext], use [Pango.FontMap.create_context].

    Its methods, signals and properties are on {!class-type-context_t}. The
    functions it is built on are in {!Ocpango.Raw.Context}. *)

class type context_t = Context_and__font_and__font_map_and__fontset.context_t
(** The methods, signals and properties of a [PangoContext]. *)

class context : Raw.Context.t -> context_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Context.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoContext], give one already wrapped. *)

val new_ : unit -> context_t
