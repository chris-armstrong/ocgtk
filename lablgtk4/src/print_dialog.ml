(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PrintDialog *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_print_dialog_new"

(* Properties *)

external get_accept_label : t -> string = "ml_gtk_print_dialog_get_accept_label"

external set_accept_label : t -> string -> unit = "ml_gtk_print_dialog_set_accept_label"

external get_modal : t -> bool = "ml_gtk_print_dialog_get_modal"

external set_modal : t -> bool -> unit = "ml_gtk_print_dialog_set_modal"

external get_title : t -> string = "ml_gtk_print_dialog_get_title"

external set_title : t -> string -> unit = "ml_gtk_print_dialog_set_title"

external set_print_settings : t -> Gtk.Widget.t -> unit = "ml_gtk_print_dialog_set_print_settings"

external set_page_setup : t -> Gtk.Widget.t -> unit = "ml_gtk_print_dialog_set_page_setup"

external get_print_settings : t -> Gtk.Widget.t = "ml_gtk_print_dialog_get_print_settings"

external get_page_setup : t -> Gtk.Widget.t = "ml_gtk_print_dialog_get_page_setup"

