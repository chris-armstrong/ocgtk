(** [GtkStyleContext] stores styling information affecting a widget.

    In order to construct the final style information, [GtkStyleContext] queries
    information from all attached [GtkStyleProviders]. Style providers can be
    either attached explicitly to the context through
    [Gtk.StyleContext.add_provider], or to the display through
    [Gtk.StyleContext.add_provider_for_display]. The resulting style is a
    combination of all providers’ information in priority order.

    For GTK widgets, any [GtkStyleContext] returned by
    [Gtk.Widget.get_style_context] will already have a [GdkDisplay] and RTL/LTR
    information set. The style context will also be updated automatically if any
    of these settings change on the widget.

    {b Style Classes}

    Widgets can add style classes to their context, which can be used to
    associate different styles by class. The documentation for individual
    widgets lists which style classes it uses itself, and which style classes
    may be added by applications to affect their appearance.

    {b Custom styling in UI libraries and applications}

    If you are developing a library with custom widgets that render differently
    than standard components, you may need to add a [GtkStyleProvider] yourself
    with the [GTK_STYLE_PROVIDER_PRIORITY_FALLBACK] priority, either a
    [GtkCssProvider] or a custom object implementing the [GtkStyleProvider]
    interface. This way themes may still attempt to style your UI elements in a
    different way if needed so.

    If you are using custom styling on an applications, you probably want then
    to make your style information prevail to the theme’s, so you must use a
    [GtkStyleProvider] with the [GTK_STYLE_PROVIDER_PRIORITY_APPLICATION]
    priority, keep in mind that the user settings in
    [XDG_CONFIG_HOME/gtk-4.0/gtk.css] will still take precedence over your
    changes, as it uses the [GTK_STYLE_PROVIDER_PRIORITY_USER] priority.

    Its methods, signals and properties are on {!class-type-style_context_t}.
    The functions it is built on are in {!Ocgtk.Raw.Style_context}. *)

(** The methods, signals and properties of a [GtkStyleContext]. *)
class type style_context_t = object
  method add_class : string -> unit
  method add_provider : Style_provider.style_provider_t -> int -> unit
  method get_display : unit -> Ocgdk.Display.display_t
  method get_scale : unit -> int
  method get_state : unit -> Enums.stateflags
  method has_class : string -> bool
  method remove_class : string -> unit
  method remove_provider : Style_provider.style_provider_t -> unit
  method restore : unit -> unit
  method save : unit -> unit
  method set_display : Ocgdk.Display.display_t -> unit
  method set_scale : int -> unit
  method set_state : Enums.stateflags -> unit
  method to_string : Enums.stylecontextprintflags -> string
  method as_style_context : Raw.Style_context.t
end

class style_context : Raw.Style_context.t -> style_context_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Style_context.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkStyleContext], give one already wrapped. *)
