class type style_context_t = object
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

  method as_style_context : Raw.Style_context.t
end

(* High-level class for StyleContext *)
class style_context (obj : Raw.Style_context.t) : style_context_t =
  object (self)
    method add_class : string -> unit =
      fun class_name -> Raw.Style_context.add_class obj class_name

    method add_provider : Style_provider.style_provider_t -> int -> unit =
      fun provider priority ->
        let provider = provider#as_style_provider in
        Raw.Style_context.add_provider obj provider priority

    method get_display : unit -> Ocgdk.Display.display_t =
      fun () -> new Ocgdk.Display.display (Raw.Style_context.get_display obj)

    method get_scale : unit -> int = fun () -> Raw.Style_context.get_scale obj

    method get_state : unit -> Enums.stateflags =
      fun () -> Raw.Style_context.get_state obj

    method has_class : string -> bool =
      fun class_name -> Raw.Style_context.has_class obj class_name

    method remove_class : string -> unit =
      fun class_name -> Raw.Style_context.remove_class obj class_name

    method remove_provider : Style_provider.style_provider_t -> unit =
      fun provider ->
        let provider = provider#as_style_provider in
        Raw.Style_context.remove_provider obj provider

    method restore : unit -> unit = fun () -> Raw.Style_context.restore obj
    method save : unit -> unit = fun () -> Raw.Style_context.save obj

    method set_display : Ocgdk.Display.display_t -> unit =
      fun display ->
        let display = display#as_display in
        Raw.Style_context.set_display obj display

    method set_scale : int -> unit =
      fun scale -> Raw.Style_context.set_scale obj scale

    method set_state : Enums.stateflags -> unit =
      fun flags -> Raw.Style_context.set_state obj flags

    method to_string : Enums.stylecontextprintflags -> string =
      fun flags -> Raw.Style_context.to_string obj flags

    method as_style_context = obj
  end
