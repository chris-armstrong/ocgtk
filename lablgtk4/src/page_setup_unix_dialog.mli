(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PageSetupUnixDialog *)

type t = Gtk.Widget.t

(** Create a new PageSetupUnixDialog *)
external new_ : string option -> Gtk.Widget.t option -> t = "ml_gtk_page_setup_unix_dialog_new"

external set_print_settings : t -> Gtk.Widget.t option -> unit = "ml_gtk_page_setup_unix_dialog_set_print_settings"

external set_page_setup : t -> Gtk.Widget.t -> unit = "ml_gtk_page_setup_unix_dialog_set_page_setup"

external get_print_settings : t -> Gtk.Widget.t = "ml_gtk_page_setup_unix_dialog_get_print_settings"

external get_page_setup : t -> Gtk.Widget.t = "ml_gtk_page_setup_unix_dialog_get_page_setup"

