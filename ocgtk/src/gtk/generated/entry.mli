(* GENERATED CODE - DO NOT EDIT *)
(* Entry: Entry *)

type t = [ `entry | `widget | `initially_unowned | `object_ ] Gobject.obj
(** A single-line text entry widget.

    An example GtkEntry

    A fairly large set of key bindings are supported by default. If the entered
    text is longer than the allocation of the widget, the widget will scroll so
    that the cursor position is visible.

    When using an entry for passwords and other sensitive information, it can be
    put into “password mode” using [Gtk.Entry.set_visibility]. In this mode,
    entered text is displayed using a “invisible” character. By default, GTK
    picks the best invisible character that is available in the current font,
    but it can be changed with [Gtk.Entry.set_invisible_char].

    [GtkEntry] has the ability to display progress or activity information
    behind the text. To make an entry display such information, use
    [Gtk.Entry.set_progress_fraction] or [Gtk.Entry.set_progress_pulse_step].

    Additionally, [GtkEntry] can show icons at either side of the entry. These
    icons can be activatable by clicking, can be set up as drag source and can
    have tooltips. To add an icon, use [Gtk.Entry.set_icon_from_gicon] or one of
    the various other functions that set an icon from an icon name or a
    paintable. To trigger an action when the user clicks an icon, connect to the
    [Gtk.Entry::icon-press] signal. To allow DND operations from an icon, use
    [Gtk.Entry.set_icon_drag_source]. To set a tooltip on an icon, use
    [Gtk.Entry.set_icon_tooltip_text] or the corresponding function for markup.

    Note that functionality or information that is only available by clicking on
    an icon in an entry may not be accessible at all to users which are not able
    to use a mouse or other pointing device. It is therefore recommended that
    any such functionality should also be available by other means, e.g. via the
    context menu of the entry.

    {b CSS nodes}

    {[
    entry[.flat][.warning][.error]
    ├── text[.readonly]
    ├── image.left
    ├── image.right
    ╰── [progress[.pulse]]
    ]}

    [GtkEntry] has a main node with the name entry. Depending on the properties
    of the entry, the style classes .read-only and .flat may appear. The style
    classes .warning and .error may also be used with entries.

    When the entry shows icons, it adds subnodes with the name image and the
    style class .left or .right, depending on where the icon appears.

    When the entry shows progress, it adds a subnode with the name progress. The
    node has the style class .pulse when the shown progress is pulsing.

    For all the subnodes added to the text node in various situations, see
    [Gtk.Text].

    {b GtkEntry as GtkBuildable}

    The [GtkEntry] implementation of the [GtkBuildable] interface supports a
    custom [<attributes>] element, which supports any number of [<attribute>]
    elements. The [<attribute>] element has attributes named “name“, “value“,
    “start“ and “end“ and allows you to specify [PangoAttribute] values for this
    label.

    An example of a UI definition fragment specifying Pango attributes:

    {[
    <object class=”GtkEntry”>
      <attributes>
        <attribute name=”weight” value=”PANGO_WEIGHT_BOLD”/>
        <attribute name=”background” value=”red” start=”5” end=”10”/>
      </attributes>
    </object>
    ]}

    The start and end attributes specify the range of characters to which the
    Pango attribute applies. If start and end are not specified, the attribute
    is applied to the whole text. Note that specifying ranges does not make much
    sense with translatable attributes. Use markup embedded in the translatable
    content instead.

    {b Accessibility}

    [GtkEntry] uses the [Gtk.AccessibleRole.text_box] role. *)

external new_ : unit -> t = "ml_gtk_entry_new"
(** Create a new Entry *)

external new_with_buffer : Entry_buffer.t -> t = "ml_gtk_entry_new_with_buffer"
(** Create a new Entry *)

(* Methods *)

external unset_invisible_char : t -> unit = "ml_gtk_entry_unset_invisible_char"
(** Unsets the invisible char, so that the default invisible char is used again.
    See [Gtk.Entry.set_invisible_char]. *)

external set_visibility : t -> bool -> unit = "ml_gtk_entry_set_visibility"
(** Sets whether the contents of the entry are visible or not.

    When visibility is set to [FALSE], characters are displayed as the invisible
    char, and will also appear that way when the text in the entry widget is
    copied elsewhere.

    By default, GTK picks the best invisible character available in the current
    font, but it can be changed with [Gtk.Entry.set_invisible_char].

    Note that you probably want to set [Gtk.Entry:input-purpose] to
    [GTK_INPUT_PURPOSE_PASSWORD] or [GTK_INPUT_PURPOSE_PIN] to inform input
    methods about the purpose of this entry, in addition to setting visibility
    to [FALSE]. *)

external set_tabs : t -> Ocgtk_pango.Pango.Wrappers.Tab_array.t option -> unit
  = "ml_gtk_entry_set_tabs"
(** Sets a [PangoTabArray].

    The tabstops in the array are applied to the entry text. *)

external set_progress_pulse_step : t -> float -> unit
  = "ml_gtk_entry_set_progress_pulse_step"
(** Sets the fraction of total entry width to move the progress bouncing block
    for each pulse.

    Use [Gtk.Entry.progress_pulse] to pulse the progress. *)

external set_progress_fraction : t -> float -> unit
  = "ml_gtk_entry_set_progress_fraction"
(** Causes the entry’s progress indicator to “fill in” the given fraction of the
    bar.

    The fraction should be between 0.0 and 1.0, inclusive. *)

external set_placeholder_text : t -> string option -> unit
  = "ml_gtk_entry_set_placeholder_text"
(** Sets text to be displayed in [entry] when it is empty.

    This can be used to give a visual hint of the expected contents of the
    [GtkEntry]. *)

external set_overwrite_mode : t -> bool -> unit
  = "ml_gtk_entry_set_overwrite_mode"
(** Sets whether the text is overwritten when typing in the [GtkEntry]. *)

external set_menu_entry_icon_text :
  t -> Gtk_enums.entryiconposition -> string -> unit
  = "ml_gtk_entry_set_menu_entry_icon_text"
(** Sets the text that will be used in the context menu of the [GtkEntry] when
    the specified icon is activatable. Selecting this item in the menu results,
    from all aspects, the same than clicking on the specified icon. This greatly
    simplifies making accessible applications, because the icons aren't
    focusable when using keyboard navigation. This is why Gtk recommends to add
    the same action to the context menu. *)

external set_max_length : t -> int -> unit = "ml_gtk_entry_set_max_length"
(** Sets the maximum allowed length of the contents of the widget.

    If the current contents are longer than the given length, then they will be
    truncated to fit. The length is in characters.

    This is equivalent to getting [entry]'s [GtkEntryBuffer] and calling
    [Gtk.EntryBuffer.set_max_length] on it. *)

external set_invisible_char : t -> int -> unit
  = "ml_gtk_entry_set_invisible_char"
(** Sets the character to use in place of the actual text in “password mode”.

    See [Gtk.Entry.set_visibility] for how to enable “password mode”.

    By default, GTK picks the best invisible char available in the current font.
    If you set the invisible char to 0, then the user will get no feedback at
    all; there will be no text on the screen as they type. *)

external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit
  = "ml_gtk_entry_set_input_purpose"
(** Sets the input purpose which can be used by input methods to adjust their
    behavior. *)

external set_input_hints : t -> Gtk_enums.inputhints -> unit
  = "ml_gtk_entry_set_input_hints"
(** Set additional hints which allow input methods to fine-tune their behavior.
*)

external set_icon_tooltip_text :
  t -> Gtk_enums.entryiconposition -> string option -> unit
  = "ml_gtk_entry_set_icon_tooltip_text"
(** Sets [tooltip] as the contents of the tooltip for the icon at the specified
    position.

    Use [NULL] for [tooltip] to remove an existing tooltip.

    See also [Gtk.Widget.set_tooltip_text] and
    [Gtk.Entry.set_icon_tooltip_markup].

    If you unset the widget tooltip via [Gtk.Widget.set_tooltip_text] or
    [Gtk.Widget.set_tooltip_markup], this sets [Gtk.Widget:has-tooltip] to
    [FALSE], which suppresses icon tooltips too. You can resolve this by then
    calling [Gtk.Widget.set_has_tooltip] to set [Gtk.Widget:has-tooltip] back to
    [TRUE], or setting at least one non-empty tooltip on any icon achieves the
    same result. *)

external set_icon_tooltip_markup :
  t -> Gtk_enums.entryiconposition -> string option -> unit
  = "ml_gtk_entry_set_icon_tooltip_markup"
(** Sets [tooltip] as the contents of the tooltip for the icon at the specified
    position.

    [tooltip] is assumed to be marked up with Pango Markup.

    Use [NULL] for [tooltip] to remove an existing tooltip.

    See also [Gtk.Widget.set_tooltip_markup] and
    [Gtk.Entry.set_icon_tooltip_text]. *)

external set_icon_sensitive : t -> Gtk_enums.entryiconposition -> bool -> unit
  = "ml_gtk_entry_set_icon_sensitive"
(** Sets the sensitivity for the specified icon. *)

external set_icon_from_paintable :
  t ->
  Gtk_enums.entryiconposition ->
  Ocgtk_gdk.Gdk.Wrappers.Paintable.t option ->
  unit = "ml_gtk_entry_set_icon_from_paintable"
(** Sets the icon shown in the specified position using a [GdkPaintable].

    If [paintable] is [NULL], no icon will be shown in the specified position.
*)

external set_icon_from_icon_name :
  t -> Gtk_enums.entryiconposition -> string option -> unit
  = "ml_gtk_entry_set_icon_from_icon_name"
(** Sets the icon shown in the entry at the specified position from the current
    icon theme.

    If the icon name isn’t known, a “broken image” icon will be displayed
    instead.

    If [icon_name] is [NULL], no icon will be shown in the specified position.
*)

external set_icon_from_gicon :
  t ->
  Gtk_enums.entryiconposition ->
  Ocgtk_gio.Gio.Wrappers.Icon.t option ->
  unit = "ml_gtk_entry_set_icon_from_gicon"
(** Sets the icon shown in the entry at the specified position from the current
    icon theme.

    If the icon isn’t known, a “broken image” icon will be displayed instead.

    If [icon] is [NULL], no icon will be shown in the specified position. *)

external set_icon_drag_source :
  t ->
  Gtk_enums.entryiconposition ->
  Ocgtk_gdk.Gdk.Wrappers.Content_provider.t ->
  Ocgtk_gdk.Gdk.dragaction ->
  unit = "ml_gtk_entry_set_icon_drag_source"
(** Sets up the icon at the given position as drag source.

    This makes it so that GTK will start a drag operation when the user clicks
    and drags the icon. *)

external set_icon_activatable : t -> Gtk_enums.entryiconposition -> bool -> unit
  = "ml_gtk_entry_set_icon_activatable"
(** Sets whether the icon is activatable. *)

external set_has_frame : t -> bool -> unit = "ml_gtk_entry_set_has_frame"
(** Sets whether the entry has a beveled frame around it. *)

external set_extra_menu :
  t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option -> unit
  = "ml_gtk_entry_set_extra_menu"
(** Sets a menu model to add when constructing the context menu for [entry]. *)

external set_completion : t -> Entry_completion.t option -> unit
  = "ml_gtk_entry_set_completion"
(** Sets [completion] to be the auxiliary completion object to use with [entry].

    All further configuration of the completion mechanism is done on
    [completion] using the [GtkEntryCompletion] API. Completion is disabled if
    [completion] is set to [NULL]. *)

external set_buffer : t -> Entry_buffer.t -> unit = "ml_gtk_entry_set_buffer"
(** Set the [GtkEntryBuffer] object which holds the text for this widget. *)

external set_attributes : t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t -> unit
  = "ml_gtk_entry_set_attributes"
(** Sets a [PangoAttrList].

    The attributes in the list are applied to the entry text.

    Since the attributes will be applied to text that changes as the user types,
    it makes most sense to use attributes with unlimited extent. *)

external set_alignment : t -> float -> unit = "ml_gtk_entry_set_alignment"
(** Sets the alignment for the contents of the entry.

    This controls the horizontal positioning of the contents when the displayed
    text is shorter than the width of the entry.

    See also: [Gtk.Editable:xalign] *)

external set_activates_default : t -> bool -> unit
  = "ml_gtk_entry_set_activates_default"
(** Sets whether pressing Enter in the [entry] will activate the default widget
    for the window containing the entry.

    This usually means that the dialog containing the entry will be closed,
    since the default widget is usually one of the dialog buttons. *)

external reset_im_context : t -> unit = "ml_gtk_entry_reset_im_context"
(** Reset the input method context of the entry if needed.

    This can be necessary in the case where modifying the buffer would confuse
    on-going input method behavior. *)

external progress_pulse : t -> unit = "ml_gtk_entry_progress_pulse"
(** Indicates that some progress is made, but you don’t know how much.

    Causes the entry’s progress indicator to enter “activity mode”, where a
    block bounces back and forth. Each call to gtk_entry_progress_pulse() causes
    the block to move by a little bit (the amount of movement per pulse is
    determined by [Gtk.Entry.set_progress_pulse_step]). *)

external grab_focus_without_selecting : t -> bool
  = "ml_gtk_entry_grab_focus_without_selecting"
(** Causes [entry] to have keyboard focus.

    It behaves like [Gtk.Widget.grab_focus], except that it doesn't select the
    contents of the entry. You only want to call this on some special entries
    which the user usually doesn't want to replace all text in, such as
    search-as-you-type entries. *)

external get_visibility : t -> bool = "ml_gtk_entry_get_visibility"
(** Retrieves whether the text in [entry] is visible.

    See [Gtk.Entry.set_visibility]. *)

external get_text_length : t -> UInt16.t = "ml_gtk_entry_get_text_length"
(** Retrieves the current length of the text in [entry].

    This is equivalent to getting [entry]'s [GtkEntryBuffer] and calling
    [Gtk.EntryBuffer.get_length] on it. *)

external get_tabs : t -> Ocgtk_pango.Pango.Wrappers.Tab_array.t option
  = "ml_gtk_entry_get_tabs"
(** Gets the tabstops of the [GtkEntry].

    See [Gtk.Entry.set_tabs]. *)

external get_progress_pulse_step : t -> float
  = "ml_gtk_entry_get_progress_pulse_step"
(** Retrieves the pulse step set with gtk_entry_set_progress_pulse_step(). *)

external get_progress_fraction : t -> float
  = "ml_gtk_entry_get_progress_fraction"
(** Returns the current fraction of the task that’s been completed.

    See [Gtk.Entry.set_progress_fraction]. *)

external get_placeholder_text : t -> string option
  = "ml_gtk_entry_get_placeholder_text"
(** Retrieves the text that will be displayed when [entry] is empty and
    unfocused *)

external get_overwrite_mode : t -> bool = "ml_gtk_entry_get_overwrite_mode"
(** Gets whether the [GtkEntry] is in overwrite mode. *)

external get_menu_entry_icon_text :
  t -> Gtk_enums.entryiconposition -> string option
  = "ml_gtk_entry_get_menu_entry_icon_text"
(** Gets the text that will be used in the context menu of the [GtkEntry] when
    the specified icon is activatable. Selecting this item in the menu results,
    from all aspects, the same than clicking on the specified icon. This greatly
    simplifies making accessible applications, because the icons aren't
    focusable when using keyboard navigation. This is why Gtk recommends to add
    the same action to the context menu. *)

external get_max_length : t -> int = "ml_gtk_entry_get_max_length"
(** Retrieves the maximum allowed length of the text in [entry].

    See [Gtk.Entry.set_max_length]. *)

external get_invisible_char : t -> int = "ml_gtk_entry_get_invisible_char"
(** Retrieves the character displayed in place of the actual text in “password
    mode”. *)

external get_input_purpose : t -> Gtk_enums.inputpurpose
  = "ml_gtk_entry_get_input_purpose"
(** Gets the input purpose of the [GtkEntry]. *)

external get_input_hints : t -> Gtk_enums.inputhints
  = "ml_gtk_entry_get_input_hints"
(** Gets the input hints of this [GtkEntry]. *)

external get_icon_tooltip_text :
  t -> Gtk_enums.entryiconposition -> string option
  = "ml_gtk_entry_get_icon_tooltip_text"
(** Gets the contents of the tooltip on the icon at the specified position in
    [entry]. *)

external get_icon_tooltip_markup :
  t -> Gtk_enums.entryiconposition -> string option
  = "ml_gtk_entry_get_icon_tooltip_markup"
(** Gets the contents of the tooltip on the icon at the specified position in
    [entry]. *)

external get_icon_storage_type :
  t -> Gtk_enums.entryiconposition -> Gtk_enums.imagetype
  = "ml_gtk_entry_get_icon_storage_type"
(** Gets the type of representation being used by the icon to store image data.

    If the icon has no image data, the return value will be [GTK_IMAGE_EMPTY].
*)

external get_icon_sensitive : t -> Gtk_enums.entryiconposition -> bool
  = "ml_gtk_entry_get_icon_sensitive"
(** Returns whether the icon appears sensitive or insensitive. *)

external get_icon_paintable :
  t -> Gtk_enums.entryiconposition -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t option
  = "ml_gtk_entry_get_icon_paintable"
(** Retrieves the [GdkPaintable] used for the icon.

    If no [GdkPaintable] was used for the icon, [NULL] is returned. *)

external get_icon_name : t -> Gtk_enums.entryiconposition -> string option
  = "ml_gtk_entry_get_icon_name"
(** Retrieves the icon name used for the icon.

    [NULL] is returned if there is no icon or if the icon was set by some other
    method (e.g., by [GdkPaintable] or gicon). *)

external get_icon_gicon :
  t -> Gtk_enums.entryiconposition -> Ocgtk_gio.Gio.Wrappers.Icon.t option
  = "ml_gtk_entry_get_icon_gicon"
(** Retrieves the [GIcon] used for the icon.

    [NULL] will be returned if there is no icon or if the icon was set by some
    other method (e.g., by [GdkPaintable] or icon name). *)

external get_icon_at_pos : t -> int -> int -> int
  = "ml_gtk_entry_get_icon_at_pos"
(** Finds the icon at the given position and return its index.

    The position’s coordinates are relative to the [entry]’s top left corner. If
    [x], [y] doesn’t lie inside an icon, -1 is returned. This function is
    intended for use in a [Gtk.Widget::query-tooltip] signal handler. *)

external get_icon_area :
  t -> Gtk_enums.entryiconposition -> Ocgtk_gdk.Gdk.Wrappers.Rectangle.t
  = "ml_gtk_entry_get_icon_area"
(** Gets the area where entry’s icon at [icon_pos] is drawn.

    This function is useful when drawing something to the entry in a draw
    callback.

    If the entry is not realized or has no icon at the given position,
    [icon_area] is filled with zeros. Otherwise, [icon_area] will be filled with
    the icon's allocation, relative to [entry]'s allocation. *)

external get_icon_activatable : t -> Gtk_enums.entryiconposition -> bool
  = "ml_gtk_entry_get_icon_activatable"
(** Returns whether the icon is activatable. *)

external get_has_frame : t -> bool = "ml_gtk_entry_get_has_frame"
(** Gets the value set by gtk_entry_set_has_frame(). *)

external get_extra_menu : t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option
  = "ml_gtk_entry_get_extra_menu"
(** Gets the menu model set with gtk_entry_set_extra_menu(). *)

external get_current_icon_drag_source : t -> int
  = "ml_gtk_entry_get_current_icon_drag_source"
(** Returns the index of the icon which is the source of the current DND
    operation, or -1. *)

external get_completion : t -> Entry_completion.t option
  = "ml_gtk_entry_get_completion"
(** Returns the auxiliary completion object currently in use by [entry]. *)

external get_buffer : t -> Entry_buffer.t = "ml_gtk_entry_get_buffer"
(** Get the [GtkEntryBuffer] object which holds the text for this widget. *)

external get_attributes : t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t option
  = "ml_gtk_entry_get_attributes"
(** Gets the attribute list of the [GtkEntry].

    See [Gtk.Entry.set_attributes]. *)

external get_alignment : t -> float = "ml_gtk_entry_get_alignment"
(** Gets the value set by gtk_entry_set_alignment().

    See also: [Gtk.Editable:xalign] *)

external get_activates_default : t -> bool
  = "ml_gtk_entry_get_activates_default"
(** Retrieves the value set by gtk_entry_set_activates_default(). *)

(* Properties *)

external get_enable_emoji_completion : t -> bool
  = "ml_gtk_entry_get_enable_emoji_completion"
(** Get property: enable-emoji-completion *)

external set_enable_emoji_completion : t -> bool -> unit
  = "ml_gtk_entry_set_enable_emoji_completion"
(** Set property: enable-emoji-completion *)

external get_im_module : t -> string = "ml_gtk_entry_get_im_module"
(** Get property: im-module *)

external set_im_module : t -> string -> unit = "ml_gtk_entry_set_im_module"
(** Set property: im-module *)

external get_invisible_char_set : t -> bool
  = "ml_gtk_entry_get_invisible_char_set"
(** Get property: invisible-char-set *)

external set_invisible_char_set : t -> bool -> unit
  = "ml_gtk_entry_set_invisible_char_set"
(** Set property: invisible-char-set *)

external get_menu_entry_icon_primary_text : t -> string
  = "ml_gtk_entry_get_menu_entry_icon_primary_text"
(** Get property: menu-entry-icon-primary-text *)

external set_menu_entry_icon_primary_text : t -> string -> unit
  = "ml_gtk_entry_set_menu_entry_icon_primary_text"
(** Set property: menu-entry-icon-primary-text *)

external get_menu_entry_icon_secondary_text : t -> string
  = "ml_gtk_entry_get_menu_entry_icon_secondary_text"
(** Get property: menu-entry-icon-secondary-text *)

external set_menu_entry_icon_secondary_text : t -> string -> unit
  = "ml_gtk_entry_set_menu_entry_icon_secondary_text"
(** Set property: menu-entry-icon-secondary-text *)

external get_primary_icon_activatable : t -> bool
  = "ml_gtk_entry_get_primary_icon_activatable"
(** Get property: primary-icon-activatable *)

external set_primary_icon_activatable : t -> bool -> unit
  = "ml_gtk_entry_set_primary_icon_activatable"
(** Set property: primary-icon-activatable *)

external get_primary_icon_gicon : t -> Ocgtk_gio.Gio.Wrappers.Icon.t
  = "ml_gtk_entry_get_primary_icon_gicon"
(** Get property: primary-icon-gicon *)

external set_primary_icon_gicon : t -> Ocgtk_gio.Gio.Wrappers.Icon.t -> unit
  = "ml_gtk_entry_set_primary_icon_gicon"
(** Set property: primary-icon-gicon *)

external get_primary_icon_name : t -> string
  = "ml_gtk_entry_get_primary_icon_name"
(** Get property: primary-icon-name *)

external set_primary_icon_name : t -> string -> unit
  = "ml_gtk_entry_set_primary_icon_name"
(** Set property: primary-icon-name *)

external get_primary_icon_paintable : t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t
  = "ml_gtk_entry_get_primary_icon_paintable"
(** Get property: primary-icon-paintable *)

external set_primary_icon_paintable :
  t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t -> unit
  = "ml_gtk_entry_set_primary_icon_paintable"
(** Set property: primary-icon-paintable *)

external get_primary_icon_sensitive : t -> bool
  = "ml_gtk_entry_get_primary_icon_sensitive"
(** Get property: primary-icon-sensitive *)

external set_primary_icon_sensitive : t -> bool -> unit
  = "ml_gtk_entry_set_primary_icon_sensitive"
(** Set property: primary-icon-sensitive *)

external get_primary_icon_storage_type : t -> Gtk_enums.imagetype
  = "ml_gtk_entry_get_primary_icon_storage_type"
(** Get property: primary-icon-storage-type *)

external get_primary_icon_tooltip_markup : t -> string
  = "ml_gtk_entry_get_primary_icon_tooltip_markup"
(** Get property: primary-icon-tooltip-markup *)

external set_primary_icon_tooltip_markup : t -> string -> unit
  = "ml_gtk_entry_set_primary_icon_tooltip_markup"
(** Set property: primary-icon-tooltip-markup *)

external get_primary_icon_tooltip_text : t -> string
  = "ml_gtk_entry_get_primary_icon_tooltip_text"
(** Get property: primary-icon-tooltip-text *)

external set_primary_icon_tooltip_text : t -> string -> unit
  = "ml_gtk_entry_set_primary_icon_tooltip_text"
(** Set property: primary-icon-tooltip-text *)

external get_scroll_offset : t -> int = "ml_gtk_entry_get_scroll_offset"
(** Get property: scroll-offset *)

external get_secondary_icon_activatable : t -> bool
  = "ml_gtk_entry_get_secondary_icon_activatable"
(** Get property: secondary-icon-activatable *)

external set_secondary_icon_activatable : t -> bool -> unit
  = "ml_gtk_entry_set_secondary_icon_activatable"
(** Set property: secondary-icon-activatable *)

external get_secondary_icon_gicon : t -> Ocgtk_gio.Gio.Wrappers.Icon.t
  = "ml_gtk_entry_get_secondary_icon_gicon"
(** Get property: secondary-icon-gicon *)

external set_secondary_icon_gicon : t -> Ocgtk_gio.Gio.Wrappers.Icon.t -> unit
  = "ml_gtk_entry_set_secondary_icon_gicon"
(** Set property: secondary-icon-gicon *)

external get_secondary_icon_name : t -> string
  = "ml_gtk_entry_get_secondary_icon_name"
(** Get property: secondary-icon-name *)

external set_secondary_icon_name : t -> string -> unit
  = "ml_gtk_entry_set_secondary_icon_name"
(** Set property: secondary-icon-name *)

external get_secondary_icon_paintable : t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t
  = "ml_gtk_entry_get_secondary_icon_paintable"
(** Get property: secondary-icon-paintable *)

external set_secondary_icon_paintable :
  t -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t -> unit
  = "ml_gtk_entry_set_secondary_icon_paintable"
(** Set property: secondary-icon-paintable *)

external get_secondary_icon_sensitive : t -> bool
  = "ml_gtk_entry_get_secondary_icon_sensitive"
(** Get property: secondary-icon-sensitive *)

external set_secondary_icon_sensitive : t -> bool -> unit
  = "ml_gtk_entry_set_secondary_icon_sensitive"
(** Set property: secondary-icon-sensitive *)

external get_secondary_icon_storage_type : t -> Gtk_enums.imagetype
  = "ml_gtk_entry_get_secondary_icon_storage_type"
(** Get property: secondary-icon-storage-type *)

external get_secondary_icon_tooltip_markup : t -> string
  = "ml_gtk_entry_get_secondary_icon_tooltip_markup"
(** Get property: secondary-icon-tooltip-markup *)

external set_secondary_icon_tooltip_markup : t -> string -> unit
  = "ml_gtk_entry_set_secondary_icon_tooltip_markup"
(** Set property: secondary-icon-tooltip-markup *)

external get_secondary_icon_tooltip_text : t -> string
  = "ml_gtk_entry_get_secondary_icon_tooltip_text"
(** Get property: secondary-icon-tooltip-text *)

external set_secondary_icon_tooltip_text : t -> string -> unit
  = "ml_gtk_entry_set_secondary_icon_tooltip_text"
(** Set property: secondary-icon-tooltip-text *)

external get_show_emoji_icon : t -> bool = "ml_gtk_entry_get_show_emoji_icon"
(** Get property: show-emoji-icon *)

external set_show_emoji_icon : t -> bool -> unit
  = "ml_gtk_entry_set_show_emoji_icon"
(** Set property: show-emoji-icon *)

external get_truncate_multiline : t -> bool
  = "ml_gtk_entry_get_truncate_multiline"
(** Get property: truncate-multiline *)

external set_truncate_multiline : t -> bool -> unit
  = "ml_gtk_entry_set_truncate_multiline"
(** Set property: truncate-multiline *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_icon_press :
  ?after:bool ->
  t ->
  callback:(icon_pos:Gtk_enums.entryiconposition -> unit) ->
  Gobject.Signal.handler_id

val on_icon_release :
  ?after:bool ->
  t ->
  callback:(icon_pos:Gtk_enums.entryiconposition -> unit) ->
  Gobject.Signal.handler_id
