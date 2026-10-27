[@@@ocaml.text
"Displays a small amount of text.\n\n\
 Most labels are used to label another widget (such as an [Entry]).\n\n\
 An example GtkLabel\n\n\
 {b Shortcuts and Gestures}\n\n\
 [GtkLabel] supports the following keyboard shortcuts, when the cursor is\n\
 visible:\n\n\
 - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.\n\
 - <kbd>Ctrl</kbd>+<kbd>A</kbd> or <kbd>Ctrl</kbd>+<kbd>&sol;</kbd>\n\
 selects all.\n\
 - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>A</kbd> or\n\
 <kbd>Ctrl</kbd>+<kbd>&bsol;</kbd> unselects all.\n\n\
 Additionally, the following signals have default keybindings:\n\n\
 - [Gtk.Label::activate-current-link]\n\
 - [Gtk.Label::copy-clipboard]\n\
 - [Gtk.Label::move-cursor]\n\n\
 {b Actions}\n\n\
 [GtkLabel] defines a set of built-in actions:\n\n\
 - [clipboard.copy] copies the text to the clipboard.\n\
 - [clipboard.cut] doesn't do anything, since text in labels can't be deleted.\n\
 - [clipboard.paste] doesn't do anything, since text in labels can't be\n\
 edited.\n\
 - [link.open] opens the link, when activated on a link inside the label.\n\
 - [link.copy] copies the link to the clipboard, when activated on a link\n\
 inside the label.\n\
 - [menu.popup] opens the context menu.\n\
 - [selection.delete] doesn't do anything, since text in labels can't be\n\
 deleted.\n\
 - [selection.select-all] selects all of the text, if the label allows\n\
 selection.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 label\n\
 ├── [selection]\n\
 ├── [link]\n\
 ┊\n\
 ╰── [link]\n\
 ]}\n\n\
 [GtkLabel] has a single CSS node with the name label. A wide variety\n\
 of style classes may be applied to labels, such as .title, .subtitle,\n\
 .dim-label, etc. In the [GtkShortcutsWindow], labels are used with the\n\
 .keycap style class.\n\n\
 If the label has a selection, it gets a subnode with name selection.\n\n\
 If the label has links, there is one subnode per link. These subnodes\n\
 carry the link or visited state depending on whether they have been\n\
 visited. In this case, label node also gets a .link style class.\n\n\
 {b GtkLabel as GtkBuildable}\n\n\
 The GtkLabel implementation of the GtkBuildable interface supports a\n\
 custom [<attributes>] element, which supports any number of [<attribute>]\n\
 elements. The [<attribute>] element has attributes named “name“, “value“,\n\
 “start“ and “end“ and allows you to specify [Pango.Attribute]\n\
 values for this label.\n\n\
 An example of a UI definition fragment specifying Pango attributes:\n\n\
 {[\n\
 <object class=\"GtkLabel\">\n\
\  <attributes>\n\
\    <attribute name=\"weight\" value=\"PANGO_WEIGHT_BOLD\"/>\n\
\    <attribute name=\"background\" value=\"red\" start=\"5\" end=\"10\"/>\n\
\  </attributes>\n\
 </object>\n\
 ]}\n\n\
 The start and end attributes specify the range of characters to which the\n\
 Pango attribute applies. If start and end are not specified, the attribute is\n\
 applied to the whole text. Note that specifying ranges does not make much\n\
 sense with translatable attributes. Use markup embedded in the translatable\n\
 content instead.\n\n\
 {b Accessibility}\n\n\
 [GtkLabel] uses the [Gtk.AccessibleRole.label] role.\n\n\
 {b Mnemonics}\n\n\
 Labels may contain “mnemonics”. Mnemonics are underlined characters in the\n\
 label, used for keyboard navigation. Mnemonics are created by providing a\n\
 string with an underscore before the mnemonic character, such as [\"_File\"],\n\
 to the functions [Gtk.Label.new_with_mnemonic] or\n\
 [Gtk.Label.set_text_with_mnemonic].\n\n\
 Mnemonics automatically activate any activatable widget the label is\n\
 inside, such as a [Gtk.Button]; if the label is not inside the\n\
 mnemonic’s target widget, you have to tell the label about the target\n\
 using [Gtk.Label.set_mnemonic_widget].\n\n\
 Here’s a simple example where the label is inside a button:\n\n\
 {[\n\
 // Pressing Alt+H will activate this button\n\
 GtkWidget *button = gtk_button_new ();\n\
 GtkWidget *label = gtk_label_new_with_mnemonic (\"_Hello\");\n\
 gtk_button_set_child (GTK_BUTTON (button), label);\n\
 ]}\n\n\
 There’s a convenience function to create buttons with a mnemonic label\n\
 already inside:\n\n\
 {[\n\
 // Pressing Alt+H will activate this button\n\
 GtkWidget *button = gtk_button_new_with_mnemonic (\"_Hello\");\n\
 ]}\n\n\
 To create a mnemonic for a widget alongside the label, such as a\n\
 [Gtk.Entry], you have to point the label at the entry with\n\
 [Gtk.Label.set_mnemonic_widget]:\n\n\
 {[\n\
 // Pressing Alt+H will focus the entry\n\
 GtkWidget *entry = gtk_entry_new ();\n\
 GtkWidget *label = gtk_label_new_with_mnemonic (\"_Hello\");\n\
 gtk_label_set_mnemonic_widget (GTK_LABEL (label), entry);\n\
 ]}\n\n\
 {b Markup (styled text)}\n\n\
 To make it easy to format text in a label (changing colors, fonts, etc.),\n\
 label text can be provided in a simple markup format:\n\n\
 Here’s how to create a label with a small font:\n\n\
 {[\n\
 GtkWidget *label = gtk_label_new (NULL);\n\
 gtk_label_set_markup (GTK_LABEL (label), \"<small>Small text</small>\");\n\
 ]}\n\n\
 (See the Pango manual for complete documentation\\] of available\n\
 tags, [Pango.parse_markup])\n\n\
 The markup passed to [Gtk.Label.set_markup] must be valid XML; for example,\n\
 literal [<], [>] and [&] characters must be escaped as [&lt;], [&gt;], and \
 [&amp;].\n\
 If you pass text obtained from the user, file, or a network to\n\
 [Gtk.Label.set_markup], you’ll want to escape it with\n\
 [GLib.markup_escape_text] or [GLib.markup_printf_escaped].\n\n\
 Markup strings are just a convenient way to set the [Pango.AttrList]\n\
 on a label; [Gtk.Label.set_attributes] may be a simpler way to set\n\
 attributes in some cases. Be careful though; [Pango.AttrList] tends\n\
 to cause internationalization problems, unless you’re applying attributes\n\
 to the entire string (i.e. unless you set the range of each attribute\n\
 to \\[0, [G_MAXINT])). The reason is that specifying the [start_index] and\n\
 [end_index] for a [Pango.Attribute] requires knowledge of the exact\n\
 string being displayed, so translations will cause problems.\n\n\
 {b Selectable labels}\n\n\
 Labels can be made selectable with [Gtk.Label.set_selectable].\n\
 Selectable labels allow the user to copy the label contents to the\n\
 clipboard. Only labels that contain useful-to-copy information — such\n\
 as error messages — should be made selectable.\n\n\
 {b Text layout}\n\n\
 A label can contain any number of paragraphs, but will have\n\
 performance problems if it contains more than a small number.\n\
 Paragraphs are separated by newlines or other paragraph separators\n\
 understood by Pango.\n\n\
 Labels can automatically wrap text if you call [Gtk.Label.set_wrap].\n\n\
 [Gtk.Label.set_justify] sets how the lines in a label align\n\
 with one another. If you want to set how the label as a whole aligns\n\
 in its available space, see the [Gtk.Widget:halign] and\n\
 [Gtk.Widget:valign] properties.\n\n\
 The [Gtk.Label:width-chars] and [Gtk.Label:max-width-chars]\n\
 properties can be used to control the size allocation of ellipsized or\n\
 wrapped labels. For ellipsizing labels, if either is specified (and less\n\
 than the actual text size), it is used as the minimum width, and the actual\n\
 text size is used as the natural width of the label. For wrapping labels,\n\
 width-chars is used as the minimum width, if specified, and max-width-chars\n\
 is used as the natural width. Even if max-width-chars specified, wrapping\n\
 labels will be rewrapped to use all of the available width.\n\n\
 {b Links}\n\n\
 GTK supports markup for clickable hyperlinks in addition to regular Pango\n\
 markup. The markup for links is borrowed from HTML, using the [<a>] tag\n\
 with “href“, “title“ and “class“ attributes. GTK renders links similar to\n\
 the way they appear in web browsers, with colored, underlined text. The\n\
 “title“ attribute is displayed as a tooltip on the link. The “class“\n\
 attribute is used as style class on the CSS node for the link.\n\n\
 An example of inline links looks like this:\n\n\
 {[\n\
 const char *text =\n\
 \"Go to the \"\n\
 \"<a href=\\\"https://www.gtk.org\\\" title=\\\"&lt;i&gt;Our&lt;/i&gt; \
 website\\\">\"\n\
 \"GTK website</a> for more...\";\n\
 GtkWidget *label = gtk_label_new (NULL);\n\
 gtk_label_set_markup (GTK_LABEL (label), text);\n\
 ]}\n\n\
 It is possible to implement custom handling for links and their tooltips\n\
 with the [Gtk.Label::activate-link] signal and the\n\
 [Gtk.Label.get_current_uri] function.\n\n\
 Its methods, signals and properties are on {!class-type-label_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.Label}."]

(** The methods, signals and properties of a [GtkLabel]. *)
class type label_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_text.accessible_text_t

  method on_activate_current_link :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted when the user activates a link in the label.

      The [::activate-current-link] is a keybinding signal.

      Applications may also emit the signal with g_signal_emit_by_name() if they
      need to control activation of URIs programmatically.

      The default bindings for this signal are all forms of the <kbd>Enter</kbd>
      key. *)

  method on_activate_link :
    ?after:bool ->
    callback:(uri:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted to activate a URI.

      Applications may connect to it to override the default behaviour, which is
      to call [Gtk.FileLauncher.launch]. *)

  method on_copy_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Gets emitted to copy the selection to the clipboard.

      The [::copy-clipboard] signal is a keybinding signal.

      The default binding for this signal is <kbd>Ctrl</kbd>+<kbd>c</kbd>. *)

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep -> count:int -> extend_selection:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Gets emitted when the user initiates a cursor movement.

      The [::move-cursor] signal is a keybinding signal. If the cursor is not
      visible in [entry], this signal causes the viewport to be moved instead.

      Applications should not connect to it, but may emit it with
      [GObject.signal_emit_by_name] if they need to control the cursor
      programmatically.

      The default bindings for this signal come in two variants, the variant
      with the <kbd>Shift</kbd> modifier extends the selection, the variant
      without the <kbd>Shift</kbd> modifier does not. There are too many key
      combinations to list them all here.

      - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd> move by
        individual characters/lines
      - <kbd>Ctrl</kbd>+<kbd>←</kbd>, etc. move by words/paragraphs
      - <kbd>Home</kbd> and <kbd>End</kbd> move to the ends of the buffer *)

  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  (** Gets the label's attribute list.

      This is the [Pango.AttrList] that was set on the label using
      [Gtk.Label.set_attributes], if any. This function does not reflect
      attributes that come from the label's markup (see [Gtk.Label.set_markup]).
      If you want to get the effective attributes for the label, use
      [pango_layout_get_attributes (gtk_label_get_layout (self))]. *)

  method get_current_uri : unit -> string option
  (** Returns the URI for the active link in the label.

      The active link is the one under the mouse pointer or, in a selectable
      label, the link in which the text cursor is currently positioned.

      This function is intended for use in a [Gtk.Label::activate-link] handler
      or for use in a [Gtk.Widget::query-tooltip] handler. *)

  method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode
  (** Returns the ellipsization mode of the label.

      See [Gtk.Label.set_ellipsize]. *)

  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  (** Gets the extra menu model of the label.

      See [Gtk.Label.set_extra_menu]. *)

  method get_justify : unit -> Enums.justification
  (** Returns the justification of the label.

      See [Gtk.Label.set_justify]. *)

  method get_label : unit -> string
  (** Fetches the text from a label.

      The returned text includes any embedded underlines indicating mnemonics
      and Pango markup. (See [Gtk.Label.get_text]). *)

  method get_layout : unit -> Ocpango.Layout.layout_t
  (** Gets the Pango layout used to display the label.

      The layout is useful to e.g. convert text positions to pixel positions, in
      combination with [Gtk.Label.get_layout_offsets]. The returned layout is
      owned by the [label] so need not be freed by the caller. The [label] is
      free to recreate its layout at any time, so it should be considered
      read-only. *)

  method get_lines : unit -> int
  (** Gets the number of lines to which an ellipsized, wrapping label should be
      limited.

      See [Gtk.Label.set_lines]. *)

  method get_max_width_chars : unit -> int
  (** Retrieves the maximum width of the label in characters.

      See [Gtk.Label.set_width_chars]. *)

  method get_mnemonic_keyval : unit -> int
  (** Return the mnemonic accelerator.

      If the label has been set so that it has a mnemonic key this function
      returns the keyval used for the mnemonic accelerator. If there is no
      mnemonic set up it returns [GDK_KEY_VoidSymbol]. *)

  method get_mnemonic_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Retrieves the mnemonic target of this label.

      See [Gtk.Label.set_mnemonic_widget]. *)

  method get_natural_wrap_mode : unit -> Enums.naturalwrapmode
  (** Returns natural line wrap mode used by the label.

      See [Gtk.Label.set_natural_wrap_mode]. *)

  method get_selectable : unit -> bool
  (** Returns whether the label is selectable. *)

  method get_single_line_mode : unit -> bool
  (** Returns whether the label is in single line mode. *)

  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  (** Gets the tab stops for the label.

      The returned array will be [NULL] if “standard” (8-space) tabs are used.
  *)

  method get_text : unit -> string
  (** Gets the text of the label.

      The returned text is as it appears on screen. This does not include any
      embedded underlines indicating mnemonics or Pango markup. (See
      [Gtk.Label.get_label]) *)

  method get_use_markup : unit -> bool
  (** Returns whether the label’s text is interpreted as Pango markup.

      See [Gtk.Label.set_use_markup]. *)

  method get_use_underline : unit -> bool
  (** Returns whether underlines in the label indicate mnemonics.

      See [Gtk.Label.set_use_underline]. *)

  method get_width_chars : unit -> int
  (** Retrieves the desired width of the label in characters.

      See [Gtk.Label.set_width_chars]. *)

  method get_wrap : unit -> bool
  (** Returns whether lines in the label are automatically wrapped.

      See [Gtk.Label.set_wrap]. *)

  method get_wrap_mode : unit -> Ocpango.Enums.wrapmode
  (** Returns line wrap mode used by the label.

      See [Gtk.Label.set_wrap_mode]. *)

  method get_xalign : unit -> float
  (** Gets the [xalign] of the label.

      See the [Gtk.Label:xalign] property. *)

  method get_yalign : unit -> float
  (** Gets the [yalign] of the label.

      See the [Gtk.Label:yalign] property. *)

  method select_region : int -> int -> unit
  (** Selects a range of characters in the label, if the label is selectable.

      See [Gtk.Label.set_selectable]. If the label is not selectable, this
      function has no effect. If [start_offset] or [end_offset] are -1, then the
      end of the label will be substituted. *)

  method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit
  (** Apply attributes to the label text.

      The attributes set with this function will be applied and merged with any
      other attributes previously effected by way of the
      [Gtk.Label:use-underline] or [Gtk.Label:use-markup] properties

      While it is not recommended to mix markup strings with manually set
      attributes, if you must; know that the attributes will be applied to the
      label after the markup string is parsed. *)

  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  (** Sets the mode used to ellipsize the text.

      The text will be ellipsized if there is not enough space to render the
      entire string. *)

  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets a menu model to add to the context menu of the label. *)

  method set_justify : Enums.justification -> unit
  (** Sets the alignment of lines in the label relative to each other.

      This function has no effect on labels containing only a single line.

      [Gtk.Justification.left] is the default value when the widget is first
      created with [Gtk.Label.new].

      If you instead want to set the alignment of the label as a whole, use
      [Gtk.Widget.set_halign] instead. *)

  method set_label : string -> unit
  (** Sets the text of the label.

      The label is interpreted as including embedded underlines and/or Pango
      markup depending on the values of the [Gtk.Label:use-underline] and
      [Gtk.Label:use-markup] properties. *)

  method set_lines : int -> unit
  (** Sets the number of lines to which an ellipsized, wrapping label should be
      limited.

      This has no effect if the label is not wrapping or ellipsized. Set this to
      -1 if you don’t want to limit the number of lines. *)

  method set_markup : string -> unit
  [@@ocaml.doc
    "Sets the labels text and attributes from markup.\n\n\
     The string must be marked up with Pango markup\n\
     (see [Pango.parse_markup]).\n\n\
     If [str] is external data, you may need to escape it\n\
     with [GLib.markup_escape_text] or [GLib.markup_printf_escaped]:\n\n\
     {[\n\
     GtkWidget *self = gtk_label_new (NULL);\n\
     const char *str = \"...\";\n\
     const char *format = \"<span style=\\\"italic\\\">\\%s</span>\";\n\
     char *markup;\n\n\
     markup = g_markup_printf_escaped (format, str);\n\
     gtk_label_set_markup (GTK_LABEL (self), markup);\n\
     g_free (markup);\n\
     ]}\n\n\
     This function sets the [Gtk.Label:use-markup] property\n\
     to true.\n\n\
     Also see [Gtk.Label.set_text]."]

  method set_markup_with_mnemonic : string -> unit
  (** Sets the labels text, attributes and mnemonic from markup.

      Parses [str] which is marked up with Pango markup (see
      [Pango.parse_markup]), setting the label’s text and attribute list based
      on the parse results. If characters in [str] are preceded by an
      underscore, they are underlined indicating that they represent a keyboard
      accelerator called a mnemonic.

      The mnemonic key can be used to activate another widget, chosen
      automatically, or explicitly using [Gtk.Label.set_mnemonic_widget]. *)

  method set_max_width_chars : int -> unit
  (** Sets the maximum width of the label in characters. *)

  method set_mnemonic_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Associate the label with its mnemonic target.

      If the label has been set so that it has a mnemonic key (using i.e.
      [Gtk.Label.set_markup_with_mnemonic], [Gtk.Label.set_text_with_mnemonic],
      [Gtk.Label.new_with_mnemonic] or the [Gtk.Label:use_underline] property)
      the label can be associated with a widget that is the target of the
      mnemonic. When the label is inside a widget (like a [Gtk.Button] or a
      [Gtk.Notebook] tab) it is automatically associated with the correct
      widget, but sometimes (i.e. when the target is a [Gtk.Entry] next to the
      label) you need to set it explicitly using this function.

      The target widget will be accelerated by emitting the
      [Gtk.Widget::mnemonic-activate] signal on it. The default handler for this
      signal will activate the widget if there are no mnemonic collisions and
      toggle focus between the colliding widgets otherwise. *)

  method set_natural_wrap_mode : Enums.naturalwrapmode -> unit
  (** Selects the line wrapping for the natural size request.

      This only affects the natural size requested, for the actual wrapping
      used, see the [Gtk.Label:wrap-mode] property. *)

  method set_selectable : bool -> unit
  (** Makes text in the label selectable.

      Selectable labels allow the user to select text from the label, for
      copy-and-paste. *)

  method set_single_line_mode : bool -> unit
  (** Sets whether the label is in single line mode. *)

  method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit
  (** Sets tab stops for the label. *)

  method set_text : string -> unit
  (** Sets the text for the label.

      It overwrites any text that was there before and clears any previously set
      mnemonic accelerators, and sets the [Gtk.Label:use-underline] and
      [Gtk.Label:use-markup] properties to false.

      Also see [Gtk.Label.set_markup]. *)

  method set_text_with_mnemonic : string -> unit
  (** Sets the text for the label, with mnemonics.

      If characters in [str] are preceded by an underscore, they are underlined
      indicating that they represent a keyboard accelerator called a mnemonic.
      The mnemonic key can be used to activate another widget, chosen
      automatically, or explicitly using [Gtk.Label.set_mnemonic_widget]. *)

  method set_use_markup : bool -> unit
  (** Sets whether the text of the label contains markup.

      See [Gtk.Label.set_markup]. *)

  method set_use_underline : bool -> unit
  (** Sets whether underlines in the text indicate mnemonics. *)

  method set_width_chars : int -> unit
  (** Sets the desired width in characters of the label. *)

  method set_wrap : bool -> unit
  (** Toggles line wrapping within the label.

      True makes it break lines if text exceeds the widget’s size. false lets
      the text get cut off by the edge of the widget if it exceeds the widget
      size.

      Note that setting line wrapping to true does not make the label wrap at
      its parent widget’s width, because GTK widgets conceptually can’t make
      their requisition depend on the parent widget’s size. For a label that
      wraps at a specific position, set the label’s width using
      [Gtk.Widget.set_size_request]. *)

  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  (** Controls how line wrapping is done.

      This only affects the label if line wrapping is on. (See
      [Gtk.Label.set_wrap])

      The default is [Pango.WrapMode.word], which means wrap on word boundaries.

      For sizing behavior, also consider the [Gtk.Label:natural-wrap-mode]
      property. *)

  method set_xalign : float -> unit
  (** Sets the [xalign] of the label.

      See the [Gtk.Label:xalign] property. *)

  method set_yalign : float -> unit
  (** Sets the [yalign] of the label.

      See the [Gtk.Label:yalign] property. *)

  method as_label : Raw.Label.t
end

class label : Raw.Label.t -> label_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Label.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkLabel], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : string option -> label_t
(** Creates a new label with the given text inside it.

    You can pass [NULL] to get an empty label widget. *)

val new_with_mnemonic : string option -> label_t
(** Creates a new label with the given text inside it, and a mnemonic.

    If characters in [str] are preceded by an underscore, they are underlined.
    If you need a literal underscore character in a label, use '__' (two
    underscores). The first underlined character represents a keyboard
    accelerator called a mnemonic. The mnemonic key can be used to activate
    another widget, chosen automatically, or explicitly using
    [Gtk.Label.set_mnemonic_widget].

    If [Gtk.Label.set_mnemonic_widget] is not called, then the first activatable
    ancestor of the label will be chosen as the mnemonic widget. For instance,
    if the label is inside a button or menu item, the button or menu item will
    automatically become the mnemonic widget and be activated by the mnemonic.
*)
