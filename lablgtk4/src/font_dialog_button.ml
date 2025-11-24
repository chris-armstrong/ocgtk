(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontDialogButton *)

type t = Gtk.widget

external new_ : Gtk.widget option -> t = "ml_gtk_font_dialog_button_new"

(* Properties *)

external get_font_features : t -> string = "ml_gtk_font_dialog_button_get_font_features"

external set_font_features : t -> string -> unit = "ml_gtk_font_dialog_button_set_font_features"

external get_use_font : t -> bool = "ml_gtk_font_dialog_button_get_use_font"

external set_use_font : t -> bool -> unit = "ml_gtk_font_dialog_button_set_use_font"

external get_use_size : t -> bool = "ml_gtk_font_dialog_button_get_use_size"

external set_use_size : t -> bool -> unit = "ml_gtk_font_dialog_button_set_use_size"

external set_level : t -> Gtk_enums.fontlevel -> unit = "ml_gtk_font_dialog_button_set_level"

external set_dialog : t -> Gtk.widget -> unit = "ml_gtk_font_dialog_button_set_dialog"

external get_level : t -> Gtk_enums.fontlevel = "ml_gtk_font_dialog_button_get_level"

external get_dialog : t -> Gtk.widget = "ml_gtk_font_dialog_button_get_dialog"

