(* GENERATED CODE - DO NOT EDIT *)
(* PrintDialog: PrintDialog *)

type t = [`print_dialog | `object_] Gobject.obj

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

