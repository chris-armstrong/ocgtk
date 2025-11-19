(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontChooser *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: show-preview-entry *)
external get_show_preview_entry : t -> bool = "ml_gtk_font_chooser_get_show_preview_entry"

(** Set property: show-preview-entry *)
external set_show_preview_entry : t -> bool -> unit = "ml_gtk_font_chooser_set_show_preview_entry"

external set_preview_text : t -> string -> unit = "ml_gtk_font_chooser_set_preview_text"

external set_level : t -> fontchooserlevel -> unit = "ml_gtk_font_chooser_set_level"

external set_language : t -> string -> unit = "ml_gtk_font_chooser_set_language"

external set_font_map : t -> unit -> unit = "ml_gtk_font_chooser_set_font_map"

external set_font_desc : t -> unit -> unit = "ml_gtk_font_chooser_set_font_desc"

external set_font : t -> string -> unit = "ml_gtk_font_chooser_set_font"

external set_filter_func : t -> unit -> unit -> unit -> unit = "ml_gtk_font_chooser_set_filter_func"

external get_preview_text : t -> string = "ml_gtk_font_chooser_get_preview_text"

external get_level : t -> fontchooserlevel = "ml_gtk_font_chooser_get_level"

external get_language : t -> string = "ml_gtk_font_chooser_get_language"

external get_font_size : t -> int = "ml_gtk_font_chooser_get_font_size"

external get_font_map : t -> unit = "ml_gtk_font_chooser_get_font_map"

external get_font_features : t -> string = "ml_gtk_font_chooser_get_font_features"

external get_font_family : t -> unit = "ml_gtk_font_chooser_get_font_family"

external get_font_face : t -> unit = "ml_gtk_font_chooser_get_font_face"

external get_font_desc : t -> unit = "ml_gtk_font_chooser_get_font_desc"

external get_font : t -> string = "ml_gtk_font_chooser_get_font"

