(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Text *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_text_new"

external new_with_buffer : Gtk.Widget.t -> t = "ml_gtk_text_new_with_buffer"

(* Properties *)

external get_activates_default : t -> bool = "ml_gtk_text_get_activates_default"

external set_activates_default : t -> bool -> unit = "ml_gtk_text_set_activates_default"

external get_enable_emoji_completion : t -> bool = "ml_gtk_text_get_enable_emoji_completion"

external set_enable_emoji_completion : t -> bool -> unit = "ml_gtk_text_set_enable_emoji_completion"

external get_im_module : t -> string = "ml_gtk_text_get_im_module"

external set_im_module : t -> string -> unit = "ml_gtk_text_set_im_module"

external get_invisible_char : t -> int = "ml_gtk_text_get_invisible_char"

external set_invisible_char : t -> int -> unit = "ml_gtk_text_set_invisible_char"

external get_invisible_char_set : t -> bool = "ml_gtk_text_get_invisible_char_set"

external set_invisible_char_set : t -> bool -> unit = "ml_gtk_text_set_invisible_char_set"

external get_max_length : t -> int = "ml_gtk_text_get_max_length"

external set_max_length : t -> int -> unit = "ml_gtk_text_set_max_length"

external get_overwrite_mode : t -> bool = "ml_gtk_text_get_overwrite_mode"

external set_overwrite_mode : t -> bool -> unit = "ml_gtk_text_set_overwrite_mode"

external get_placeholder_text : t -> string = "ml_gtk_text_get_placeholder_text"

external set_placeholder_text : t -> string -> unit = "ml_gtk_text_set_placeholder_text"

external get_propagate_text_width : t -> bool = "ml_gtk_text_get_propagate_text_width"

external set_propagate_text_width : t -> bool -> unit = "ml_gtk_text_set_propagate_text_width"

external get_scroll_offset : t -> int = "ml_gtk_text_get_scroll_offset"

external get_truncate_multiline : t -> bool = "ml_gtk_text_get_truncate_multiline"

external set_truncate_multiline : t -> bool -> unit = "ml_gtk_text_set_truncate_multiline"

external get_visibility : t -> bool = "ml_gtk_text_get_visibility"

external set_visibility : t -> bool -> unit = "ml_gtk_text_set_visibility"

external unset_invisible_char : t -> unit = "ml_gtk_text_unset_invisible_char"

external set_input_purpose : t -> Gtk_enums.inputpurpose -> unit = "ml_gtk_text_set_input_purpose"

external set_input_hints : t -> Gtk_enums.inputhints -> unit = "ml_gtk_text_set_input_hints"

external set_buffer : t -> Gtk.Widget.t -> unit = "ml_gtk_text_set_buffer"

external grab_focus_without_selecting : t -> bool = "ml_gtk_text_grab_focus_without_selecting"

external get_input_purpose : t -> Gtk_enums.inputpurpose = "ml_gtk_text_get_input_purpose"

external get_input_hints : t -> Gtk_enums.inputhints = "ml_gtk_text_get_input_hints"

external get_buffer : t -> Gtk.Widget.t = "ml_gtk_text_get_buffer"

