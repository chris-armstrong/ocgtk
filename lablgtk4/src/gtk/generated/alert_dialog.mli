(* GENERATED CODE - DO NOT EDIT *)
(* AlertDialog: AlertDialog *)

type t = [`alert_dialog | `object_] Gobject.obj

(** Create a new AlertDialog *)
external new_ : string -> unit -> t = "ml_gtk_alert_dialog_new"

(* Properties *)

(** Get property: cancel-button *)
external get_cancel_button : t -> int = "ml_gtk_alert_dialog_get_cancel_button"

(** Set property: cancel-button *)
external set_cancel_button : t -> int -> unit = "ml_gtk_alert_dialog_set_cancel_button"

(** Get property: default-button *)
external get_default_button : t -> int = "ml_gtk_alert_dialog_get_default_button"

(** Set property: default-button *)
external set_default_button : t -> int -> unit = "ml_gtk_alert_dialog_set_default_button"

(** Get property: detail *)
external get_detail : t -> string = "ml_gtk_alert_dialog_get_detail"

(** Set property: detail *)
external set_detail : t -> string -> unit = "ml_gtk_alert_dialog_set_detail"

(** Get property: message *)
external get_message : t -> string = "ml_gtk_alert_dialog_get_message"

(** Set property: message *)
external set_message : t -> string -> unit = "ml_gtk_alert_dialog_set_message"

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_alert_dialog_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_alert_dialog_set_modal"

(** Show the alert to the user.

This function is a simple version of [method@Gtk.AlertDialog.choose]
intended for dialogs with a single button.
If you want to cancel the dialog or if the alert has more than one button,
you should use that function instead and provide it with a #GCancellable or
callback respectively. *)
external show : t -> Application_and__window_and__window_group.Window.t option -> unit = "ml_gtk_alert_dialog_show"

(** Returns the button labels for the alert. *)
external get_buttons : t -> unit = "ml_gtk_alert_dialog_get_buttons"

