(* GENERATED CODE - DO NOT EDIT *)
(* StyleContext: StyleContext *)

type t = [ `style_context | `object_ ] Gobject.obj
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
    changes, as it uses the [GTK_STYLE_PROVIDER_PRIORITY_USER] priority. *)

(* Methods *)

external to_string : t -> Gtk_enums.stylecontextprintflags -> string
  = "ml_gtk_style_context_to_string"
(** Converts the style context into a string representation.

    The string representation always includes information about the name, state,
    id, visibility and style classes of the CSS node that is backing [context].
    Depending on the flags, more information may be included.

    This function is intended for testing and debugging of the CSS
    implementation in GTK. There are no guarantees about the format of the
    returned string, it may change. *)

external set_state : t -> Gtk_enums.stateflags -> unit
  = "ml_gtk_style_context_set_state"
(** Sets the state to be used for style matching. *)

external set_scale : t -> int -> unit = "ml_gtk_style_context_set_scale"
(** Sets the scale to use when getting image assets for the style. *)

external set_display : t -> Ocgtk_gdk.Gdk.Wrappers.Display.t -> unit
  = "ml_gtk_style_context_set_display"
(** Attaches [context] to the given display.

    The display is used to add style information from “global” style providers,
    such as the display's [GtkSettings] instance.

    If you are using a [GtkStyleContext] returned from
    [Gtk.Widget.get_style_context], you do not need to call this yourself. *)

external save : t -> unit = "ml_gtk_style_context_save"
(** Saves the [context] state.

    This allows temporary modifications done through
    [Gtk.StyleContext.add_class], [Gtk.StyleContext.remove_class],
    [Gtk.StyleContext.set_state] to be quickly reverted in one go through
    [Gtk.StyleContext.restore].

    The matching call to [Gtk.StyleContext.restore] must be done before GTK
    returns to the main loop. *)

external restore : t -> unit = "ml_gtk_style_context_restore"
(** Restores [context] state to a previous stage.

    See [Gtk.StyleContext.save]. *)

external remove_provider : t -> Style_provider.t -> unit
  = "ml_gtk_style_context_remove_provider"
(** Removes [provider] from the style providers list in [context]. *)

external remove_class : t -> string -> unit
  = "ml_gtk_style_context_remove_class"
(** Removes [class_name] from [context]. *)

external lookup_color : t -> string -> bool * Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t
  = "ml_gtk_style_context_lookup_color"
(** Looks up and resolves a color name in the [context] color map. *)

external has_class : t -> string -> bool = "ml_gtk_style_context_has_class"
(** Returns [TRUE] if [context] currently has defined the given class name. *)

external get_state : t -> Gtk_enums.stateflags
  = "ml_gtk_style_context_get_state"
(** Returns the state used for style matching.

    This method should only be used to retrieve the [GtkStateFlags] to pass to
    [GtkStyleContext] methods, like [Gtk.StyleContext.get_padding]. If you need
    to retrieve the current state of a [GtkWidget], use
    [Gtk.Widget.get_state_flags]. *)

external get_scale : t -> int = "ml_gtk_style_context_get_scale"
(** Returns the scale used for assets. *)

external get_padding : t -> Border.t = "ml_gtk_style_context_get_padding"
(** Gets the padding for a given state as a [GtkBorder]. *)

external get_margin : t -> Border.t = "ml_gtk_style_context_get_margin"
(** Gets the margin for a given state as a [GtkBorder]. *)

external get_display : t -> Ocgtk_gdk.Gdk.Wrappers.Display.t
  = "ml_gtk_style_context_get_display"
(** Returns the [GdkDisplay] to which [context] is attached. *)

external get_color : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t
  = "ml_gtk_style_context_get_color"
(** Gets the foreground color for a given state. *)

external get_border : t -> Border.t = "ml_gtk_style_context_get_border"
(** Gets the border for a given state as a [GtkBorder]. *)

external add_provider : t -> Style_provider.t -> int -> unit
  = "ml_gtk_style_context_add_provider"
(** Adds a style provider to [context], to be used in style construction.

    Note that a style provider added by this function only affects the style of
    the widget to which [context] belongs. If you want to affect the style of
    all widgets, use [Gtk.StyleContext.add_provider_for_display].

    Note: If both priorities are the same, a [GtkStyleProvider] added through
    this function takes precedence over another added through
    [Gtk.StyleContext.add_provider_for_display]. *)

external add_class : t -> string -> unit = "ml_gtk_style_context_add_class"
(** Adds a style class to [context], so later uses of the style context will
    make use of this new class for styling.

    In the CSS file format, a [GtkEntry] defining a “search” class, would be
    matched by:

    {[
    entry.search { ... }
    ]}

    While any widget defining a “search” class would be matched by:

    {[
    .search { ... }
    ]} *)

(* Properties *)
