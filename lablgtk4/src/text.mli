(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Text *)

type t = [`text | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new Text *)
external new_ : unit -> t = "ml_gtk_text_new"

(** Create a new Text *)
external new_with_buffer : Gtk.widget -> t = "ml_gtk_text_new_with_buffer"

(* Properties *)

(** Unsets the invisible char.

After calling this, the default invisible
char is used again. *)
external unset_invisible_char : t -> unit = "ml_gtk_text_unset_invisible_char"

(** Sets whether the contents of the `GtkText` are visible or not.

When visibility is set to %FALSE, characters are displayed
as the invisible char, and will also appear that way when
the text in the widget is copied to the clipboard.

By default, GTK picks the best invisible character available
in the current font, but it can be changed with
[method@Gtk.Text.set_invisible_char].

Note that you probably want to set [property@Gtk.Text:input-purpose]
to %GTK_INPUT_PURPOSE_PASSWORD or %GTK_INPUT_PURPOSE_PIN to
inform input methods about the purpose of this self,
in addition to setting visibility to %FALSE. *)
external set_visibility : t -> bool -> unit = "ml_gtk_text_set_visibility"

(** Sets whether the `GtkText` should truncate multi-line text
that is pasted into the widget. *)
external set_truncate_multiline : t -> bool -> unit = "ml_gtk_text_set_truncate_multiline"

(** Sets whether the `GtkText` should grow and shrink with the content. *)
external set_propagate_text_width : t -> bool -> unit = "ml_gtk_text_set_propagate_text_width"

(** Sets text to be displayed in @self when it is empty.

This can be used to give a visual hint of the expected
contents of the `GtkText`. *)
external set_placeholder_text : t -> string option -> unit = "ml_gtk_text_set_placeholder_text"

(** Sets whether the text is overwritten when typing
in the `GtkText`. *)
external set_overwrite_mode : t -> bool -> unit = "ml_gtk_text_set_overwrite_mode"

(** Sets the maximum allowed length of the contents of the widget.

If the current contents are longer than the given length, then
they will be truncated to fit.

This is equivalent to getting @self's `GtkEntryBuffer` and
calling [method@Gtk.EntryBuffer.set_max_length] on it. *)
external set_max_length : t -> int -> unit = "ml_gtk_text_set_max_length"

(** Sets the input purpose of the `GtkText`.

This can be used by on-screen keyboards and other
input methods to adjust their behaviour. *)
external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_text_set_input_purpose"

(** Sets input hints that allow input methods
to fine-tune their behaviour. *)
external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_text_set_input_hints"

(** Sets whether Emoji completion is enabled.

If it is, typing ':', followed by a recognized keyword,
will pop up a window with suggested Emojis matching the
keyword. *)
external set_enable_emoji_completion : t -> bool -> unit = "ml_gtk_text_set_enable_emoji_completion"

(** Set the `GtkEntryBuffer` object which holds the text for
this widget. *)
external set_buffer : t -> Gtk.widget -> unit = "ml_gtk_text_set_buffer"

(** If @activates is %TRUE, pressing Enter will activate
the default widget for the window containing @self.

This usually means that the dialog containing the `GtkText`
will be closed, since the default widget is usually one of
the dialog buttons. *)
external set_activates_default : t -> bool -> unit = "ml_gtk_text_set_activates_default"

(** Causes @self to have keyboard focus.

It behaves like [method@Gtk.Widget.grab_focus],
except that it doesn't select the contents of @self.
You only want to call this on some special entries
which the user usually doesn't want to replace all text in,
such as search-as-you-type entries. *)
external grab_focus_without_selecting : t -> bool = "ml_gtk_text_grab_focus_without_selecting"

(** Retrieves whether the text in @self is visible. *)
external get_visibility : t -> bool = "ml_gtk_text_get_visibility"

(** Returns whether the `GtkText` will truncate multi-line text
that is pasted into the widget *)
external get_truncate_multiline : t -> bool = "ml_gtk_text_get_truncate_multiline"

(** Returns whether the `GtkText` will grow and shrink
with the content. *)
external get_propagate_text_width : t -> bool = "ml_gtk_text_get_propagate_text_width"

(** Retrieves the text that will be displayed when
@self is empty and unfocused

If no placeholder text has been set, %NULL will be returned. *)
external get_placeholder_text : t -> string option = "ml_gtk_text_get_placeholder_text"

(** Gets whether text is overwritten when typing in the `GtkText`.

See [method@Gtk.Text.set_overwrite_mode]. *)
external get_overwrite_mode : t -> bool = "ml_gtk_text_get_overwrite_mode"

(** Retrieves the maximum allowed length of the text in @self.

See [method@Gtk.Text.set_max_length].

This is equivalent to getting @self's `GtkEntryBuffer` and
calling [method@Gtk.EntryBuffer.get_max_length] on it. *)
external get_max_length : t -> int = "ml_gtk_text_get_max_length"

(** Gets the input purpose of the `GtkText`. *)
external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_text_get_input_purpose"

(** Gets the input hints of the `GtkText`. *)
external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_text_get_input_hints"

(** Returns whether Emoji completion is enabled for this
`GtkText` widget. *)
external get_enable_emoji_completion : t -> bool = "ml_gtk_text_get_enable_emoji_completion"

(** Get the `GtkEntryBuffer` object which holds the text for
this widget. *)
external get_buffer : t -> Gtk.widget = "ml_gtk_text_get_buffer"

(** Returns whether pressing Enter will activate
the default widget for the window containing @self.

See [method@Gtk.Text.set_activates_default]. *)
external get_activates_default : t -> bool = "ml_gtk_text_get_activates_default"

