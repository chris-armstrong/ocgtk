(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Context from cyclic group Context_and__font_and__font_map_and__fontset *)

(** A [PangoContext] stores global information used to control the itemization
    process.

    Its methods, signals and properties are on {!class-type-context_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Context}. *)

(** {1:class Class} *)

class type context_t = Context_and__font_and__font_map_and__fontset.context_t
(** {b The methods, signals and properties of a [Context].}

    Inherits from: [GObject.Object]

    A [PangoContext] stores global information used to control the itemization
    process.

    The information stored by [PangoContext] includes the fontmap used to look
    up fonts, and default values such as the default language, default gravity,
    or default font.

    To obtain a [PangoContext], use [Pango.FontMap.create_context]. *)

class context : Raw.Context.t -> context_t
(** Wraps a raw handle of {!Ocpango.Raw.Context.t}. *)

(** {1:description Description}

    A [PangoContext] stores global information used to control the itemization
    process.

    The information stored by [PangoContext] includes the fontmap used to look
    up fonts, and default values such as the default language, default gravity,
    or default font.

    To obtain a [PangoContext], use [Pango.FontMap.create_context]. *)

(** {1:constructors Constructors} *)

val new_ : unit -> context_t
(** Creates a new [PangoContext] initialized to default values.

    This function is not particularly useful as it should always be followed by
    a [Pango.Context.set_font_map] call, and the function
    [Pango.FontMap.create_context] does these two steps together and hence users
    are recommended to use that.

    If you are using Pango as part of a higher-level system, that system may
    have it's own way of create a [PangoContext]. For instance, the GTK toolkit
    has, among others, [gtk_widget_get_pango_context()]. Use those instead. *)
