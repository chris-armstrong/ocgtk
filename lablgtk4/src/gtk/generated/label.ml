(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Label *)

type t = [`label | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new Label *)
external new_ : string option -> t = "ml_gtk_label_new"

(** Create a new Label *)
external new_with_mnemonic : string option -> t = "ml_gtk_label_new_with_mnemonic"

(* Properties *)

(** Get property: label *)
external get_label : t -> string = "ml_gtk_label_get_label"

(** Set property: label *)
external set_label : t -> string -> unit = "ml_gtk_label_set_label"

(** Get property: lines *)
external get_lines : t -> int = "ml_gtk_label_get_lines"

(** Set property: lines *)
external set_lines : t -> int -> unit = "ml_gtk_label_set_lines"

(** Get property: max-width-chars *)
external get_max_width_chars : t -> int = "ml_gtk_label_get_max_width_chars"

(** Set property: max-width-chars *)
external set_max_width_chars : t -> int -> unit = "ml_gtk_label_set_max_width_chars"

(** Get property: mnemonic-keyval *)
external get_mnemonic_keyval : t -> int = "ml_gtk_label_get_mnemonic_keyval"

(** Get property: selectable *)
external get_selectable : t -> bool = "ml_gtk_label_get_selectable"

(** Set property: selectable *)
external set_selectable : t -> bool -> unit = "ml_gtk_label_set_selectable"

(** Get property: single-line-mode *)
external get_single_line_mode : t -> bool = "ml_gtk_label_get_single_line_mode"

(** Set property: single-line-mode *)
external set_single_line_mode : t -> bool -> unit = "ml_gtk_label_set_single_line_mode"

(** Get property: use-markup *)
external get_use_markup : t -> bool = "ml_gtk_label_get_use_markup"

(** Set property: use-markup *)
external set_use_markup : t -> bool -> unit = "ml_gtk_label_set_use_markup"

(** Get property: use-underline *)
external get_use_underline : t -> bool = "ml_gtk_label_get_use_underline"

(** Set property: use-underline *)
external set_use_underline : t -> bool -> unit = "ml_gtk_label_set_use_underline"

(** Get property: width-chars *)
external get_width_chars : t -> int = "ml_gtk_label_get_width_chars"

(** Set property: width-chars *)
external set_width_chars : t -> int -> unit = "ml_gtk_label_set_width_chars"

(** Get property: wrap *)
external get_wrap : t -> bool = "ml_gtk_label_get_wrap"

(** Set property: wrap *)
external set_wrap : t -> bool -> unit = "ml_gtk_label_set_wrap"

(** Get property: xalign *)
external get_xalign : t -> float = "ml_gtk_label_get_xalign"

(** Set property: xalign *)
external set_xalign : t -> float -> unit = "ml_gtk_label_set_xalign"

(** Get property: yalign *)
external get_yalign : t -> float = "ml_gtk_label_get_yalign"

(** Set property: yalign *)
external set_yalign : t -> float -> unit = "ml_gtk_label_set_yalign"

(** Controls how line wrapping is done.

This only affects the label if line wrapping is on. (See
[method@Gtk.Label.set_wrap]) The default is %PANGO_WRAP_WORD
which means wrap on word boundaries.

For sizing behavior, also consider the [property@Gtk.Label:natural-wrap-mode]
property. *)
external set_wrap_mode : t -> Pango.wrapmode -> unit = "ml_gtk_label_set_wrap_mode"

(** Sets the label’s text from the string @str.

If characters in @str are preceded by an underscore, they are underlined
indicating that they represent a keyboard accelerator called a mnemonic.
The mnemonic key can be used to activate another widget, chosen
automatically, or explicitly using [method@Gtk.Label.set_mnemonic_widget]. *)
external set_text_with_mnemonic : t -> string -> unit = "ml_gtk_label_set_text_with_mnemonic"

(** Sets the text within the `GtkLabel` widget.

It overwrites any text that was there before.

This function will clear any previously set mnemonic accelerators,
and set the [property@Gtk.Label:use-underline] property to %FALSE as
a side effect.

This function will set the [property@Gtk.Label:use-markup] property
to %FALSE as a side effect.

See also: [method@Gtk.Label.set_markup] *)
external set_text : t -> string -> unit = "ml_gtk_label_set_text"

(** Select the line wrapping for the natural size request.

This only affects the natural size requested, for the actual wrapping used,
see the [property@Gtk.Label:wrap-mode] property. *)
external set_natural_wrap_mode : t -> Gtk_enums.naturalwrapmode -> unit = "ml_gtk_label_set_natural_wrap_mode"

(** Associate the label with its mnemonic target.

If the label has been set so that it has a mnemonic key (using
i.e. [method@Gtk.Label.set_markup_with_mnemonic],
[method@Gtk.Label.set_text_with_mnemonic],
[ctor@Gtk.Label.new_with_mnemonic]
or the [property@Gtk.Label:use_underline] property) the label can be
associated with a widget that is the target of the mnemonic. When the
label is inside a widget (like a [class@Gtk.Button] or a
[class@Gtk.Notebook] tab) it is automatically associated with the correct
widget, but sometimes (i.e. when the target is a [class@Gtk.Entry] next to
the label) you need to set it explicitly using this function.

The target widget will be accelerated by emitting the
[signal@Gtk.Widget::mnemonic-activate] signal on it. The default handler for
this signal will activate the widget if there are no mnemonic collisions
and toggle focus between the colliding widgets otherwise. *)
external set_mnemonic_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_label_set_mnemonic_widget"

(** Sets the labels text, attributes and mnemonic from markup.

Parses @str which is marked up with Pango markup (see [func@Pango.parse_markup]),
setting the label’s text and attribute list based on the parse results.
If characters in @str are preceded by an underscore, they are underlined
indicating that they represent a keyboard accelerator called a mnemonic.

The mnemonic key can be used to activate another widget, chosen
automatically, or explicitly using [method@Gtk.Label.set_mnemonic_widget]. *)
external set_markup_with_mnemonic : t -> string -> unit = "ml_gtk_label_set_markup_with_mnemonic"

(** Sets the labels text and attributes from markup.

The string must be marked up with Pango markup
(see [func@Pango.parse_markup]).

If the @str is external data, you may need to escape it
with g_markup_escape_text() or g_markup_printf_escaped():

```c
GtkWidget *self = gtk_label_new (NULL);
const char *str = "...";
const char *format = "<span style=\"italic\">\%s</span>";
char *markup;

markup = g_markup_printf_escaped (format, str);
gtk_label_set_markup (GTK_LABEL (self), markup);
g_free (markup);
```

This function will set the [property@Gtk.Label:use-markup] property
to %TRUE as a side effect.

If you set the label contents using the [property@Gtk.Label:label]
property you should also ensure that you set the
[property@Gtk.Label:use-markup] property accordingly.

See also: [method@Gtk.Label.set_text] *)
external set_markup : t -> string -> unit = "ml_gtk_label_set_markup"

(** Sets the alignment of the lines in the text of the label relative to
each other.

%GTK_JUSTIFY_LEFT is the default value when the widget is first created
with [ctor@Gtk.Label.new]. If you instead want to set the alignment of
the label as a whole, use [method@Gtk.Widget.set_halign] instead.
[method@Gtk.Label.set_justify] has no effect on labels containing
only a single line. *)
external set_justify : t -> Gtk_enums.justification -> unit = "ml_gtk_label_set_justify"

(** Sets the mode used to ellipsize the text.

The text will be ellipsized if there is not enough space
to render the entire string. *)
external set_ellipsize : t -> Pango.ellipsizemode -> unit = "ml_gtk_label_set_ellipsize"

(** Selects a range of characters in the label, if the label is selectable.

See [method@Gtk.Label.set_selectable]. If the label is not selectable,
this function has no effect. If @start_offset or
@end_offset are -1, then the end of the label will be substituted. *)
external select_region : t -> int -> int -> unit = "ml_gtk_label_select_region"

(** Returns line wrap mode used by the label.

See [method@Gtk.Label.set_wrap_mode]. *)
external get_wrap_mode : t -> Pango.wrapmode = "ml_gtk_label_get_wrap_mode"

(** Fetches the text from a label.

The returned text is as it appears on screen. This does not include
any embedded underlines indicating mnemonics or Pango markup. (See
[method@Gtk.Label.get_label]) *)
external get_text : t -> string = "ml_gtk_label_get_text"

(** Returns line wrap mode used by the label.

See [method@Gtk.Label.set_natural_wrap_mode]. *)
external get_natural_wrap_mode : t -> Gtk_enums.naturalwrapmode = "ml_gtk_label_get_natural_wrap_mode"

(** Retrieves the target of the mnemonic (keyboard shortcut) of this
label.

See [method@Gtk.Label.set_mnemonic_widget]. *)
external get_mnemonic_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_label_get_mnemonic_widget"

(** Returns the justification of the label.

See [method@Gtk.Label.set_justify]. *)
external get_justify : t -> Gtk_enums.justification = "ml_gtk_label_get_justify"

(** Returns the ellipsizing position of the label.

See [method@Gtk.Label.set_ellipsize]. *)
external get_ellipsize : t -> Pango.ellipsizemode = "ml_gtk_label_get_ellipsize"

(** Returns the URI for the currently active link in the label.

The active link is the one under the mouse pointer or, in a
selectable label, the link in which the text cursor is currently
positioned.

This function is intended for use in a [signal@Gtk.Label::activate-link]
handler or for use in a [signal@Gtk.Widget::query-tooltip] handler. *)
external get_current_uri : t -> string option = "ml_gtk_label_get_current_uri"

