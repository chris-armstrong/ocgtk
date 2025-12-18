(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Text *)

type t = [`text | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Text *)
external new_ : unit -> t = "ml_gtk_text_new"

(** Create a new Text *)
external new_with_buffer : Entry_buffer.t -> t = "ml_gtk_text_new_with_buffer"

(* Properties *)

(** Get property: activates-default *)
external get_activates_default : t -> bool = "ml_gtk_text_get_activates_default"

(** Set property: activates-default *)
external set_activates_default : t -> bool -> unit = "ml_gtk_text_set_activates_default"

(** Get property: enable-emoji-completion *)
external get_enable_emoji_completion : t -> bool = "ml_gtk_text_get_enable_emoji_completion"

(** Set property: enable-emoji-completion *)
external set_enable_emoji_completion : t -> bool -> unit = "ml_gtk_text_set_enable_emoji_completion"

(** Get property: im-module *)
external get_im_module : t -> string = "ml_gtk_text_get_im_module"

(** Set property: im-module *)
external set_im_module : t -> string -> unit = "ml_gtk_text_set_im_module"

(** Get property: invisible-char *)
external get_invisible_char : t -> int = "ml_gtk_text_get_invisible_char"

(** Set property: invisible-char *)
external set_invisible_char : t -> int -> unit = "ml_gtk_text_set_invisible_char"

(** Get property: invisible-char-set *)
external get_invisible_char_set : t -> bool = "ml_gtk_text_get_invisible_char_set"

(** Set property: invisible-char-set *)
external set_invisible_char_set : t -> bool -> unit = "ml_gtk_text_set_invisible_char_set"

(** Get property: max-length *)
external get_max_length : t -> int = "ml_gtk_text_get_max_length"

(** Set property: max-length *)
external set_max_length : t -> int -> unit = "ml_gtk_text_set_max_length"

(** Get property: overwrite-mode *)
external get_overwrite_mode : t -> bool = "ml_gtk_text_get_overwrite_mode"

(** Set property: overwrite-mode *)
external set_overwrite_mode : t -> bool -> unit = "ml_gtk_text_set_overwrite_mode"

(** Get property: placeholder-text *)
external get_placeholder_text : t -> string = "ml_gtk_text_get_placeholder_text"

(** Set property: placeholder-text *)
external set_placeholder_text : t -> string -> unit = "ml_gtk_text_set_placeholder_text"

(** Get property: propagate-text-width *)
external get_propagate_text_width : t -> bool = "ml_gtk_text_get_propagate_text_width"

(** Set property: propagate-text-width *)
external set_propagate_text_width : t -> bool -> unit = "ml_gtk_text_set_propagate_text_width"

(** Get property: scroll-offset *)
external get_scroll_offset : t -> int = "ml_gtk_text_get_scroll_offset"

(** Get property: truncate-multiline *)
external get_truncate_multiline : t -> bool = "ml_gtk_text_get_truncate_multiline"

(** Set property: truncate-multiline *)
external set_truncate_multiline : t -> bool -> unit = "ml_gtk_text_set_truncate_multiline"

(** Get property: visibility *)
external get_visibility : t -> bool = "ml_gtk_text_get_visibility"

(** Set property: visibility *)
external set_visibility : t -> bool -> unit = "ml_gtk_text_set_visibility"

(** Unsets the invisible char.

After calling this, the default invisible
char is used again. *)
external unset_invisible_char : t -> unit = "ml_gtk_text_unset_invisible_char"

(** Sets the input purpose of the `GtkText`.

This can be used by on-screen keyboards and other
input methods to adjust their behaviour. *)
external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_text_set_input_purpose"

(** Sets input hints that allow input methods
to fine-tune their behaviour. *)
external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_text_set_input_hints"

(** Set the `GtkEntryBuffer` object which holds the text for
this widget. *)
external set_buffer : t -> Entry_buffer.t -> unit = "ml_gtk_text_set_buffer"

(** Causes @self to have keyboard focus.

It behaves like [method@Gtk.Widget.grab_focus],
except that it doesn't select the contents of @self.
You only want to call this on some special entries
which the user usually doesn't want to replace all text in,
such as search-as-you-type entries. *)
external grab_focus_without_selecting : t -> bool = "ml_gtk_text_grab_focus_without_selecting"

(** Gets the input purpose of the `GtkText`. *)
external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_text_get_input_purpose"

(** Gets the input hints of the `GtkText`. *)
external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_text_get_input_hints"

(** Get the `GtkEntryBuffer` object which holds the text for
this widget. *)
external get_buffer : t -> Entry_buffer.t = "ml_gtk_text_get_buffer"

