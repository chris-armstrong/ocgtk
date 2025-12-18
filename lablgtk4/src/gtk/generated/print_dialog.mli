(* GENERATED CODE - DO NOT EDIT *)
(* PrintDialog: PrintDialog *)

type t = [`print_dialog | `object_] Gobject.obj

(** Create a new PrintDialog *)
external new_ : unit -> t = "ml_gtk_print_dialog_new"

(* Properties *)

(** Sets the title that will be shown on the print dialog. *)
external set_title : t -> string -> unit = "ml_gtk_print_dialog_set_title"

(** Sets whether the print dialog blocks
interaction with the parent window while
it is presented. *)
external set_modal : t -> bool -> unit = "ml_gtk_print_dialog_set_modal"

(** Sets the label that will be shown on the
accept button of the print dialog shown for
[method@Gtk.PrintDialog.setup]. *)
external set_accept_label : t -> string -> unit = "ml_gtk_print_dialog_set_accept_label"

(** Returns the title that will be shown on the
print dialog. *)
external get_title : t -> string = "ml_gtk_print_dialog_get_title"

(** Returns whether the print dialog blocks
interaction with the parent window while
it is presented. *)
external get_modal : t -> bool = "ml_gtk_print_dialog_get_modal"

(** Returns the label that will be shown on the
accept button of the print dialog. *)
external get_accept_label : t -> string = "ml_gtk_print_dialog_get_accept_label"

