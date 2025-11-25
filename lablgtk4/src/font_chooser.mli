(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontChooser *)

type t = Gtk.widget

(* Properties *)

(** Shows or hides the editable preview entry. *)
external set_show_preview_entry : t -> bool -> unit = "ml_gtk_font_chooser_set_show_preview_entry"

(** Sets the text displayed in the preview area.

The @text is used to show how the selected font looks. *)
external set_preview_text : t -> string -> unit = "ml_gtk_font_chooser_set_preview_text"

(** Sets the desired level of granularity for selecting fonts. *)
external set_level : t -> Gtk_enums.fontchooserlevel -> unit = "ml_gtk_font_chooser_set_level"

(** Sets the language to use for font features. *)
external set_language : t -> string -> unit = "ml_gtk_font_chooser_set_language"

(** Sets the currently-selected font. *)
external set_font : t -> string -> unit = "ml_gtk_font_chooser_set_font"

(** Returns whether the preview entry is shown or not. *)
external get_show_preview_entry : t -> bool = "ml_gtk_font_chooser_get_show_preview_entry"

(** Returns the current level of granularity for selecting fonts. *)
external get_level : t -> Gtk_enums.fontchooserlevel = "ml_gtk_font_chooser_get_level"

(** The selected font size. *)
external get_font_size : t -> int = "ml_gtk_font_chooser_get_font_size"

