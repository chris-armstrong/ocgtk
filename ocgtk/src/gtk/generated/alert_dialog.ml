(* GENERATED CODE - DO NOT EDIT *)
(* AlertDialog: AlertDialog *)

type t = [`alert_dialog | `object_] Gobject.obj

(** Create a new AlertDialog *)
external new_ : string -> unit -> t = "ml_gtk_alert_dialog_new"

(* Methods *)
(** Show the alert to the user.

This function is a simple version of [method@Gtk.AlertDialog.choose]
intended for dialogs with a single button.
If you want to cancel the dialog or if the alert has more than one button,
you should use that function instead and provide it with a #GCancellable or
callback respectively. *)
external show : t -> Application_and__window_and__window_group.Window.t option -> unit = "ml_gtk_alert_dialog_show"

(** Sets whether the alert blocks interaction
with the parent window while it is presented. *)
external set_modal : t -> bool -> unit = "ml_gtk_alert_dialog_set_modal"

(** Sets the message that will be shown in the alert. *)
external set_message : t -> string -> unit = "ml_gtk_alert_dialog_set_message"

(** Sets the detail text that will be shown in the alert. *)
external set_detail : t -> string -> unit = "ml_gtk_alert_dialog_set_detail"

(** Sets the index of the default button.

See [property@Gtk.AlertDialog:default-button] for
details of how this value is used. *)
external set_default_button : t -> int -> unit = "ml_gtk_alert_dialog_set_default_button"

(** Sets the index of the cancel button.

See [property@Gtk.AlertDialog:cancel-button] for
details of how this value is used. *)
external set_cancel_button : t -> int -> unit = "ml_gtk_alert_dialog_set_cancel_button"

(** Sets the button labels for the alert. *)
external set_buttons : t -> string array -> unit = "ml_gtk_alert_dialog_set_buttons"

(** Returns whether the alert blocks interaction
with the parent window while it is presented. *)
external get_modal : t -> bool = "ml_gtk_alert_dialog_get_modal"

(** Returns the message that will be shown in the alert. *)
external get_message : t -> string = "ml_gtk_alert_dialog_get_message"

(** Returns the detail text that will be shown in the alert. *)
external get_detail : t -> string = "ml_gtk_alert_dialog_get_detail"

(** Returns the index of the default button. *)
external get_default_button : t -> int = "ml_gtk_alert_dialog_get_default_button"

(** Returns the index of the cancel button. *)
external get_cancel_button : t -> int = "ml_gtk_alert_dialog_get_cancel_button"

(** Returns the button labels for the alert. *)
external get_buttons : t -> string array option = "ml_gtk_alert_dialog_get_buttons"

(* Properties *)

