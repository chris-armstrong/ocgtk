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
 Its methods, signals and properties are on {!class-type-label_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Label}."]

(** The methods, signals and properties of a [GtkLabel]. *)
class type label_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_text.accessible_text_t

  method on_activate_current_link :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_activate_link :
    ?after:bool ->
    callback:(uri:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_copy_clipboard :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep -> count:int -> extend_selection:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  method get_current_uri : unit -> string option
  method get_ellipsize : unit -> Ocpango.Enums.ellipsizemode
  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  method get_justify : unit -> Enums.justification
  method get_label : unit -> string
  method get_layout : unit -> Ocpango.Layout.layout_t
  method get_lines : unit -> int
  method get_max_width_chars : unit -> int
  method get_mnemonic_keyval : unit -> int

  method get_mnemonic_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_natural_wrap_mode : unit -> Enums.naturalwrapmode
  method get_selectable : unit -> bool
  method get_single_line_mode : unit -> bool
  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  method get_text : unit -> string
  method get_use_markup : unit -> bool
  method get_use_underline : unit -> bool
  method get_width_chars : unit -> int
  method get_wrap : unit -> bool
  method get_wrap_mode : unit -> Ocpango.Enums.wrapmode
  method get_xalign : unit -> float
  method get_yalign : unit -> float
  method select_region : int -> int -> unit
  method set_attributes : Ocpango.Attr_list.attr_list_t option -> unit
  method set_ellipsize : Ocpango.Enums.ellipsizemode -> unit
  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  method set_justify : Enums.justification -> unit
  method set_label : string -> unit
  method set_lines : int -> unit
  method set_markup : string -> unit
  method set_markup_with_mnemonic : string -> unit
  method set_max_width_chars : int -> unit

  method set_mnemonic_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_natural_wrap_mode : Enums.naturalwrapmode -> unit
  method set_selectable : bool -> unit
  method set_single_line_mode : bool -> unit
  method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit
  method set_text : string -> unit
  method set_text_with_mnemonic : string -> unit
  method set_use_markup : bool -> unit
  method set_use_underline : bool -> unit
  method set_width_chars : int -> unit
  method set_wrap : bool -> unit
  method set_wrap_mode : Ocpango.Enums.wrapmode -> unit
  method set_xalign : float -> unit
  method set_yalign : float -> unit
  method as_label : Raw.Label.t
end

class label : Raw.Label.t -> label_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Label.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkLabel], give one already wrapped. *)

val new_ : string option -> label_t
val new_with_mnemonic : string option -> label_t
