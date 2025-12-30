(* GENERATED CODE - DO NOT EDIT *)
(* ColorDialog: ColorDialog *)

type t = [`color_dialog | `object_] Gobject.obj

(** Create a new ColorDialog *)
external new_ : unit -> t = "ml_gtk_color_dialog_new"

(* Methods *)
(** Sets whether colors may have alpha. *)
external set_with_alpha : t -> bool -> unit = "ml_gtk_color_dialog_set_with_alpha"

(** Sets the title that will be shown on the
color chooser dialog. *)
external set_title : t -> string -> unit = "ml_gtk_color_dialog_set_title"

(** Sets whether the color chooser dialog
blocks interaction with the parent window
while it is presented. *)
external set_modal : t -> bool -> unit = "ml_gtk_color_dialog_set_modal"

(** Returns whether colors may have alpha. *)
external get_with_alpha : t -> bool = "ml_gtk_color_dialog_get_with_alpha"

(** Returns the title that will be shown on the
color chooser dialog. *)
external get_title : t -> string = "ml_gtk_color_dialog_get_title"

(** Returns whether the color chooser dialog
blocks interaction with the parent window
while it is presented. *)
external get_modal : t -> bool = "ml_gtk_color_dialog_get_modal"

(* Properties *)

