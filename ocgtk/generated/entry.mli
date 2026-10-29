(** A single-line text entry widget.

    Its methods, signals and properties are on {!class-type-entry_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Entry}. *)

(** {1:class Class} *)

class type entry_t = object
  inherit Widget.widget_t
  inherit Cell_editable.cell_editable_t
  inherit Editable.editable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the entry is activated.

      The keybindings for this signal are all forms of the Enter key. *)

  method on_icon_press :
    ?after:bool ->
    callback:(icon_pos:Enums.entryiconposition -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when an activatable icon is clicked. *)

  method on_icon_release :
    ?after:bool ->
    callback:(icon_pos:Enums.entryiconposition -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the button release from a mouse click over an activatable icon.
  *)

  (** {2:methods Methods} *)

  method get_activates_default : unit -> bool
  (** Retrieves the value set by gtk_entry_set_activates_default(). *)

  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  (** Gets the attribute list of the [GtkEntry].

      See [Gtk.Entry.set_attributes]. *)

  method get_buffer : unit -> Entry_buffer.entry_buffer_t
  (** Get the [GtkEntryBuffer] object which holds the text for this widget. *)

  method get_completion : unit -> Entry_completion.entry_completion_t option
  (** Returns the auxiliary completion object currently in use by [entry]. *)

  method get_current_icon_drag_source : unit -> int
  (** Returns the index of the icon which is the source of the current DND
      operation, or -1. *)

  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  (** Gets the menu model set with gtk_entry_set_extra_menu(). *)

  method get_has_frame : unit -> bool
  (** Gets the value set by gtk_entry_set_has_frame(). *)

  method get_icon_activatable : Enums.entryiconposition -> bool
  (** Returns whether the icon is activatable. *)

  method get_icon_at_pos : int -> int -> int
  (** Finds the icon at the given position and return its index.

      The position’s coordinates are relative to the [entry]’s top left corner.
      If [x], [y] doesn’t lie inside an icon, -1 is returned. This function is
      intended for use in a [Gtk.Widget::query-tooltip] signal handler. *)

  method get_icon_gicon : Enums.entryiconposition -> Ocgio.Icon.icon_t option
  (** Retrieves the [GIcon] used for the icon.

      [None] will be returned if there is no icon or if the icon was set by some
      other method (e.g., by [GdkPaintable] or icon name). *)

  method get_icon_name : Enums.entryiconposition -> string option
  (** Retrieves the icon name used for the icon.

      [None] is returned if there is no icon or if the icon was set by some
      other method (e.g., by [GdkPaintable] or gicon). *)

  method get_icon_paintable :
    Enums.entryiconposition -> Ocgdk.Paintable.paintable_t option
  (** Retrieves the [GdkPaintable] used for the icon.

      If no [GdkPaintable] was used for the icon, [None] is returned. *)

  method get_icon_sensitive : Enums.entryiconposition -> bool
  (** Returns whether the icon appears sensitive or insensitive. *)

  method get_icon_storage_type : Enums.entryiconposition -> Enums.imagetype
  (** Gets the type of representation being used by the icon to store image
      data.

      If the icon has no image data, the return value will be [GTK_IMAGE_EMPTY].
  *)

  method get_icon_tooltip_markup : Enums.entryiconposition -> string option
  (** Gets the contents of the tooltip on the icon at the specified position in
      [entry]. *)

  method get_icon_tooltip_text : Enums.entryiconposition -> string option
  (** Gets the contents of the tooltip on the icon at the specified position in
      [entry]. *)

  method get_input_hints : unit -> Enums.inputhints
  (** Gets the input hints of this [GtkEntry]. *)

  method get_input_purpose : unit -> Enums.inputpurpose
  (** Gets the input purpose of the [GtkEntry]. *)

  method get_invisible_char : unit -> int
  (** Retrieves the character displayed in place of the actual text in “password
      mode”. *)

  method get_max_length : unit -> int
  (** Retrieves the maximum allowed length of the text in [entry].

      See [Gtk.Entry.set_max_length]. *)

  method get_menu_entry_icon_text : Enums.entryiconposition -> string option
  (** Gets the text that will be used in the context menu of the [GtkEntry] when
      the specified icon is activatable. Selecting this item in the menu
      results, from all aspects, the same than clicking on the specified icon.
      This greatly simplifies making accessible applications, because the icons
      aren't focusable when using keyboard navigation. This is why Gtk
      recommends to add the same action to the context menu. *)

  method get_overwrite_mode : unit -> bool
  (** Gets whether the [GtkEntry] is in overwrite mode. *)

  method get_placeholder_text : unit -> string option
  (** Retrieves the text that will be displayed when [entry] is empty and
      unfocused *)

  method get_progress_fraction : unit -> float
  (** Returns the current fraction of the task that’s been completed.

      See [Gtk.Entry.set_progress_fraction]. *)

  method get_progress_pulse_step : unit -> float
  (** Retrieves the pulse step set with gtk_entry_set_progress_pulse_step(). *)

  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  (** Gets the tabstops of the [GtkEntry].

      See [Gtk.Entry.set_tabs]. *)

  method get_text_length : unit -> UInt16.t
  (** Retrieves the current length of the text in [entry].

      This is equivalent to getting [entry]'s [GtkEntryBuffer] and calling
      [Gtk.EntryBuffer.get_length] on it. *)

  method get_visibility : unit -> bool
  (** Retrieves whether the text in [entry] is visible.

      See [Gtk.Entry.set_visibility]. *)

  method grab_focus_without_selecting : unit -> bool
  (** Causes [entry] to have keyboard focus.

      It behaves like [Gtk.Widget.grab_focus], except that it doesn't select the
      contents of the entry. You only want to call this on some special entries
      which the user usually doesn't want to replace all text in, such as
      search-as-you-type entries. *)

  method progress_pulse : unit -> unit
  (** Indicates that some progress is made, but you don’t know how much.

      Causes the entry’s progress indicator to enter “activity mode”, where a
      block bounces back and forth. Each call to gtk_entry_progress_pulse()
      causes the block to move by a little bit (the amount of movement per pulse
      is determined by [Gtk.Entry.set_progress_pulse_step]). *)

  method reset_im_context : unit -> unit
  (** Reset the input method context of the entry if needed.

      This can be necessary in the case where modifying the buffer would confuse
      on-going input method behavior. *)

  method set_activates_default : bool -> unit
  (** Sets whether pressing Enter in the [entry] will activate the default
      widget for the window containing the entry.

      This usually means that the dialog containing the entry will be closed,
      since the default widget is usually one of the dialog buttons. *)

  method set_attributes : Ocpango.Attr_list.attr_list_t -> unit
  (** Sets a [PangoAttrList].

      The attributes in the list are applied to the entry text.

      Since the attributes will be applied to text that changes as the user
      types, it makes most sense to use attributes with unlimited extent. *)

  method set_buffer : Entry_buffer.entry_buffer_t -> unit
  (** Set the [GtkEntryBuffer] object which holds the text for this widget. *)

  method set_completion : Entry_completion.entry_completion_t option -> unit
  (** Sets [completion] to be the auxiliary completion object to use with
      [entry].

      All further configuration of the completion mechanism is done on
      [completion] using the [GtkEntryCompletion] API. Completion is disabled if
      [completion] is set to [None]. *)

  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets a menu model to add when constructing the context menu for [entry].
  *)

  method set_has_frame : bool -> unit
  (** Sets whether the entry has a beveled frame around it. *)

  method set_icon_activatable : Enums.entryiconposition -> bool -> unit
  (** Sets whether the icon is activatable. *)

  method set_icon_drag_source :
    Enums.entryiconposition ->
    Ocgdk.Content_provider.content_provider_t ->
    Ocgdk.Enums.dragaction ->
    unit
  (** Sets up the icon at the given position as drag source.

      This makes it so that GTK will start a drag operation when the user clicks
      and drags the icon. *)

  method set_icon_from_gicon :
    Enums.entryiconposition -> Ocgio.Icon.icon_t option -> unit
  (** Sets the icon shown in the entry at the specified position from the
      current icon theme.

      If the icon isn’t known, a “broken image” icon will be displayed instead.

      If [icon] is [None], no icon will be shown in the specified position. *)

  method set_icon_from_icon_name :
    Enums.entryiconposition -> string option -> unit
  (** Sets the icon shown in the entry at the specified position from the
      current icon theme.

      If the icon name isn’t known, a “broken image” icon will be displayed
      instead.

      If [icon_name] is [None], no icon will be shown in the specified position.
  *)

  method set_icon_from_paintable :
    Enums.entryiconposition -> Ocgdk.Paintable.paintable_t option -> unit
  (** Sets the icon shown in the specified position using a [GdkPaintable].

      If [paintable] is [None], no icon will be shown in the specified position.
  *)

  method set_icon_sensitive : Enums.entryiconposition -> bool -> unit
  (** Sets the sensitivity for the specified icon. *)

  method set_icon_tooltip_markup :
    Enums.entryiconposition -> string option -> unit
  (** Sets [tooltip] as the contents of the tooltip for the icon at the
      specified position.

      [tooltip] is assumed to be marked up with Pango Markup.

      Use [None] for [tooltip] to remove an existing tooltip.

      See also [Gtk.Widget.set_tooltip_markup] and
      [Gtk.Entry.set_icon_tooltip_text]. *)

  method set_icon_tooltip_text :
    Enums.entryiconposition -> string option -> unit
  (** Sets [tooltip] as the contents of the tooltip for the icon at the
      specified position.

      Use [None] for [tooltip] to remove an existing tooltip.

      See also [Gtk.Widget.set_tooltip_text] and
      [Gtk.Entry.set_icon_tooltip_markup].

      If you unset the widget tooltip via [Gtk.Widget.set_tooltip_text] or
      [Gtk.Widget.set_tooltip_markup], this sets [Gtk.Widget:has-tooltip] to
      [false], which suppresses icon tooltips too. You can resolve this by then
      calling [Gtk.Widget.set_has_tooltip] to set [Gtk.Widget:has-tooltip] back
      to [true], or setting at least one non-empty tooltip on any icon achieves
      the same result. *)

  method set_input_hints : Enums.inputhints -> unit
  (** Set additional hints which allow input methods to fine-tune their
      behavior. *)

  method set_input_purpose : Enums.inputpurpose -> unit
  (** Sets the input purpose which can be used by input methods to adjust their
      behavior. *)

  method set_invisible_char : int -> unit
  (** Sets the character to use in place of the actual text in “password mode”.

      See [Gtk.Entry.set_visibility] for how to enable “password mode”.

      By default, GTK picks the best invisible char available in the current
      font. If you set the invisible char to 0, then the user will get no
      feedback at all; there will be no text on the screen as they type. *)

  method set_max_length : int -> unit
  (** Sets the maximum allowed length of the contents of the widget.

      If the current contents are longer than the given length, then they will
      be truncated to fit. The length is in characters.

      This is equivalent to getting [entry]'s [GtkEntryBuffer] and calling
      [Gtk.EntryBuffer.set_max_length] on it. *)

  method set_menu_entry_icon_text : Enums.entryiconposition -> string -> unit
  (** Sets the text that will be used in the context menu of the [GtkEntry] when
      the specified icon is activatable. Selecting this item in the menu
      results, from all aspects, the same than clicking on the specified icon.
      This greatly simplifies making accessible applications, because the icons
      aren't focusable when using keyboard navigation. This is why Gtk
      recommends to add the same action to the context menu. *)

  method set_overwrite_mode : bool -> unit
  (** Sets whether the text is overwritten when typing in the [GtkEntry]. *)

  method set_placeholder_text : string option -> unit
  (** Sets text to be displayed in [entry] when it is empty.

      This can be used to give a visual hint of the expected contents of the
      [GtkEntry]. *)

  method set_progress_fraction : float -> unit
  (** Causes the entry’s progress indicator to “fill in” the given fraction of
      the bar.

      The fraction should be between 0.0 and 1.0, inclusive. *)

  method set_progress_pulse_step : float -> unit
  (** Sets the fraction of total entry width to move the progress bouncing block
      for each pulse.

      Use [Gtk.Entry.progress_pulse] to pulse the progress. *)

  method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit
  (** Sets a [PangoTabArray].

      The tabstops in the array are applied to the entry text. *)

  method set_visibility : bool -> unit
  (** Sets whether the contents of the entry are visible or not.

      When visibility is set to [false], characters are displayed as the
      invisible char, and will also appear that way when the text in the entry
      widget is copied elsewhere.

      By default, GTK picks the best invisible character available in the
      current font, but it can be changed with [Gtk.Entry.set_invisible_char].

      Note that you probably want to set [Gtk.Entry:input-purpose] to
      [GTK_INPUT_PURPOSE_PASSWORD] or [GTK_INPUT_PURPOSE_PIN] to inform input
      methods about the purpose of this entry, in addition to setting visibility
      to [false]. *)

  method unset_invisible_char : unit -> unit
  (** Unsets the invisible char, so that the default invisible char is used
      again. See [Gtk.Entry.set_invisible_char]. *)

  (** {2:properties Properties} *)

  method enable_emoji_completion : bool
  (** Whether to suggest Emoji replacements for :-delimited names like
      [:heart:]. *)

  method set_enable_emoji_completion : bool -> unit
  (** Whether to suggest Emoji replacements for :-delimited names like
      [:heart:]. *)

  method im_module : string
  (** Which IM (input method) module should be used for this entry.

      See [Gtk.IMContext].

      Setting this to a non-[None] value overrides the system-wide IM module
      setting. See the GtkSettings [Gtk.Settings:gtk-im-module] property. *)

  method set_im_module : string -> unit
  (** Which IM (input method) module should be used for this entry.

      See [Gtk.IMContext].

      Setting this to a non-[None] value overrides the system-wide IM module
      setting. See the GtkSettings [Gtk.Settings:gtk-im-module] property. *)

  method invisible_char_set : bool
  (** Whether the invisible char has been set for the [GtkEntry]. *)

  method set_invisible_char_set : bool -> unit
  (** Whether the invisible char has been set for the [GtkEntry]. *)

  method menu_entry_icon_primary_text : string
  (** Text for an item in the context menu to activate the primary icon action.

      When the primary icon is activatable and this property has been set, a new
      entry in the context menu of this GtkEntry will appear with this text.
      Selecting that menu entry will result in the primary icon being activated,
      exactly in the same way as it would be activated from a mouse click.

      This simplifies adding accessibility support to applications using
      activatable icons. The activatable icons aren't focusable when navigating
      the interface with the keyboard This is why Gtk recommends to also add
      those actions in the context menu. This set of methods greatly simplifies
      this, by adding a menu item that, when enabled, calls the same callback
      than clicking on the icon. *)

  method set_menu_entry_icon_primary_text : string -> unit
  (** Text for an item in the context menu to activate the primary icon action.

      When the primary icon is activatable and this property has been set, a new
      entry in the context menu of this GtkEntry will appear with this text.
      Selecting that menu entry will result in the primary icon being activated,
      exactly in the same way as it would be activated from a mouse click.

      This simplifies adding accessibility support to applications using
      activatable icons. The activatable icons aren't focusable when navigating
      the interface with the keyboard This is why Gtk recommends to also add
      those actions in the context menu. This set of methods greatly simplifies
      this, by adding a menu item that, when enabled, calls the same callback
      than clicking on the icon. *)

  method menu_entry_icon_secondary_text : string
  (** Text for an item in the context menu to activate the secondary icon
      action.

      When the primary icon is activatable and this property has been set, a new
      entry in the context menu of this GtkEntry will appear with this text.
      Selecting that menu entry will result in the primary icon being activated,
      exactly in the same way as it would be activated from a mouse click.

      This simplifies adding accessibility support to applications using
      activatable icons. The activatable icons aren't focusable when navigating
      the interface with the keyboard This is why Gtk recommends to also add
      those actions in the context menu. This set of methods greatly simplifies
      this, by adding a menu item that, when enabled, calls the same callback
      than clicking on the icon. *)

  method set_menu_entry_icon_secondary_text : string -> unit
  (** Text for an item in the context menu to activate the secondary icon
      action.

      When the primary icon is activatable and this property has been set, a new
      entry in the context menu of this GtkEntry will appear with this text.
      Selecting that menu entry will result in the primary icon being activated,
      exactly in the same way as it would be activated from a mouse click.

      This simplifies adding accessibility support to applications using
      activatable icons. The activatable icons aren't focusable when navigating
      the interface with the keyboard This is why Gtk recommends to also add
      those actions in the context menu. This set of methods greatly simplifies
      this, by adding a menu item that, when enabled, calls the same callback
      than clicking on the icon. *)

  method primary_icon_activatable : bool
  (** Whether the primary icon is activatable.

      GTK emits the [Gtk.Entry::icon-press] and [Gtk.Entry::icon-release]
      signals only on sensitive, activatable icons.

      Sensitive, but non-activatable icons can be used for purely informational
      purposes. *)

  method set_primary_icon_activatable : bool -> unit
  (** Whether the primary icon is activatable.

      GTK emits the [Gtk.Entry::icon-press] and [Gtk.Entry::icon-release]
      signals only on sensitive, activatable icons.

      Sensitive, but non-activatable icons can be used for purely informational
      purposes. *)

  method primary_icon_gicon : Ocgio.Icon.icon_t
  (** The [GIcon] to use for the primary icon for the entry. *)

  method set_primary_icon_gicon : Ocgio.Icon.icon_t -> unit
  (** The [GIcon] to use for the primary icon for the entry. *)

  method primary_icon_name : string
  (** The icon name to use for the primary icon for the entry. *)

  method set_primary_icon_name : string -> unit
  (** The icon name to use for the primary icon for the entry. *)

  method primary_icon_paintable : Ocgdk.Paintable.paintable_t
  (** A [GdkPaintable] to use as the primary icon for the entry. *)

  method set_primary_icon_paintable : Ocgdk.Paintable.paintable_t -> unit
  (** A [GdkPaintable] to use as the primary icon for the entry. *)

  method primary_icon_sensitive : bool
  (** Whether the primary icon is sensitive.

      An insensitive icon appears grayed out. GTK does not emit the
      [Gtk.Entry::icon-press] and [Gtk.Entry::icon-release] signals and does not
      allow DND from insensitive icons.

      An icon should be set insensitive if the action that would trigger when
      clicked is currently not available. *)

  method set_primary_icon_sensitive : bool -> unit
  (** Whether the primary icon is sensitive.

      An insensitive icon appears grayed out. GTK does not emit the
      [Gtk.Entry::icon-press] and [Gtk.Entry::icon-release] signals and does not
      allow DND from insensitive icons.

      An icon should be set insensitive if the action that would trigger when
      clicked is currently not available. *)

  method primary_icon_storage_type : Enums.imagetype
  (** The representation which is used for the primary icon of the entry. *)

  method primary_icon_tooltip_markup : string
  (** The contents of the tooltip on the primary icon, with markup.

      Also see [Gtk.Entry.set_icon_tooltip_markup]. *)

  method set_primary_icon_tooltip_markup : string -> unit
  (** The contents of the tooltip on the primary icon, with markup.

      Also see [Gtk.Entry.set_icon_tooltip_markup]. *)

  method primary_icon_tooltip_text : string
  (** The contents of the tooltip on the primary icon.

      Also see [Gtk.Entry.set_icon_tooltip_text]. *)

  method set_primary_icon_tooltip_text : string -> unit
  (** The contents of the tooltip on the primary icon.

      Also see [Gtk.Entry.set_icon_tooltip_text]. *)

  method scroll_offset : int
  (** Number of pixels of the entry scrolled off the screen to the left. *)

  method secondary_icon_activatable : bool
  (** Whether the secondary icon is activatable.

      GTK emits the [Gtk.Entry::icon-press] and [Gtk.Entry::icon-release]
      signals only on sensitive, activatable icons.

      Sensitive, but non-activatable icons can be used for purely informational
      purposes. *)

  method set_secondary_icon_activatable : bool -> unit
  (** Whether the secondary icon is activatable.

      GTK emits the [Gtk.Entry::icon-press] and [Gtk.Entry::icon-release]
      signals only on sensitive, activatable icons.

      Sensitive, but non-activatable icons can be used for purely informational
      purposes. *)

  method secondary_icon_gicon : Ocgio.Icon.icon_t
  (** The [GIcon] to use for the secondary icon for the entry. *)

  method set_secondary_icon_gicon : Ocgio.Icon.icon_t -> unit
  (** The [GIcon] to use for the secondary icon for the entry. *)

  method secondary_icon_name : string
  (** The icon name to use for the secondary icon for the entry. *)

  method set_secondary_icon_name : string -> unit
  (** The icon name to use for the secondary icon for the entry. *)

  method secondary_icon_paintable : Ocgdk.Paintable.paintable_t
  (** A [GdkPaintable] to use as the secondary icon for the entry. *)

  method set_secondary_icon_paintable : Ocgdk.Paintable.paintable_t -> unit
  (** A [GdkPaintable] to use as the secondary icon for the entry. *)

  method secondary_icon_sensitive : bool
  (** Whether the secondary icon is sensitive.

      An insensitive icon appears grayed out. GTK does not emit the
      \[signal@Gtk.Entry::icon-press\[ and [Gtk.Entry::icon-release] signals and
      does not allow DND from insensitive icons.

      An icon should be set insensitive if the action that would trigger when
      clicked is currently not available. *)

  method set_secondary_icon_sensitive : bool -> unit
  (** Whether the secondary icon is sensitive.

      An insensitive icon appears grayed out. GTK does not emit the
      \[signal@Gtk.Entry::icon-press\[ and [Gtk.Entry::icon-release] signals and
      does not allow DND from insensitive icons.

      An icon should be set insensitive if the action that would trigger when
      clicked is currently not available. *)

  method secondary_icon_storage_type : Enums.imagetype
  (** The representation which is used for the secondary icon of the entry. *)

  method secondary_icon_tooltip_markup : string
  (** The contents of the tooltip on the secondary icon, with markup.

      Also see [Gtk.Entry.set_icon_tooltip_markup]. *)

  method set_secondary_icon_tooltip_markup : string -> unit
  (** The contents of the tooltip on the secondary icon, with markup.

      Also see [Gtk.Entry.set_icon_tooltip_markup]. *)

  method secondary_icon_tooltip_text : string
  (** The contents of the tooltip on the secondary icon.

      Also see [Gtk.Entry.set_icon_tooltip_text]. *)

  method set_secondary_icon_tooltip_text : string -> unit
  (** The contents of the tooltip on the secondary icon.

      Also see [Gtk.Entry.set_icon_tooltip_text]. *)

  method show_emoji_icon : bool
  (** Whether the entry will show an Emoji icon in the secondary icon position
      to open the Emoji chooser. *)

  method set_show_emoji_icon : bool -> unit
  (** Whether the entry will show an Emoji icon in the secondary icon position
      to open the Emoji chooser. *)

  method truncate_multiline : bool
  (** When [true], pasted multi-line text is truncated to the first line. *)

  method set_truncate_multiline : bool -> unit
  (** When [true], pasted multi-line text is truncated to the first line. *)

  (** {2:conversions Conversions} *)

  method as_entry : Raw.Entry.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Entry].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - {{!Ocgtk.Cell_editable.class-type-cell_editable_t}Ocgtk.Cell_editable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\
     - {{!Ocgtk.Editable.class-type-editable_t}Ocgtk.Editable}\n\n\
     A single-line text entry widget.\n\n\
     An example GtkEntry\n\n\
     A fairly large set of key bindings are supported by default. If the\n\
     entered text is longer than the allocation of the widget, the widget\n\
     will scroll so that the cursor position is visible.\n\n\
     When using an entry for passwords and other sensitive information, it\n\
     can be put into “password mode” using \
     {{!Ocgtk.Entry.class-type-entry_t.method-set_visibility}[Gtk.Entry.set_visibility]}.\n\
     In this mode, entered text is displayed using a “invisible” character.\n\
     By default, GTK picks the best invisible character that is available\n\
     in the current font, but it can be changed with\n\
     {{!Ocgtk.Entry.class-type-entry_t.method-set_invisible_char}[Gtk.Entry.set_invisible_char]}.\n\n\
     [GtkEntry] has the ability to display progress or activity\n\
     information behind the text. To make an entry display such information,\n\
     use \
     {{!Ocgtk.Entry.class-type-entry_t.method-set_progress_fraction}[Gtk.Entry.set_progress_fraction]} \
     or\n\
     {{!Ocgtk.Entry.class-type-entry_t.method-set_progress_pulse_step}[Gtk.Entry.set_progress_pulse_step]}.\n\n\
     Additionally, [GtkEntry] can show icons at either side of the entry.\n\
     These icons can be activatable by clicking, can be set up as drag source\n\
     and can have tooltips. To add an icon, use\n\
     {{!Ocgtk.Entry.class-type-entry_t.method-set_icon_from_gicon}[Gtk.Entry.set_icon_from_gicon]} \
     or one of the various other functions\n\
     that set an icon from an icon name or a paintable. To trigger an action \
     when\n\
     the user clicks an icon, connect to the \
     {{!Ocgtk.Entry.class-type-entry_t.method-on_icon_press}[Gtk.Entry::icon-press]} \
     signal.\n\
     To allow DND operations from an icon, use\n\
     {{!Ocgtk.Entry.class-type-entry_t.method-set_icon_drag_source}[Gtk.Entry.set_icon_drag_source]}. \
     To set a tooltip on an icon, use\n\
     {{!Ocgtk.Entry.class-type-entry_t.method-set_icon_tooltip_text}[Gtk.Entry.set_icon_tooltip_text]} \
     or the corresponding function\n\
     for markup.\n\n\
     Note that functionality or information that is only available by clicking\n\
     on an icon in an entry may not be accessible at all to users which are not\n\
     able to use a mouse or other pointing device. It is therefore recommended\n\
     that any such functionality should also be available by other means, e.g.\n\
     via the context menu of the entry.\n\n\
     {b CSS nodes}\n\n\
     {[\n\
     entry[.flat][.warning][.error]\n\
     ├── text[.readonly]\n\
     ├── image.left\n\
     ├── image.right\n\
     ╰── [progress[.pulse]]\n\
     ]}\n\n\
     [GtkEntry] has a main node with the name entry. Depending on the properties\n\
     of the entry, the style classes .read-only and .flat may appear. The style\n\
     classes .warning and .error may also be used with entries.\n\n\
     When the entry shows icons, it adds subnodes with the name image and the\n\
     style class .left or .right, depending on where the icon appears.\n\n\
     When the entry shows progress, it adds a subnode with the name progress.\n\
     The node has the style class .pulse when the shown progress is pulsing.\n\n\
     For all the subnodes added to the text node in various situations,\n\
     see {{!Ocgtk.Text.class-type-text_t}[Gtk.Text]}.\n\n\
     {b GtkEntry as GtkBuildable}\n\n\
     The [GtkEntry] implementation of the [GtkBuildable] interface supports a\n\
     custom [<attributes>] element, which supports any number of [<attribute>]\n\
     elements. The [<attribute>] element has attributes named “name“, “value“,\n\
     “start“ and “end“ and allows you to specify [PangoAttribute] values for\n\
     this label.\n\n\
     An example of a UI definition fragment specifying Pango attributes:\n\n\
     {[\n\
     <object class=\"GtkEntry\">\n\
    \  <attributes>\n\
    \    <attribute name=\"weight\" value=\"PANGO_WEIGHT_BOLD\"/>\n\
    \    <attribute name=\"background\" value=\"red\" start=\"5\" end=\"10\"/>\n\
    \  </attributes>\n\
     </object>\n\
     ]}\n\n\
     The start and end attributes specify the range of characters to which the\n\
     Pango attribute applies. If start and end are not specified, the attribute\n\
     is applied to the whole text. Note that specifying ranges does not make \
     much\n\
     sense with translatable attributes. Use markup embedded in the translatable\n\
     content instead.\n\n\
     {b Accessibility}\n\n\
     [GtkEntry] uses the \
     {{!Ocgtk.Enums.type-accessiblerole.constructor-TEXT_BOX}[Gtk.AccessibleRole.text_box]} \
     role."]

class entry : Raw.Entry.t -> entry_t
(** Wraps a raw handle of {!Ocgtk.Raw.Entry.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 A single-line text entry widget.\n\n\
 An example GtkEntry\n\n\
 A fairly large set of key bindings are supported by default. If the\n\
 entered text is longer than the allocation of the widget, the widget\n\
 will scroll so that the cursor position is visible.\n\n\
 When using an entry for passwords and other sensitive information, it\n\
 can be put into “password mode” using \
 {{!Ocgtk.Entry.class-type-entry_t.method-set_visibility}[Gtk.Entry.set_visibility]}.\n\
 In this mode, entered text is displayed using a “invisible” character.\n\
 By default, GTK picks the best invisible character that is available\n\
 in the current font, but it can be changed with\n\
 {{!Ocgtk.Entry.class-type-entry_t.method-set_invisible_char}[Gtk.Entry.set_invisible_char]}.\n\n\
 [GtkEntry] has the ability to display progress or activity\n\
 information behind the text. To make an entry display such information,\n\
 use \
 {{!Ocgtk.Entry.class-type-entry_t.method-set_progress_fraction}[Gtk.Entry.set_progress_fraction]} \
 or\n\
 {{!Ocgtk.Entry.class-type-entry_t.method-set_progress_pulse_step}[Gtk.Entry.set_progress_pulse_step]}.\n\n\
 Additionally, [GtkEntry] can show icons at either side of the entry.\n\
 These icons can be activatable by clicking, can be set up as drag source\n\
 and can have tooltips. To add an icon, use\n\
 {{!Ocgtk.Entry.class-type-entry_t.method-set_icon_from_gicon}[Gtk.Entry.set_icon_from_gicon]} \
 or one of the various other functions\n\
 that set an icon from an icon name or a paintable. To trigger an action when\n\
 the user clicks an icon, connect to the \
 {{!Ocgtk.Entry.class-type-entry_t.method-on_icon_press}[Gtk.Entry::icon-press]} \
 signal.\n\
 To allow DND operations from an icon, use\n\
 {{!Ocgtk.Entry.class-type-entry_t.method-set_icon_drag_source}[Gtk.Entry.set_icon_drag_source]}. \
 To set a tooltip on an icon, use\n\
 {{!Ocgtk.Entry.class-type-entry_t.method-set_icon_tooltip_text}[Gtk.Entry.set_icon_tooltip_text]} \
 or the corresponding function\n\
 for markup.\n\n\
 Note that functionality or information that is only available by clicking\n\
 on an icon in an entry may not be accessible at all to users which are not\n\
 able to use a mouse or other pointing device. It is therefore recommended\n\
 that any such functionality should also be available by other means, e.g.\n\
 via the context menu of the entry.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 entry[.flat][.warning][.error]\n\
 ├── text[.readonly]\n\
 ├── image.left\n\
 ├── image.right\n\
 ╰── [progress[.pulse]]\n\
 ]}\n\n\
 [GtkEntry] has a main node with the name entry. Depending on the properties\n\
 of the entry, the style classes .read-only and .flat may appear. The style\n\
 classes .warning and .error may also be used with entries.\n\n\
 When the entry shows icons, it adds subnodes with the name image and the\n\
 style class .left or .right, depending on where the icon appears.\n\n\
 When the entry shows progress, it adds a subnode with the name progress.\n\
 The node has the style class .pulse when the shown progress is pulsing.\n\n\
 For all the subnodes added to the text node in various situations,\n\
 see {{!Ocgtk.Text.class-type-text_t}[Gtk.Text]}.\n\n\
 {b GtkEntry as GtkBuildable}\n\n\
 The [GtkEntry] implementation of the [GtkBuildable] interface supports a\n\
 custom [<attributes>] element, which supports any number of [<attribute>]\n\
 elements. The [<attribute>] element has attributes named “name“, “value“,\n\
 “start“ and “end“ and allows you to specify [PangoAttribute] values for\n\
 this label.\n\n\
 An example of a UI definition fragment specifying Pango attributes:\n\n\
 {[\n\
 <object class=\"GtkEntry\">\n\
\  <attributes>\n\
\    <attribute name=\"weight\" value=\"PANGO_WEIGHT_BOLD\"/>\n\
\    <attribute name=\"background\" value=\"red\" start=\"5\" end=\"10\"/>\n\
\  </attributes>\n\
 </object>\n\
 ]}\n\n\
 The start and end attributes specify the range of characters to which the\n\
 Pango attribute applies. If start and end are not specified, the attribute\n\
 is applied to the whole text. Note that specifying ranges does not make much\n\
 sense with translatable attributes. Use markup embedded in the translatable\n\
 content instead.\n\n\
 {b Accessibility}\n\n\
 [GtkEntry] uses the \
 {{!Ocgtk.Enums.type-accessiblerole.constructor-TEXT_BOX}[Gtk.AccessibleRole.text_box]} \
 role."]

(** {1:constructors Constructors} *)

val new_ : unit -> entry_t
(** Creates a new entry. *)

val new_with_buffer : Entry_buffer.entry_buffer_t -> entry_t
(** Creates a new entry with the specified text buffer. *)
