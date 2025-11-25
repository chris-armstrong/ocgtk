(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Label *)

type t = [`label | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new Label *)
external new_ : string option -> t = "ml_gtk_label_new"

(** Create a new Label *)
external new_with_mnemonic : string option -> t = "ml_gtk_label_new_with_mnemonic"

(* Properties *)

(** Sets the `yalign` of the label.

See the [property@Gtk.Label:yalign] property. *)
external set_yalign : t -> float -> unit = "ml_gtk_label_set_yalign"

(** Sets the `xalign` of the label.

See the [property@Gtk.Label:xalign] property. *)
external set_xalign : t -> float -> unit = "ml_gtk_label_set_xalign"

(** Controls how line wrapping is done.

This only affects the label if line wrapping is on. (See
[method@Gtk.Label.set_wrap]) The default is %PANGO_WRAP_WORD
which means wrap on word boundaries.

For sizing behavior, also consider the [property@Gtk.Label:natural-wrap-mode]
property. *)
external set_wrap_mode : t -> Pango.wrapmode -> unit = "ml_gtk_label_set_wrap_mode"

(** Toggles line wrapping within the `GtkLabel` widget.

%TRUE makes it break lines if text exceeds the widget’s size.
%FALSE lets the text get cut off by the edge of the widget if
it exceeds the widget size.

Note that setting line wrapping to %TRUE does not make the label
wrap at its parent container’s width, because GTK widgets
conceptually can’t make their requisition depend on the parent
container’s size. For a label that wraps at a specific position,
set the label’s width using [method@Gtk.Widget.set_size_request]. *)
external set_wrap : t -> bool -> unit = "ml_gtk_label_set_wrap"

(** Sets the desired width in characters of @label to @n_chars. *)
external set_width_chars : t -> int -> unit = "ml_gtk_label_set_width_chars"

(** Sets whether underlines in the text indicate mnemonics. *)
external set_use_underline : t -> bool -> unit = "ml_gtk_label_set_use_underline"

(** Sets whether the text of the label contains markup.

See [method@Gtk.Label.set_markup]. *)
external set_use_markup : t -> bool -> unit = "ml_gtk_label_set_use_markup"

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

(** Sets whether the label is in single line mode. *)
external set_single_line_mode : t -> bool -> unit = "ml_gtk_label_set_single_line_mode"

(** Makes text in the label selectable.

Selectable labels allow the user to select text from the label,
for copy-and-paste. *)
external set_selectable : t -> bool -> unit = "ml_gtk_label_set_selectable"

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
external set_mnemonic_widget : t -> Gtk.widget option -> unit = "ml_gtk_label_set_mnemonic_widget"

(** Sets the desired maximum width in characters of @label to @n_chars. *)
external set_max_width_chars : t -> int -> unit = "ml_gtk_label_set_max_width_chars"

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

(** Sets the number of lines to which an ellipsized, wrapping label
should be limited.

This has no effect if the label is not wrapping or ellipsized.
Set this to -1 if you don’t want to limit the number of lines. *)
external set_lines : t -> int -> unit = "ml_gtk_label_set_lines"

(** Sets the text of the label.

The label is interpreted as including embedded underlines and/or Pango
markup depending on the values of the [property@Gtk.Label:use-underline]
and [property@Gtk.Label:use-markup] properties. *)
external set_label : t -> string -> unit = "ml_gtk_label_set_label"

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

(** Gets the `yalign` of the label.

See the [property@Gtk.Label:yalign] property. *)
external get_yalign : t -> float = "ml_gtk_label_get_yalign"

(** Gets the `xalign` of the label.

See the [property@Gtk.Label:xalign] property. *)
external get_xalign : t -> float = "ml_gtk_label_get_xalign"

(** Returns line wrap mode used by the label.

See [method@Gtk.Label.set_wrap_mode]. *)
external get_wrap_mode : t -> Pango.wrapmode = "ml_gtk_label_get_wrap_mode"

(** Returns whether lines in the label are automatically wrapped.

See [method@Gtk.Label.set_wrap]. *)
external get_wrap : t -> bool = "ml_gtk_label_get_wrap"

(** Retrieves the desired width of @label, in characters.

See [method@Gtk.Label.set_width_chars]. *)
external get_width_chars : t -> int = "ml_gtk_label_get_width_chars"

(** Returns whether an embedded underlines in the label indicate mnemonics.

See [method@Gtk.Label.set_use_underline]. *)
external get_use_underline : t -> bool = "ml_gtk_label_get_use_underline"

(** Returns whether the label’s text is interpreted as Pango markup.

See [method@Gtk.Label.set_use_markup]. *)
external get_use_markup : t -> bool = "ml_gtk_label_get_use_markup"

(** Fetches the text from a label.

The returned text is as it appears on screen. This does not include
any embedded underlines indicating mnemonics or Pango markup. (See
[method@Gtk.Label.get_label]) *)
external get_text : t -> string = "ml_gtk_label_get_text"

(** Returns whether the label is in single line mode. *)
external get_single_line_mode : t -> bool = "ml_gtk_label_get_single_line_mode"

(** Returns whether the label is selectable. *)
external get_selectable : t -> bool = "ml_gtk_label_get_selectable"

(** Returns line wrap mode used by the label.

See [method@Gtk.Label.set_natural_wrap_mode]. *)
external get_natural_wrap_mode : t -> Gtk_enums.naturalwrapmode = "ml_gtk_label_get_natural_wrap_mode"

(** Retrieves the target of the mnemonic (keyboard shortcut) of this
label.

See [method@Gtk.Label.set_mnemonic_widget]. *)
external get_mnemonic_widget : t -> Gtk.widget option = "ml_gtk_label_get_mnemonic_widget"

(** Return the mnemonic accelerator.

If the label has been set so that it has a mnemonic key this function
returns the keyval used for the mnemonic accelerator. If there is no
mnemonic set up it returns `GDK_KEY_VoidSymbol`. *)
external get_mnemonic_keyval : t -> int = "ml_gtk_label_get_mnemonic_keyval"

(** Retrieves the desired maximum width of @label, in characters.

See [method@Gtk.Label.set_width_chars]. *)
external get_max_width_chars : t -> int = "ml_gtk_label_get_max_width_chars"

(** Gets the number of lines to which an ellipsized, wrapping
label should be limited.

See [method@Gtk.Label.set_lines]. *)
external get_lines : t -> int = "ml_gtk_label_get_lines"

(** Fetches the text from a label.

The returned text includes any embedded underlines indicating
mnemonics and Pango markup. (See [method@Gtk.Label.get_text]). *)
external get_label : t -> string = "ml_gtk_label_get_label"

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

