(* GENERATED CODE - DO NOT EDIT *)
(* Label: Label *)

(** Displays a small amount of text.

    Most labels are used to label another widget (such as an [Entry]).

    An example GtkLabel

    {b Shortcuts and Gestures}

    [GtkLabel] supports the following keyboard shortcuts, when the cursor is
    visible:

    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.
    - <kbd>Ctrl</kbd>+<kbd>A</kbd> or <kbd>Ctrl</kbd>+<kbd>&sol;</kbd> selects
      all.
    - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>A</kbd> or
      <kbd>Ctrl</kbd>+<kbd>&bsol;</kbd> unselects all.

    Additionally, the following signals have default keybindings:

    - [Gtk.Label::activate-current-link]
    - [Gtk.Label::copy-clipboard]
    - [Gtk.Label::move-cursor]

    {b Actions}

    [GtkLabel] defines a set of built-in actions:

    - [clipboard.copy] copies the text to the clipboard.
    - [clipboard.cut] doesn't do anything, since text in labels can't be
      deleted.
    - [clipboard.paste] doesn't do anything, since text in labels can't be
      edited.
    - [link.open] opens the link, when activated on a link inside the label.
    - [link.copy] copies the link to the clipboard, when activated on a link
      inside the label.
    - [menu.popup] opens the context menu.
    - [selection.delete] doesn't do anything, since text in labels can't be
      deleted.
    - [selection.select-all] selects all of the text, if the label allows
      selection.

    {b CSS nodes}

    {[
    label
    ├── [selection]
    ├── [link]
    ┊
    ╰── [link]
    ]}

    [GtkLabel] has a single CSS node with the name label. A wide variety of
    style classes may be applied to labels, such as .title, .subtitle,
    .dim-label, etc. In the [GtkShortcutsWindow], labels are used with the
    .keycap style class.

    If the label has a selection, it gets a subnode with name selection.

    If the label has links, there is one subnode per link. These subnodes carry
    the link or visited state depending on whether they have been visited. In
    this case, label node also gets a .link style class.

    {b GtkLabel as GtkBuildable}

    The GtkLabel implementation of the GtkBuildable interface supports a custom
    [<attributes>] element, which supports any number of [<attribute>] elements.
    The [<attribute>] element has attributes named “name“, “value“, “start“ and
    “end“ and allows you to specify [Pango.Attribute] values for this label.

    An example of a UI definition fragment specifying Pango attributes:

    {[
    <object class=”GtkLabel”>
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

    [GtkLabel] uses the [Gtk.AccessibleRole.label] role.

    {b Mnemonics}

    Labels may contain “mnemonics”. Mnemonics are underlined characters in the
    label, used for keyboard navigation. Mnemonics are created by providing a
    string with an underscore before the mnemonic character, such as [“_File”],
    to the functions [Gtk.Label.new_with_mnemonic] or
    [Gtk.Label.set_text_with_mnemonic].

    Mnemonics automatically activate any activatable widget the label is inside,
    such as a [Gtk.Button]; if the label is not inside the mnemonic’s target
    widget, you have to tell the label about the target using
    [Gtk.Label.set_mnemonic_widget].

    Here’s a simple example where the label is inside a button:

    {[
    // Pressing Alt+H will activate this button
    GtkWidget *button = gtk_button_new ();
    GtkWidget *label = gtk_label_new_with_mnemonic (“_Hello”);
    gtk_button_set_child (GTK_BUTTON (button), label);
    ]}

    There’s a convenience function to create buttons with a mnemonic label
    already inside:

    {[
    // Pressing Alt+H will activate this button
    GtkWidget *button = gtk_button_new_with_mnemonic (“_Hello”);
    ]}

    To create a mnemonic for a widget alongside the label, such as a
    [Gtk.Entry], you have to point the label at the entry with
    [Gtk.Label.set_mnemonic_widget]:

    {[
    // Pressing Alt+H will focus the entry
    GtkWidget *entry = gtk_entry_new ();
    GtkWidget *label = gtk_label_new_with_mnemonic (“_Hello”);
    gtk_label_set_mnemonic_widget (GTK_LABEL (label), entry);
    ]}

    {b Markup (styled text)}

    To make it easy to format text in a label (changing colors, fonts, etc.),
    label text can be provided in a simple markup format:

    Here’s how to create a label with a small font:

    {[
    GtkWidget *label = gtk_label_new (NULL);
    gtk_label_set_markup (GTK_LABEL (label), “<small>Small text</small>”);
    ]}

    (See the Pango manual for complete documentation\] of available tags,
    [Pango.parse_markup])

    The markup passed to [Gtk.Label.set_markup] must be valid XML; for example,
    literal [<], [>] and [&] characters must be escaped as [&lt;], [&gt;], and
    [&amp;]. If you pass text obtained from the user, file, or a network to
    [Gtk.Label.set_markup], you’ll want to escape it with
    [GLib.markup_escape_text] or [GLib.markup_printf_escaped].

    Markup strings are just a convenient way to set the [Pango.AttrList] on a
    label; [Gtk.Label.set_attributes] may be a simpler way to set attributes in
    some cases. Be careful though; [Pango.AttrList] tends to cause
    internationalization problems, unless you’re applying attributes to the
    entire string (i.e. unless you set the range of each attribute to \[0,
    [G_MAXINT])). The reason is that specifying the [start_index] and
    [end_index] for a [Pango.Attribute] requires knowledge of the exact string
    being displayed, so translations will cause problems.

    {b Selectable labels}

    Labels can be made selectable with [Gtk.Label.set_selectable]. Selectable
    labels allow the user to copy the label contents to the clipboard. Only
    labels that contain useful-to-copy information — such as error messages —
    should be made selectable.

    {b Text layout}

    A label can contain any number of paragraphs, but will have performance
    problems if it contains more than a small number. Paragraphs are separated
    by newlines or other paragraph separators understood by Pango.

    Labels can automatically wrap text if you call [Gtk.Label.set_wrap].

    [Gtk.Label.set_justify] sets how the lines in a label align with one
    another. If you want to set how the label as a whole aligns in its available
    space, see the [Gtk.Widget:halign] and [Gtk.Widget:valign] properties.

    The [Gtk.Label:width-chars] and [Gtk.Label:max-width-chars] properties can
    be used to control the size allocation of ellipsized or wrapped labels. For
    ellipsizing labels, if either is specified (and less than the actual text
    size), it is used as the minimum width, and the actual text size is used as
    the natural width of the label. For wrapping labels, width-chars is used as
    the minimum width, if specified, and max-width-chars is used as the natural
    width. Even if max-width-chars specified, wrapping labels will be rewrapped
    to use all of the available width.

    {b Links}

    GTK supports markup for clickable hyperlinks in addition to regular Pango
    markup. The markup for links is borrowed from HTML, using the [<a>] tag with
    “href“, “title“ and “class“ attributes. GTK renders links similar to the way
    they appear in web browsers, with colored, underlined text. The “title“
    attribute is displayed as a tooltip on the link. The “class“ attribute is
    used as style class on the CSS node for the link.

    An example of inline links looks like this:

    {[
    const char *text =
    “Go to the “
    “<a href=\”https://www.gtk.org\” title=\”&lt;i&gt;Our&lt;/i&gt; website\”>”
    “GTK website</a> for more...”;
    GtkWidget *label = gtk_label_new (NULL);
    gtk_label_set_markup (GTK_LABEL (label), text);
    ]}

    It is possible to implement custom handling for links and their tooltips
    with the [Gtk.Label::activate-link] signal and the
    [Gtk.Label.get_current_uri] function. *)

type t = [ `label | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : string option -> t = "ml_gtk_label_new"
(** Create a new Label *)

external new_with_mnemonic : string option -> t
  = "ml_gtk_label_new_with_mnemonic"
(** Create a new Label *)

(* Methods *)

external set_yalign : t -> float -> unit = "ml_gtk_label_set_yalign"
(** Sets the [yalign] of the label.

    See the [Gtk.Label:yalign] property. *)

external set_xalign : t -> float -> unit = "ml_gtk_label_set_xalign"
(** Sets the [xalign] of the label.

    See the [Gtk.Label:xalign] property. *)

external set_wrap_mode : t -> Ocgtk_pango.Pango.wrapmode -> unit
  = "ml_gtk_label_set_wrap_mode"
(** Controls how line wrapping is done.

    This only affects the label if line wrapping is on. (See
    [Gtk.Label.set_wrap])

    The default is [Pango.WrapMode.word], which means wrap on word boundaries.

    For sizing behavior, also consider the [Gtk.Label:natural-wrap-mode]
    property. *)

external set_wrap : t -> bool -> unit = "ml_gtk_label_set_wrap"
(** Toggles line wrapping within the label.

    True makes it break lines if text exceeds the widget’s size. false lets the
    text get cut off by the edge of the widget if it exceeds the widget size.

    Note that setting line wrapping to true does not make the label wrap at its
    parent widget’s width, because GTK widgets conceptually can’t make their
    requisition depend on the parent widget’s size. For a label that wraps at a
    specific position, set the label’s width using
    [Gtk.Widget.set_size_request]. *)

external set_width_chars : t -> int -> unit = "ml_gtk_label_set_width_chars"
(** Sets the desired width in characters of the label. *)

external set_use_underline : t -> bool -> unit
  = "ml_gtk_label_set_use_underline"
(** Sets whether underlines in the text indicate mnemonics. *)

external set_use_markup : t -> bool -> unit = "ml_gtk_label_set_use_markup"
(** Sets whether the text of the label contains markup.

    See [Gtk.Label.set_markup]. *)

external set_text_with_mnemonic : t -> string -> unit
  = "ml_gtk_label_set_text_with_mnemonic"
(** Sets the text for the label, with mnemonics.

    If characters in [str] are preceded by an underscore, they are underlined
    indicating that they represent a keyboard accelerator called a mnemonic. The
    mnemonic key can be used to activate another widget, chosen automatically,
    or explicitly using [Gtk.Label.set_mnemonic_widget]. *)

external set_text : t -> string -> unit = "ml_gtk_label_set_text"
(** Sets the text for the label.

    It overwrites any text that was there before and clears any previously set
    mnemonic accelerators, and sets the [Gtk.Label:use-underline] and
    [Gtk.Label:use-markup] properties to false.

    Also see [Gtk.Label.set_markup]. *)

external set_tabs : t -> Ocgtk_pango.Pango.Wrappers.Tab_array.t option -> unit
  = "ml_gtk_label_set_tabs"
(** Sets tab stops for the label. *)

external set_single_line_mode : t -> bool -> unit
  = "ml_gtk_label_set_single_line_mode"
(** Sets whether the label is in single line mode. *)

external set_selectable : t -> bool -> unit = "ml_gtk_label_set_selectable"
(** Makes text in the label selectable.

    Selectable labels allow the user to select text from the label, for
    copy-and-paste. *)

external set_natural_wrap_mode : t -> Gtk_enums.naturalwrapmode -> unit
  = "ml_gtk_label_set_natural_wrap_mode"
(** Selects the line wrapping for the natural size request.

    This only affects the natural size requested, for the actual wrapping used,
    see the [Gtk.Label:wrap-mode] property. *)

external set_mnemonic_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_label_set_mnemonic_widget"
(** Associate the label with its mnemonic target.

    If the label has been set so that it has a mnemonic key (using i.e.
    [Gtk.Label.set_markup_with_mnemonic], [Gtk.Label.set_text_with_mnemonic],
    [Gtk.Label.new_with_mnemonic] or the [Gtk.Label:use_underline] property) the
    label can be associated with a widget that is the target of the mnemonic.
    When the label is inside a widget (like a [Gtk.Button] or a [Gtk.Notebook]
    tab) it is automatically associated with the correct widget, but sometimes
    (i.e. when the target is a [Gtk.Entry] next to the label) you need to set it
    explicitly using this function.

    The target widget will be accelerated by emitting the
    [Gtk.Widget::mnemonic-activate] signal on it. The default handler for this
    signal will activate the widget if there are no mnemonic collisions and
    toggle focus between the colliding widgets otherwise. *)

external set_max_width_chars : t -> int -> unit
  = "ml_gtk_label_set_max_width_chars"
(** Sets the maximum width of the label in characters. *)

external set_markup_with_mnemonic : t -> string -> unit
  = "ml_gtk_label_set_markup_with_mnemonic"
(** Sets the labels text, attributes and mnemonic from markup.

    Parses [str] which is marked up with Pango markup (see
    [Pango.parse_markup]), setting the label’s text and attribute list based on
    the parse results. If characters in [str] are preceded by an underscore,
    they are underlined indicating that they represent a keyboard accelerator
    called a mnemonic.

    The mnemonic key can be used to activate another widget, chosen
    automatically, or explicitly using [Gtk.Label.set_mnemonic_widget]. *)

external set_markup : t -> string -> unit = "ml_gtk_label_set_markup"
(** Sets the labels text and attributes from markup.

    The string must be marked up with Pango markup (see [Pango.parse_markup]).

    If [str] is external data, you may need to escape it with
    [GLib.markup_escape_text] or [GLib.markup_printf_escaped]:

    {[
    GtkWidget *self = gtk_label_new (NULL);
    const char *str = “...”;
    const char *format = “<span style=\”italic\”>\%s</span>”;
    char *markup;

    markup = g_markup_printf_escaped (format, str);
    gtk_label_set_markup (GTK_LABEL (self), markup);
    g_free (markup);
    ]}

    This function sets the [Gtk.Label:use-markup] property to true.

    Also see [Gtk.Label.set_text]. *)

external set_lines : t -> int -> unit = "ml_gtk_label_set_lines"
(** Sets the number of lines to which an ellipsized, wrapping label should be
    limited.

    This has no effect if the label is not wrapping or ellipsized. Set this to
    -1 if you don’t want to limit the number of lines. *)

external set_label : t -> string -> unit = "ml_gtk_label_set_label"
(** Sets the text of the label.

    The label is interpreted as including embedded underlines and/or Pango
    markup depending on the values of the [Gtk.Label:use-underline] and
    [Gtk.Label:use-markup] properties. *)

external set_justify : t -> Gtk_enums.justification -> unit
  = "ml_gtk_label_set_justify"
(** Sets the alignment of lines in the label relative to each other.

    This function has no effect on labels containing only a single line.

    [Gtk.Justification.left] is the default value when the widget is first
    created with [Gtk.Label.new].

    If you instead want to set the alignment of the label as a whole, use
    [Gtk.Widget.set_halign] instead. *)

external set_extra_menu :
  t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option -> unit
  = "ml_gtk_label_set_extra_menu"
(** Sets a menu model to add to the context menu of the label. *)

external set_ellipsize : t -> Ocgtk_pango.Pango.ellipsizemode -> unit
  = "ml_gtk_label_set_ellipsize"
(** Sets the mode used to ellipsize the text.

    The text will be ellipsized if there is not enough space to render the
    entire string. *)

external set_attributes :
  t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t option -> unit
  = "ml_gtk_label_set_attributes"
(** Apply attributes to the label text.

    The attributes set with this function will be applied and merged with any
    other attributes previously effected by way of the [Gtk.Label:use-underline]
    or [Gtk.Label:use-markup] properties

    While it is not recommended to mix markup strings with manually set
    attributes, if you must; know that the attributes will be applied to the
    label after the markup string is parsed. *)

external select_region : t -> int -> int -> unit = "ml_gtk_label_select_region"
(** Selects a range of characters in the label, if the label is selectable.

    See [Gtk.Label.set_selectable]. If the label is not selectable, this
    function has no effect. If [start_offset] or [end_offset] are -1, then the
    end of the label will be substituted. *)

external get_yalign : t -> float = "ml_gtk_label_get_yalign"
(** Gets the [yalign] of the label.

    See the [Gtk.Label:yalign] property. *)

external get_xalign : t -> float = "ml_gtk_label_get_xalign"
(** Gets the [xalign] of the label.

    See the [Gtk.Label:xalign] property. *)

external get_wrap_mode : t -> Ocgtk_pango.Pango.wrapmode
  = "ml_gtk_label_get_wrap_mode"
(** Returns line wrap mode used by the label.

    See [Gtk.Label.set_wrap_mode]. *)

external get_wrap : t -> bool = "ml_gtk_label_get_wrap"
(** Returns whether lines in the label are automatically wrapped.

    See [Gtk.Label.set_wrap]. *)

external get_width_chars : t -> int = "ml_gtk_label_get_width_chars"
(** Retrieves the desired width of the label in characters.

    See [Gtk.Label.set_width_chars]. *)

external get_use_underline : t -> bool = "ml_gtk_label_get_use_underline"
(** Returns whether underlines in the label indicate mnemonics.

    See [Gtk.Label.set_use_underline]. *)

external get_use_markup : t -> bool = "ml_gtk_label_get_use_markup"
(** Returns whether the label’s text is interpreted as Pango markup.

    See [Gtk.Label.set_use_markup]. *)

external get_text : t -> string = "ml_gtk_label_get_text"
(** Gets the text of the label.

    The returned text is as it appears on screen. This does not include any
    embedded underlines indicating mnemonics or Pango markup. (See
    [Gtk.Label.get_label]) *)

external get_tabs : t -> Ocgtk_pango.Pango.Wrappers.Tab_array.t option
  = "ml_gtk_label_get_tabs"
(** Gets the tab stops for the label.

    The returned array will be [NULL] if “standard” (8-space) tabs are used. *)

external get_single_line_mode : t -> bool = "ml_gtk_label_get_single_line_mode"
(** Returns whether the label is in single line mode. *)

external get_selection_bounds : t -> bool * int * int
  = "ml_gtk_label_get_selection_bounds"
(** Gets the selected range of characters in the label.

    The returned [start] and [end] positions are in characters. *)

external get_selectable : t -> bool = "ml_gtk_label_get_selectable"
(** Returns whether the label is selectable. *)

external get_natural_wrap_mode : t -> Gtk_enums.naturalwrapmode
  = "ml_gtk_label_get_natural_wrap_mode"
(** Returns natural line wrap mode used by the label.

    See [Gtk.Label.set_natural_wrap_mode]. *)

external get_mnemonic_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_label_get_mnemonic_widget"
(** Retrieves the mnemonic target of this label.

    See [Gtk.Label.set_mnemonic_widget]. *)

external get_mnemonic_keyval : t -> int = "ml_gtk_label_get_mnemonic_keyval"
(** Return the mnemonic accelerator.

    If the label has been set so that it has a mnemonic key this function
    returns the keyval used for the mnemonic accelerator. If there is no
    mnemonic set up it returns [GDK_KEY_VoidSymbol]. *)

external get_max_width_chars : t -> int = "ml_gtk_label_get_max_width_chars"
(** Retrieves the maximum width of the label in characters.

    See [Gtk.Label.set_width_chars]. *)

external get_lines : t -> int = "ml_gtk_label_get_lines"
(** Gets the number of lines to which an ellipsized, wrapping label should be
    limited.

    See [Gtk.Label.set_lines]. *)

external get_layout_offsets : t -> int * int = "ml_gtk_label_get_layout_offsets"
(** Obtains the coordinates where the label will draw its Pango layout.

    The coordinates are useful to convert mouse events into coordinates inside
    the [Pango.Layout], e.g. to take some action if some part of the label is
    clicked. Remember when using the [Pango.Layout] functions you need to
    convert to and from pixels using [PANGO_PIXELS()] or [Pango.SCALE]. *)

external get_layout : t -> Ocgtk_pango.Pango.Wrappers.Layout.t
  = "ml_gtk_label_get_layout"
(** Gets the Pango layout used to display the label.

    The layout is useful to e.g. convert text positions to pixel positions, in
    combination with [Gtk.Label.get_layout_offsets]. The returned layout is
    owned by the [label] so need not be freed by the caller. The [label] is free
    to recreate its layout at any time, so it should be considered read-only. *)

external get_label : t -> string = "ml_gtk_label_get_label"
(** Fetches the text from a label.

    The returned text includes any embedded underlines indicating mnemonics and
    Pango markup. (See [Gtk.Label.get_text]). *)

external get_justify : t -> Gtk_enums.justification = "ml_gtk_label_get_justify"
(** Returns the justification of the label.

    See [Gtk.Label.set_justify]. *)

external get_extra_menu : t -> Ocgtk_gio.Gio.Wrappers.Menu_model.t option
  = "ml_gtk_label_get_extra_menu"
(** Gets the extra menu model of the label.

    See [Gtk.Label.set_extra_menu]. *)

external get_ellipsize : t -> Ocgtk_pango.Pango.ellipsizemode
  = "ml_gtk_label_get_ellipsize"
(** Returns the ellipsization mode of the label.

    See [Gtk.Label.set_ellipsize]. *)

external get_current_uri : t -> string option = "ml_gtk_label_get_current_uri"
(** Returns the URI for the active link in the label.

    The active link is the one under the mouse pointer or, in a selectable
    label, the link in which the text cursor is currently positioned.

    This function is intended for use in a [Gtk.Label::activate-link] handler or
    for use in a [Gtk.Widget::query-tooltip] handler. *)

external get_attributes : t -> Ocgtk_pango.Pango.Wrappers.Attr_list.t option
  = "ml_gtk_label_get_attributes"
(** Gets the label's attribute list.

    This is the [Pango.AttrList] that was set on the label using
    [Gtk.Label.set_attributes], if any. This function does not reflect
    attributes that come from the label's markup (see [Gtk.Label.set_markup]).
    If you want to get the effective attributes for the label, use
    [pango_layout_get_attributes (gtk_label_get_layout (self))]. *)

(* Properties *)

val on_activate_current_link :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_activate_link :
  ?after:bool -> t -> callback:(uri:string -> bool) -> Gobject.Signal.handler_id

val on_copy_clipboard :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_move_cursor :
  ?after:bool ->
  t ->
  callback:
    (step:Gtk_enums.movementstep -> count:int -> extend_selection:bool -> unit) ->
  Gobject.Signal.handler_id
