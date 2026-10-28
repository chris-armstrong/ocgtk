(** [GtkStyleContext] stores styling information affecting a widget.

    Its methods, signals and properties are on {!class-type-style_context_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Style_context}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [StyleContext].}

    [GtkStyleContext] stores styling information affecting a widget.

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
class type style_context_t = object
  (** {2:methods Methods} *)

  method add_class : string -> unit
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

  method add_provider : Style_provider.style_provider_t -> int -> unit
  (** Adds a style provider to [context], to be used in style construction.

      Note that a style provider added by this function only affects the style
      of the widget to which [context] belongs. If you want to affect the style
      of all widgets, use [Gtk.StyleContext.add_provider_for_display].

      Note: If both priorities are the same, a [GtkStyleProvider] added through
      this function takes precedence over another added through
      [Gtk.StyleContext.add_provider_for_display]. *)

  method get_display : unit -> Ocgdk.Display.display_t
  (** Returns the [GdkDisplay] to which [context] is attached. *)

  method get_scale : unit -> int
  (** Returns the scale used for assets. *)

  method get_state : unit -> Enums.stateflags
  (** Returns the state used for style matching.

      This method should only be used to retrieve the [GtkStateFlags] to pass to
      [GtkStyleContext] methods, like [Gtk.StyleContext.get_padding]. If you
      need to retrieve the current state of a [GtkWidget], use
      [Gtk.Widget.get_state_flags]. *)

  method has_class : string -> bool
  (** Returns [TRUE] if [context] currently has defined the given class name. *)

  method remove_class : string -> unit
  (** Removes [class_name] from [context]. *)

  method remove_provider : Style_provider.style_provider_t -> unit
  (** Removes [provider] from the style providers list in [context]. *)

  method restore : unit -> unit
  (** Restores [context] state to a previous stage.

      See [Gtk.StyleContext.save]. *)

  method save : unit -> unit
  (** Saves the [context] state.

      This allows temporary modifications done through
      [Gtk.StyleContext.add_class], [Gtk.StyleContext.remove_class],
      [Gtk.StyleContext.set_state] to be quickly reverted in one go through
      [Gtk.StyleContext.restore].

      The matching call to [Gtk.StyleContext.restore] must be done before GTK
      returns to the main loop. *)

  method set_display : Ocgdk.Display.display_t -> unit
  (** Attaches [context] to the given display.

      The display is used to add style information from “global” style
      providers, such as the display's [GtkSettings] instance.

      If you are using a [GtkStyleContext] returned from
      [Gtk.Widget.get_style_context], you do not need to call this yourself. *)

  method set_scale : int -> unit
  (** Sets the scale to use when getting image assets for the style. *)

  method set_state : Enums.stateflags -> unit
  (** Sets the state to be used for style matching. *)

  method to_string : Enums.stylecontextprintflags -> string
  (** Converts the style context into a string representation.

      The string representation always includes information about the name,
      state, id, visibility and style classes of the CSS node that is backing
      [context]. Depending on the flags, more information may be included.

      This function is intended for testing and debugging of the CSS
      implementation in GTK. There are no guarantees about the format of the
      returned string, it may change. *)

  (** {2:conversions Conversions} *)

  method as_style_context : Raw.Style_context.t
end

class style_context : Raw.Style_context.t -> style_context_t
(** Wraps a raw handle of {!Ocgtk.Raw.Style_context.t}. *)

(** {1:description Description}

    [GtkStyleContext] stores styling information affecting a widget.

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
