(* GENERATED CODE - DO NOT EDIT *)
(* Entry: Entry *)

[@@@ocaml.text
"A single-line text entry widget.\n\n\
 An example GtkEntry\n\n\
 A fairly large set of key bindings are supported by default. If the\n\
 entered text is longer than the allocation of the widget, the widget\n\
 will scroll so that the cursor position is visible.\n\n\
 When using an entry for passwords and other sensitive information, it\n\
 can be put into “password mode” using \
 {{!Ocgtk.Raw.Entry.val-set_visibility}[Gtk.Entry.set_visibility]}.\n\
 In this mode, entered text is displayed using a “invisible” character.\n\
 By default, GTK picks the best invisible character that is available\n\
 in the current font, but it can be changed with\n\
 {{!Ocgtk.Raw.Entry.val-set_invisible_char}[Gtk.Entry.set_invisible_char]}.\n\n\
 [GtkEntry] has the ability to display progress or activity\n\
 information behind the text. To make an entry display such information,\n\
 use \
 {{!Ocgtk.Raw.Entry.val-set_progress_fraction}[Gtk.Entry.set_progress_fraction]} \
 or\n\
 {{!Ocgtk.Raw.Entry.val-set_progress_pulse_step}[Gtk.Entry.set_progress_pulse_step]}.\n\n\
 Additionally, [GtkEntry] can show icons at either side of the entry.\n\
 These icons can be activatable by clicking, can be set up as drag source\n\
 and can have tooltips. To add an icon, use\n\
 {{!Ocgtk.Raw.Entry.val-set_icon_from_gicon}[Gtk.Entry.set_icon_from_gicon]} \
 or one of the various other functions\n\
 that set an icon from an icon name or a paintable. To trigger an action when\n\
 the user clicks an icon, connect to the \
 {{!Ocgtk.Raw.Entry.val-on_icon_press}[Gtk.Entry::icon-press]} signal.\n\
 To allow DND operations from an icon, use\n\
 {{!Ocgtk.Raw.Entry.val-set_icon_drag_source}[Gtk.Entry.set_icon_drag_source]}. \
 To set a tooltip on an icon, use\n\
 {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_text}[Gtk.Entry.set_icon_tooltip_text]} \
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
 see {{!Ocgtk.Raw.Text}[Gtk.Text]}.\n\n\
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
 role.\n\n\
 The class built on this module is in {!Ocgtk.Entry}."]

type t = [ `entry | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_entry_get_type"

external new_ : unit -> t = "ml_gtk_entry_new"
(** Creates a new entry. *)

external new_with_buffer : Entry_buffer.t -> t = "ml_gtk_entry_new_with_buffer"
(** Creates a new entry with the specified text buffer. *)

(* Methods *)

external unset_invisible_char : t -> unit = "ml_gtk_entry_unset_invisible_char"
(** Unsets the invisible char, so that the default invisible char is used again.
    See
    {{!Ocgtk.Raw.Entry.val-set_invisible_char}[Gtk.Entry.set_invisible_char]}.
*)

external set_visibility : t -> bool -> unit = "ml_gtk_entry_set_visibility"
(** Sets whether the contents of the entry are visible or not.

    When visibility is set to [false], characters are displayed as the invisible
    char, and will also appear that way when the text in the entry widget is
    copied elsewhere.

    By default, GTK picks the best invisible character available in the current
    font, but it can be changed with
    {{!Ocgtk.Raw.Entry.val-set_invisible_char}[Gtk.Entry.set_invisible_char]}.

    Note that you probably want to set
    {{!Ocgtk.Raw.Entry.val-get_input_purpose}[Gtk.Entry:input-purpose]} to
    {{!Ocgtk.Enums.type-inputpurpose.constructor-PASSWORD}[GTK_INPUT_PURPOSE_PASSWORD]}
    or {{!Ocgtk.Enums.type-inputpurpose.constructor-PIN}[GTK_INPUT_PURPOSE_PIN]}
    to inform input methods about the purpose of this entry, in addition to
    setting visibility to [false]. *)

external set_tabs : t -> Ocpango_raw.Tab_array.t option -> unit
  = "ml_gtk_entry_set_tabs"
(** Sets a [PangoTabArray].

    The tabstops in the array are applied to the entry text. *)

external set_progress_pulse_step : t -> float -> unit
  = "ml_gtk_entry_set_progress_pulse_step"
(** Sets the fraction of total entry width to move the progress bouncing block
    for each pulse.

    Use {{!Ocgtk.Raw.Entry.val-progress_pulse}[Gtk.Entry.progress_pulse]} to
    pulse the progress. *)

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
  t -> Ocgtk_enums.entryiconposition -> string -> unit
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
    {{!Ocgtk.Raw.Entry_buffer.val-set_max_length}[Gtk.EntryBuffer.set_max_length]}
    on it. *)

external set_invisible_char : t -> int -> unit
  = "ml_gtk_entry_set_invisible_char"
(** Sets the character to use in place of the actual text in “password mode”.

    See {{!Ocgtk.Raw.Entry.val-set_visibility}[Gtk.Entry.set_visibility]} for
    how to enable “password mode”.

    By default, GTK picks the best invisible char available in the current font.
    If you set the invisible char to 0, then the user will get no feedback at
    all; there will be no text on the screen as they type. *)

external set_input_purpose : t -> Ocgtk_enums.inputpurpose -> unit
  = "ml_gtk_entry_set_input_purpose"
(** Sets the input purpose which can be used by input methods to adjust their
    behavior. *)

external set_input_hints : t -> Ocgtk_enums.inputhints -> unit
  = "ml_gtk_entry_set_input_hints"
(** Set additional hints which allow input methods to fine-tune their behavior.
*)

external set_icon_tooltip_text :
  t -> Ocgtk_enums.entryiconposition -> string option -> unit
  = "ml_gtk_entry_set_icon_tooltip_text"
(** Sets [tooltip] as the contents of the tooltip for the icon at the specified
    position.

    Use [None] for [tooltip] to remove an existing tooltip.

    See also
    {{!Ocgtk.Raw.Widget.val-set_tooltip_text}[Gtk.Widget.set_tooltip_text]} and
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_markup}[Gtk.Entry.set_icon_tooltip_markup]}.

    If you unset the widget tooltip via
    {{!Ocgtk.Raw.Widget.val-set_tooltip_text}[Gtk.Widget.set_tooltip_text]} or
    {{!Ocgtk.Raw.Widget.val-set_tooltip_markup}[Gtk.Widget.set_tooltip_markup]},
    this sets {{!Ocgtk.Raw.Widget.val-get_has_tooltip}[Gtk.Widget:has-tooltip]}
    to [false], which suppresses icon tooltips too. You can resolve this by then
    calling
    {{!Ocgtk.Raw.Widget.val-set_has_tooltip}[Gtk.Widget.set_has_tooltip]} to set
    {{!Ocgtk.Raw.Widget.val-get_has_tooltip}[Gtk.Widget:has-tooltip]} back to
    [true], or setting at least one non-empty tooltip on any icon achieves the
    same result. *)

external set_icon_tooltip_markup :
  t -> Ocgtk_enums.entryiconposition -> string option -> unit
  = "ml_gtk_entry_set_icon_tooltip_markup"
(** Sets [tooltip] as the contents of the tooltip for the icon at the specified
    position.

    [tooltip] is assumed to be marked up with Pango Markup.

    Use [None] for [tooltip] to remove an existing tooltip.

    See also
    {{!Ocgtk.Raw.Widget.val-set_tooltip_markup}[Gtk.Widget.set_tooltip_markup]}
    and
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_text}[Gtk.Entry.set_icon_tooltip_text]}.
*)

external set_icon_sensitive : t -> Ocgtk_enums.entryiconposition -> bool -> unit
  = "ml_gtk_entry_set_icon_sensitive"
(** Sets the sensitivity for the specified icon. *)

external set_icon_from_paintable :
  t -> Ocgtk_enums.entryiconposition -> Ocgdk_raw.Paintable.t option -> unit
  = "ml_gtk_entry_set_icon_from_paintable"
(** Sets the icon shown in the specified position using a [GdkPaintable].

    If [paintable] is [None], no icon will be shown in the specified position.
*)

external set_icon_from_icon_name :
  t -> Ocgtk_enums.entryiconposition -> string option -> unit
  = "ml_gtk_entry_set_icon_from_icon_name"
(** Sets the icon shown in the entry at the specified position from the current
    icon theme.

    If the icon name isn’t known, a “broken image” icon will be displayed
    instead.

    If [icon_name] is [None], no icon will be shown in the specified position.
*)

external set_icon_from_gicon :
  t -> Ocgtk_enums.entryiconposition -> Ocgio_raw.Icon.t option -> unit
  = "ml_gtk_entry_set_icon_from_gicon"
(** Sets the icon shown in the entry at the specified position from the current
    icon theme.

    If the icon isn’t known, a “broken image” icon will be displayed instead.

    If [icon] is [None], no icon will be shown in the specified position. *)

external set_icon_drag_source :
  t ->
  Ocgtk_enums.entryiconposition ->
  Ocgdk_raw.Content_provider.t ->
  Ocgdk_enums.dragaction ->
  unit = "ml_gtk_entry_set_icon_drag_source"
(** Sets up the icon at the given position as drag source.

    This makes it so that GTK will start a drag operation when the user clicks
    and drags the icon. *)

external set_icon_activatable :
  t -> Ocgtk_enums.entryiconposition -> bool -> unit
  = "ml_gtk_entry_set_icon_activatable"
(** Sets whether the icon is activatable. *)

external set_has_frame : t -> bool -> unit = "ml_gtk_entry_set_has_frame"
(** Sets whether the entry has a beveled frame around it. *)

external set_extra_menu : t -> Ocgio_raw.Menu_model.t option -> unit
  = "ml_gtk_entry_set_extra_menu"
(** Sets a menu model to add when constructing the context menu for [entry]. *)

external set_completion : t -> Entry_completion.t option -> unit
  = "ml_gtk_entry_set_completion"
(** Sets [completion] to be the auxiliary completion object to use with [entry].

    All further configuration of the completion mechanism is done on
    [completion] using the [GtkEntryCompletion] API. Completion is disabled if
    [completion] is set to [None]. *)

external set_buffer : t -> Entry_buffer.t -> unit = "ml_gtk_entry_set_buffer"
(** Set the [GtkEntryBuffer] object which holds the text for this widget. *)

external set_attributes : t -> Ocpango_raw.Attr_list.t -> unit
  = "ml_gtk_entry_set_attributes"
(** Sets a [PangoAttrList].

    The attributes in the list are applied to the entry text.

    Since the attributes will be applied to text that changes as the user types,
    it makes most sense to use attributes with unlimited extent. *)

external set_alignment : t -> float -> unit = "ml_gtk_entry_set_alignment"
(** Sets the alignment for the contents of the entry.

    This controls the horizontal positioning of the contents when the displayed
    text is shorter than the width of the entry.

    See also: {{!Ocgtk.Raw.Editable.val-get_alignment}[Gtk.Editable:xalign]} *)

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
    block bounces back and forth. Each call to
    {{!Ocgtk.Raw.Entry.val-progress_pulse}[gtk_entry_progress_pulse ()]} causes
    the block to move by a little bit (the amount of movement per pulse is
    determined by
    {{!Ocgtk.Raw.Entry.val-set_progress_pulse_step}[Gtk.Entry.set_progress_pulse_step]}).
*)

external grab_focus_without_selecting : t -> bool
  = "ml_gtk_entry_grab_focus_without_selecting"
(** Causes [entry] to have keyboard focus.

    It behaves like {{!Ocgtk.Raw.Widget.val-grab_focus}[Gtk.Widget.grab_focus]},
    except that it doesn't select the contents of the entry. You only want to
    call this on some special entries which the user usually doesn't want to
    replace all text in, such as search-as-you-type entries. *)

external get_visibility : t -> bool = "ml_gtk_entry_get_visibility"
(** Retrieves whether the text in [entry] is visible.

    See {{!Ocgtk.Raw.Entry.val-set_visibility}[Gtk.Entry.set_visibility]}. *)

external get_text_length : t -> UInt16.t = "ml_gtk_entry_get_text_length"
(** Retrieves the current length of the text in [entry].

    This is equivalent to getting [entry]'s [GtkEntryBuffer] and calling
    {{!Ocgtk.Raw.Entry_buffer.val-get_length}[Gtk.EntryBuffer.get_length]} on
    it. *)

external get_tabs : t -> Ocpango_raw.Tab_array.t option
  = "ml_gtk_entry_get_tabs"
(** Gets the tabstops of the [GtkEntry].

    See {{!Ocgtk.Raw.Entry.val-set_tabs}[Gtk.Entry.set_tabs]}. *)

external get_progress_pulse_step : t -> float
  = "ml_gtk_entry_get_progress_pulse_step"
(** Retrieves the pulse step set with
    {{!Ocgtk.Raw.Entry.val-set_progress_pulse_step}[gtk_entry_set_progress_pulse_step
                                                    ()]}. *)

external get_progress_fraction : t -> float
  = "ml_gtk_entry_get_progress_fraction"
(** Returns the current fraction of the task that’s been completed.

    See
    {{!Ocgtk.Raw.Entry.val-set_progress_fraction}[Gtk.Entry.set_progress_fraction]}.
*)

external get_placeholder_text : t -> string option
  = "ml_gtk_entry_get_placeholder_text"
(** Retrieves the text that will be displayed when [entry] is empty and
    unfocused *)

external get_overwrite_mode : t -> bool = "ml_gtk_entry_get_overwrite_mode"
(** Gets whether the [GtkEntry] is in overwrite mode. *)

external get_menu_entry_icon_text :
  t -> Ocgtk_enums.entryiconposition -> string option
  = "ml_gtk_entry_get_menu_entry_icon_text"
(** Gets the text that will be used in the context menu of the [GtkEntry] when
    the specified icon is activatable. Selecting this item in the menu results,
    from all aspects, the same than clicking on the specified icon. This greatly
    simplifies making accessible applications, because the icons aren't
    focusable when using keyboard navigation. This is why Gtk recommends to add
    the same action to the context menu. *)

external get_max_length : t -> int = "ml_gtk_entry_get_max_length"
(** Retrieves the maximum allowed length of the text in [entry].

    See {{!Ocgtk.Raw.Entry.val-set_max_length}[Gtk.Entry.set_max_length]}. *)

external get_invisible_char : t -> int = "ml_gtk_entry_get_invisible_char"
(** Retrieves the character displayed in place of the actual text in “password
    mode”. *)

external get_input_purpose : t -> Ocgtk_enums.inputpurpose
  = "ml_gtk_entry_get_input_purpose"
(** Gets the input purpose of the [GtkEntry]. *)

external get_input_hints : t -> Ocgtk_enums.inputhints
  = "ml_gtk_entry_get_input_hints"
(** Gets the input hints of this [GtkEntry]. *)

external get_icon_tooltip_text :
  t -> Ocgtk_enums.entryiconposition -> string option
  = "ml_gtk_entry_get_icon_tooltip_text"
(** Gets the contents of the tooltip on the icon at the specified position in
    [entry]. *)

external get_icon_tooltip_markup :
  t -> Ocgtk_enums.entryiconposition -> string option
  = "ml_gtk_entry_get_icon_tooltip_markup"
(** Gets the contents of the tooltip on the icon at the specified position in
    [entry]. *)

external get_icon_storage_type :
  t -> Ocgtk_enums.entryiconposition -> Ocgtk_enums.imagetype
  = "ml_gtk_entry_get_icon_storage_type"
(** Gets the type of representation being used by the icon to store image data.

    If the icon has no image data, the return value will be
    {{!Ocgtk.Enums.type-imagetype.constructor-EMPTY}[GTK_IMAGE_EMPTY]}. *)

external get_icon_sensitive : t -> Ocgtk_enums.entryiconposition -> bool
  = "ml_gtk_entry_get_icon_sensitive"
(** Returns whether the icon appears sensitive or insensitive. *)

external get_icon_paintable :
  t -> Ocgtk_enums.entryiconposition -> Ocgdk_raw.Paintable.t option
  = "ml_gtk_entry_get_icon_paintable"
(** Retrieves the [GdkPaintable] used for the icon.

    If no [GdkPaintable] was used for the icon, [None] is returned. *)

external get_icon_name : t -> Ocgtk_enums.entryiconposition -> string option
  = "ml_gtk_entry_get_icon_name"
(** Retrieves the icon name used for the icon.

    [None] is returned if there is no icon or if the icon was set by some other
    method (e.g., by [GdkPaintable] or gicon). *)

external get_icon_gicon :
  t -> Ocgtk_enums.entryiconposition -> Ocgio_raw.Icon.t option
  = "ml_gtk_entry_get_icon_gicon"
(** Retrieves the [GIcon] used for the icon.

    [None] will be returned if there is no icon or if the icon was set by some
    other method (e.g., by [GdkPaintable] or icon name). *)

external get_icon_at_pos : t -> int -> int -> int
  = "ml_gtk_entry_get_icon_at_pos"
(** Finds the icon at the given position and return its index.

    The position’s coordinates are relative to the [entry]’s top left corner. If
    [x], [y] doesn’t lie inside an icon, -1 is returned. This function is
    intended for use in a
    {{!Ocgtk.Raw.Widget.val-on_query_tooltip}[Gtk.Widget::query-tooltip]} signal
    handler. *)

external get_icon_area :
  t -> Ocgtk_enums.entryiconposition -> Ocgdk_raw.Rectangle.t
  = "ml_gtk_entry_get_icon_area"
(** Gets the area where entry’s icon at [icon_pos] is drawn.

    This function is useful when drawing something to the entry in a draw
    callback.

    If the entry is not realized or has no icon at the given position,
    [icon_area] is filled with zeros. Otherwise, [icon_area] will be filled with
    the icon's allocation, relative to [entry]'s allocation. *)

external get_icon_activatable : t -> Ocgtk_enums.entryiconposition -> bool
  = "ml_gtk_entry_get_icon_activatable"
(** Returns whether the icon is activatable. *)

external get_has_frame : t -> bool = "ml_gtk_entry_get_has_frame"
(** Gets the value set by
    {{!Ocgtk.Raw.Entry.val-set_has_frame}[gtk_entry_set_has_frame ()]}. *)

external get_extra_menu : t -> Ocgio_raw.Menu_model.t option
  = "ml_gtk_entry_get_extra_menu"
(** Gets the menu model set with
    {{!Ocgtk.Raw.Entry.val-set_extra_menu}[gtk_entry_set_extra_menu ()]}. *)

external get_current_icon_drag_source : t -> int
  = "ml_gtk_entry_get_current_icon_drag_source"
(** Returns the index of the icon which is the source of the current DND
    operation, or -1. *)

external get_completion : t -> Entry_completion.t option
  = "ml_gtk_entry_get_completion"
(** Returns the auxiliary completion object currently in use by [entry]. *)

external get_buffer : t -> Entry_buffer.t = "ml_gtk_entry_get_buffer"
(** Get the [GtkEntryBuffer] object which holds the text for this widget. *)

external get_attributes : t -> Ocpango_raw.Attr_list.t option
  = "ml_gtk_entry_get_attributes"
(** Gets the attribute list of the [GtkEntry].

    See {{!Ocgtk.Raw.Entry.val-set_attributes}[Gtk.Entry.set_attributes]}. *)

external get_alignment : t -> float = "ml_gtk_entry_get_alignment"
(** Gets the value set by
    {{!Ocgtk.Raw.Entry.val-set_alignment}[gtk_entry_set_alignment ()]}.

    See also: {{!Ocgtk.Raw.Editable.val-get_alignment}[Gtk.Editable:xalign]} *)

external get_activates_default : t -> bool
  = "ml_gtk_entry_get_activates_default"
(** Retrieves the value set by
    {{!Ocgtk.Raw.Entry.val-set_activates_default}[gtk_entry_set_activates_default
                                                  ()]}. *)

(* Properties *)

external get_enable_emoji_completion : t -> bool
  = "ml_gtk_entry_get_enable_emoji_completion"
(** Whether to suggest Emoji replacements for :-delimited names like [:heart:].
*)

external set_enable_emoji_completion : t -> bool -> unit
  = "ml_gtk_entry_set_enable_emoji_completion"
(** Whether to suggest Emoji replacements for :-delimited names like [:heart:].
*)

external get_im_module : t -> string = "ml_gtk_entry_get_im_module"
(** Which IM (input method) module should be used for this entry.

    See {{!Ocgtk.Raw.Im_context}[Gtk.IMContext]}.

    Setting this to a non-[None] value overrides the system-wide IM module
    setting. See the GtkSettings
    {{!Ocgtk.Raw.Settings.val-get_gtk_im_module}[Gtk.Settings:gtk-im-module]}
    property. *)

external set_im_module : t -> string -> unit = "ml_gtk_entry_set_im_module"
(** Which IM (input method) module should be used for this entry.

    See {{!Ocgtk.Raw.Im_context}[Gtk.IMContext]}.

    Setting this to a non-[None] value overrides the system-wide IM module
    setting. See the GtkSettings
    {{!Ocgtk.Raw.Settings.val-get_gtk_im_module}[Gtk.Settings:gtk-im-module]}
    property. *)

external get_invisible_char_set : t -> bool
  = "ml_gtk_entry_get_invisible_char_set"
(** Whether the invisible char has been set for the [GtkEntry]. *)

external set_invisible_char_set : t -> bool -> unit
  = "ml_gtk_entry_set_invisible_char_set"
(** Whether the invisible char has been set for the [GtkEntry]. *)

external get_menu_entry_icon_primary_text : t -> string
  = "ml_gtk_entry_get_menu_entry_icon_primary_text"
(** Text for an item in the context menu to activate the primary icon action.

    When the primary icon is activatable and this property has been set, a new
    entry in the context menu of this GtkEntry will appear with this text.
    Selecting that menu entry will result in the primary icon being activated,
    exactly in the same way as it would be activated from a mouse click.

    This simplifies adding accessibility support to applications using
    activatable icons. The activatable icons aren't focusable when navigating
    the interface with the keyboard This is why Gtk recommends to also add those
    actions in the context menu. This set of methods greatly simplifies this, by
    adding a menu item that, when enabled, calls the same callback than clicking
    on the icon. *)

external set_menu_entry_icon_primary_text : t -> string -> unit
  = "ml_gtk_entry_set_menu_entry_icon_primary_text"
(** Text for an item in the context menu to activate the primary icon action.

    When the primary icon is activatable and this property has been set, a new
    entry in the context menu of this GtkEntry will appear with this text.
    Selecting that menu entry will result in the primary icon being activated,
    exactly in the same way as it would be activated from a mouse click.

    This simplifies adding accessibility support to applications using
    activatable icons. The activatable icons aren't focusable when navigating
    the interface with the keyboard This is why Gtk recommends to also add those
    actions in the context menu. This set of methods greatly simplifies this, by
    adding a menu item that, when enabled, calls the same callback than clicking
    on the icon. *)

external get_menu_entry_icon_secondary_text : t -> string
  = "ml_gtk_entry_get_menu_entry_icon_secondary_text"
(** Text for an item in the context menu to activate the secondary icon action.

    When the primary icon is activatable and this property has been set, a new
    entry in the context menu of this GtkEntry will appear with this text.
    Selecting that menu entry will result in the primary icon being activated,
    exactly in the same way as it would be activated from a mouse click.

    This simplifies adding accessibility support to applications using
    activatable icons. The activatable icons aren't focusable when navigating
    the interface with the keyboard This is why Gtk recommends to also add those
    actions in the context menu. This set of methods greatly simplifies this, by
    adding a menu item that, when enabled, calls the same callback than clicking
    on the icon. *)

external set_menu_entry_icon_secondary_text : t -> string -> unit
  = "ml_gtk_entry_set_menu_entry_icon_secondary_text"
(** Text for an item in the context menu to activate the secondary icon action.

    When the primary icon is activatable and this property has been set, a new
    entry in the context menu of this GtkEntry will appear with this text.
    Selecting that menu entry will result in the primary icon being activated,
    exactly in the same way as it would be activated from a mouse click.

    This simplifies adding accessibility support to applications using
    activatable icons. The activatable icons aren't focusable when navigating
    the interface with the keyboard This is why Gtk recommends to also add those
    actions in the context menu. This set of methods greatly simplifies this, by
    adding a menu item that, when enabled, calls the same callback than clicking
    on the icon. *)

external get_primary_icon_activatable : t -> bool
  = "ml_gtk_entry_get_primary_icon_activatable"
(** Whether the primary icon is activatable.

    GTK emits the {{!Ocgtk.Raw.Entry.val-on_icon_press}[Gtk.Entry::icon-press]}
    and {{!Ocgtk.Raw.Entry.val-on_icon_release}[Gtk.Entry::icon-release]}
    signals only on sensitive, activatable icons.

    Sensitive, but non-activatable icons can be used for purely informational
    purposes. *)

external set_primary_icon_activatable : t -> bool -> unit
  = "ml_gtk_entry_set_primary_icon_activatable"
(** Whether the primary icon is activatable.

    GTK emits the {{!Ocgtk.Raw.Entry.val-on_icon_press}[Gtk.Entry::icon-press]}
    and {{!Ocgtk.Raw.Entry.val-on_icon_release}[Gtk.Entry::icon-release]}
    signals only on sensitive, activatable icons.

    Sensitive, but non-activatable icons can be used for purely informational
    purposes. *)

external get_primary_icon_gicon : t -> Ocgio_raw.Icon.t
  = "ml_gtk_entry_get_primary_icon_gicon"
(** The [GIcon] to use for the primary icon for the entry. *)

external set_primary_icon_gicon : t -> Ocgio_raw.Icon.t -> unit
  = "ml_gtk_entry_set_primary_icon_gicon"
(** The [GIcon] to use for the primary icon for the entry. *)

external get_primary_icon_name : t -> string
  = "ml_gtk_entry_get_primary_icon_name"
(** The icon name to use for the primary icon for the entry. *)

external set_primary_icon_name : t -> string -> unit
  = "ml_gtk_entry_set_primary_icon_name"
(** The icon name to use for the primary icon for the entry. *)

external get_primary_icon_paintable : t -> Ocgdk_raw.Paintable.t
  = "ml_gtk_entry_get_primary_icon_paintable"
(** A [GdkPaintable] to use as the primary icon for the entry. *)

external set_primary_icon_paintable : t -> Ocgdk_raw.Paintable.t -> unit
  = "ml_gtk_entry_set_primary_icon_paintable"
(** A [GdkPaintable] to use as the primary icon for the entry. *)

external get_primary_icon_sensitive : t -> bool
  = "ml_gtk_entry_get_primary_icon_sensitive"
(** Whether the primary icon is sensitive.

    An insensitive icon appears grayed out. GTK does not emit the
    {{!Ocgtk.Raw.Entry.val-on_icon_press}[Gtk.Entry::icon-press]} and
    {{!Ocgtk.Raw.Entry.val-on_icon_release}[Gtk.Entry::icon-release]} signals
    and does not allow DND from insensitive icons.

    An icon should be set insensitive if the action that would trigger when
    clicked is currently not available. *)

external set_primary_icon_sensitive : t -> bool -> unit
  = "ml_gtk_entry_set_primary_icon_sensitive"
(** Whether the primary icon is sensitive.

    An insensitive icon appears grayed out. GTK does not emit the
    {{!Ocgtk.Raw.Entry.val-on_icon_press}[Gtk.Entry::icon-press]} and
    {{!Ocgtk.Raw.Entry.val-on_icon_release}[Gtk.Entry::icon-release]} signals
    and does not allow DND from insensitive icons.

    An icon should be set insensitive if the action that would trigger when
    clicked is currently not available. *)

external get_primary_icon_storage_type : t -> Ocgtk_enums.imagetype
  = "ml_gtk_entry_get_primary_icon_storage_type"
(** The representation which is used for the primary icon of the entry. *)

external get_primary_icon_tooltip_markup : t -> string
  = "ml_gtk_entry_get_primary_icon_tooltip_markup"
(** The contents of the tooltip on the primary icon, with markup.

    Also see
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_markup}[Gtk.Entry.set_icon_tooltip_markup]}.
*)

external set_primary_icon_tooltip_markup : t -> string -> unit
  = "ml_gtk_entry_set_primary_icon_tooltip_markup"
(** The contents of the tooltip on the primary icon, with markup.

    Also see
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_markup}[Gtk.Entry.set_icon_tooltip_markup]}.
*)

external get_primary_icon_tooltip_text : t -> string
  = "ml_gtk_entry_get_primary_icon_tooltip_text"
(** The contents of the tooltip on the primary icon.

    Also see
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_text}[Gtk.Entry.set_icon_tooltip_text]}.
*)

external set_primary_icon_tooltip_text : t -> string -> unit
  = "ml_gtk_entry_set_primary_icon_tooltip_text"
(** The contents of the tooltip on the primary icon.

    Also see
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_text}[Gtk.Entry.set_icon_tooltip_text]}.
*)

external get_scroll_offset : t -> int = "ml_gtk_entry_get_scroll_offset"
(** Number of pixels of the entry scrolled off the screen to the left. *)

external get_secondary_icon_activatable : t -> bool
  = "ml_gtk_entry_get_secondary_icon_activatable"
(** Whether the secondary icon is activatable.

    GTK emits the {{!Ocgtk.Raw.Entry.val-on_icon_press}[Gtk.Entry::icon-press]}
    and {{!Ocgtk.Raw.Entry.val-on_icon_release}[Gtk.Entry::icon-release]}
    signals only on sensitive, activatable icons.

    Sensitive, but non-activatable icons can be used for purely informational
    purposes. *)

external set_secondary_icon_activatable : t -> bool -> unit
  = "ml_gtk_entry_set_secondary_icon_activatable"
(** Whether the secondary icon is activatable.

    GTK emits the {{!Ocgtk.Raw.Entry.val-on_icon_press}[Gtk.Entry::icon-press]}
    and {{!Ocgtk.Raw.Entry.val-on_icon_release}[Gtk.Entry::icon-release]}
    signals only on sensitive, activatable icons.

    Sensitive, but non-activatable icons can be used for purely informational
    purposes. *)

external get_secondary_icon_gicon : t -> Ocgio_raw.Icon.t
  = "ml_gtk_entry_get_secondary_icon_gicon"
(** The [GIcon] to use for the secondary icon for the entry. *)

external set_secondary_icon_gicon : t -> Ocgio_raw.Icon.t -> unit
  = "ml_gtk_entry_set_secondary_icon_gicon"
(** The [GIcon] to use for the secondary icon for the entry. *)

external get_secondary_icon_name : t -> string
  = "ml_gtk_entry_get_secondary_icon_name"
(** The icon name to use for the secondary icon for the entry. *)

external set_secondary_icon_name : t -> string -> unit
  = "ml_gtk_entry_set_secondary_icon_name"
(** The icon name to use for the secondary icon for the entry. *)

external get_secondary_icon_paintable : t -> Ocgdk_raw.Paintable.t
  = "ml_gtk_entry_get_secondary_icon_paintable"
(** A [GdkPaintable] to use as the secondary icon for the entry. *)

external set_secondary_icon_paintable : t -> Ocgdk_raw.Paintable.t -> unit
  = "ml_gtk_entry_set_secondary_icon_paintable"
(** A [GdkPaintable] to use as the secondary icon for the entry. *)

external get_secondary_icon_sensitive : t -> bool
  = "ml_gtk_entry_get_secondary_icon_sensitive"
(** Whether the secondary icon is sensitive.

    An insensitive icon appears grayed out. GTK does not emit the
    \[signal@Gtk.Entry::icon-press\[ and
    {{!Ocgtk.Raw.Entry.val-on_icon_release}[Gtk.Entry::icon-release]} signals
    and does not allow DND from insensitive icons.

    An icon should be set insensitive if the action that would trigger when
    clicked is currently not available. *)

external set_secondary_icon_sensitive : t -> bool -> unit
  = "ml_gtk_entry_set_secondary_icon_sensitive"
(** Whether the secondary icon is sensitive.

    An insensitive icon appears grayed out. GTK does not emit the
    \[signal@Gtk.Entry::icon-press\[ and
    {{!Ocgtk.Raw.Entry.val-on_icon_release}[Gtk.Entry::icon-release]} signals
    and does not allow DND from insensitive icons.

    An icon should be set insensitive if the action that would trigger when
    clicked is currently not available. *)

external get_secondary_icon_storage_type : t -> Ocgtk_enums.imagetype
  = "ml_gtk_entry_get_secondary_icon_storage_type"
(** The representation which is used for the secondary icon of the entry. *)

external get_secondary_icon_tooltip_markup : t -> string
  = "ml_gtk_entry_get_secondary_icon_tooltip_markup"
(** The contents of the tooltip on the secondary icon, with markup.

    Also see
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_markup}[Gtk.Entry.set_icon_tooltip_markup]}.
*)

external set_secondary_icon_tooltip_markup : t -> string -> unit
  = "ml_gtk_entry_set_secondary_icon_tooltip_markup"
(** The contents of the tooltip on the secondary icon, with markup.

    Also see
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_markup}[Gtk.Entry.set_icon_tooltip_markup]}.
*)

external get_secondary_icon_tooltip_text : t -> string
  = "ml_gtk_entry_get_secondary_icon_tooltip_text"
(** The contents of the tooltip on the secondary icon.

    Also see
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_text}[Gtk.Entry.set_icon_tooltip_text]}.
*)

external set_secondary_icon_tooltip_text : t -> string -> unit
  = "ml_gtk_entry_set_secondary_icon_tooltip_text"
(** The contents of the tooltip on the secondary icon.

    Also see
    {{!Ocgtk.Raw.Entry.val-set_icon_tooltip_text}[Gtk.Entry.set_icon_tooltip_text]}.
*)

external get_show_emoji_icon : t -> bool = "ml_gtk_entry_get_show_emoji_icon"
(** Whether the entry will show an Emoji icon in the secondary icon position to
    open the Emoji chooser. *)

external set_show_emoji_icon : t -> bool -> unit
  = "ml_gtk_entry_set_show_emoji_icon"
(** Whether the entry will show an Emoji icon in the secondary icon position to
    open the Emoji chooser. *)

external get_truncate_multiline : t -> bool
  = "ml_gtk_entry_get_truncate_multiline"
(** When [true], pasted multi-line text is truncated to the first line. *)

external set_truncate_multiline : t -> bool -> unit
  = "ml_gtk_entry_set_truncate_multiline"
(** When [true], pasted multi-line text is truncated to the first line. *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the entry is activated.

    The keybindings for this signal are all forms of the Enter key. *)

val on_icon_press :
  ?after:bool ->
  t ->
  callback:(icon_pos:Ocgtk_enums.entryiconposition -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when an activatable icon is clicked. *)

val on_icon_release :
  ?after:bool ->
  t ->
  callback:(icon_pos:Ocgtk_enums.entryiconposition -> unit) ->
  Gobject.Signal.handler_id
(** Emitted on the button release from a mouse click over an activatable icon.
*)
