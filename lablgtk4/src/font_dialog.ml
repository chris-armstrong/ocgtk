(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontDialog *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_font_dialog_new"

(* Properties *)

external get_modal : t -> bool = "ml_gtk_font_dialog_get_modal"

external set_modal : t -> bool -> unit = "ml_gtk_font_dialog_set_modal"

external get_title : t -> string = "ml_gtk_font_dialog_get_title"

external set_title : t -> string -> unit = "ml_gtk_font_dialog_set_title"

external set_filter : t -> Gtk.widget option -> unit = "ml_gtk_font_dialog_set_filter"

external get_filter : t -> Gtk.widget = "ml_gtk_font_dialog_get_filter"

