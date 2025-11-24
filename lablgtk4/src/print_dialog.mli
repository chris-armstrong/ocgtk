(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PrintDialog *)

type t = Gtk.widget

(** Create a new PrintDialog *)
external new_ : unit -> t = "ml_gtk_print_dialog_new"

(* Properties *)

(** Get property: accept-label *)
external get_accept_label : t -> string = "ml_gtk_print_dialog_get_accept_label"

(** Set property: accept-label *)
external set_accept_label : t -> string -> unit = "ml_gtk_print_dialog_set_accept_label"

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_print_dialog_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_print_dialog_set_modal"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_print_dialog_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_print_dialog_set_title"

external set_print_settings : t -> Gtk.widget -> unit = "ml_gtk_print_dialog_set_print_settings"

external set_page_setup : t -> Gtk.widget -> unit = "ml_gtk_print_dialog_set_page_setup"

external get_print_settings : t -> Gtk.widget = "ml_gtk_print_dialog_get_print_settings"

external get_page_setup : t -> Gtk.widget = "ml_gtk_print_dialog_get_page_setup"

