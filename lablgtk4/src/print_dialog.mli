(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PrintDialog *)

type t = Gtk.Widget.t

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

external setup_finish : t -> unit -> (Gtk.Widget.t, GError.t) result = "ml_gtk_print_dialog_setup_finish"

external setup : t -> Gtk.Widget.t option -> unit -> unit -> unit -> unit = "ml_gtk_print_dialog_setup"

external set_print_settings : t -> Gtk.Widget.t -> unit = "ml_gtk_print_dialog_set_print_settings"

external set_page_setup : t -> Gtk.Widget.t -> unit = "ml_gtk_print_dialog_set_page_setup"

external print_file_finish : t -> unit -> (bool, GError.t) result = "ml_gtk_print_dialog_print_file_finish"

external print_file : t -> Gtk.Widget.t option -> Gtk.Widget.t option -> unit -> unit -> unit -> unit -> unit = "ml_gtk_print_dialog_print_file_bytecode" "ml_gtk_print_dialog_print_file_native"

external print : t -> Gtk.Widget.t option -> Gtk.Widget.t option -> unit -> unit -> unit -> unit = "ml_gtk_print_dialog_print_bytecode" "ml_gtk_print_dialog_print_native"

external get_print_settings : t -> Gtk.Widget.t = "ml_gtk_print_dialog_get_print_settings"

external get_page_setup : t -> Gtk.Widget.t = "ml_gtk_print_dialog_get_page_setup"

