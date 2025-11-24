(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontDialog *)

type t = Gtk.widget

(** Create a new FontDialog *)
external new_ : unit -> t = "ml_gtk_font_dialog_new"

(* Properties *)

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_font_dialog_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_font_dialog_set_modal"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_font_dialog_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_font_dialog_set_title"

external set_filter : t -> Gtk.widget option -> unit = "ml_gtk_font_dialog_set_filter"

external get_filter : t -> Gtk.widget = "ml_gtk_font_dialog_get_filter"

