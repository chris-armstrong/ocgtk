(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontChooser *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: font *)
external get_font : t -> string = "ml_gtk_font_chooser_get_font"

(** Set property: font *)
external set_font : t -> string -> unit = "ml_gtk_font_chooser_set_font"

(** Get property: font-features *)
external get_font_features : t -> string = "ml_gtk_font_chooser_get_font_features"

(** Get property: language *)
external get_language : t -> string = "ml_gtk_font_chooser_get_language"

(** Set property: language *)
external set_language : t -> string -> unit = "ml_gtk_font_chooser_set_language"

(** Get property: preview-text *)
external get_preview_text : t -> string = "ml_gtk_font_chooser_get_preview_text"

(** Set property: preview-text *)
external set_preview_text : t -> string -> unit = "ml_gtk_font_chooser_set_preview_text"

(** Get property: show-preview-entry *)
external get_show_preview_entry : t -> bool = "ml_gtk_font_chooser_get_show_preview_entry"

(** Set property: show-preview-entry *)
external set_show_preview_entry : t -> bool -> unit = "ml_gtk_font_chooser_set_show_preview_entry"

external set_level : t -> Gtk_enums.fontchooserlevel -> unit = "ml_gtk_font_chooser_set_level"

external get_level : t -> Gtk_enums.fontchooserlevel = "ml_gtk_font_chooser_get_level"

external get_font_size : t -> int = "ml_gtk_font_chooser_get_font_size"

