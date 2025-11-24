(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FileDialog *)

type t = Gtk.widget

(** Create a new FileDialog *)
external new_ : unit -> t = "ml_gtk_file_dialog_new"

(* Properties *)

(** Get property: accept-label *)
external get_accept_label : t -> string = "ml_gtk_file_dialog_get_accept_label"

(** Set property: accept-label *)
external set_accept_label : t -> string -> unit = "ml_gtk_file_dialog_set_accept_label"

(** Get property: initial-name *)
external get_initial_name : t -> string = "ml_gtk_file_dialog_get_initial_name"

(** Set property: initial-name *)
external set_initial_name : t -> string -> unit = "ml_gtk_file_dialog_set_initial_name"

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_file_dialog_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_file_dialog_set_modal"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_file_dialog_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_file_dialog_set_title"

external set_default_filter : t -> Gtk.widget option -> unit = "ml_gtk_file_dialog_set_default_filter"

external get_default_filter : t -> Gtk.widget = "ml_gtk_file_dialog_get_default_filter"

