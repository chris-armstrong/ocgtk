(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AlertDialog *)

type t = Gtk.Widget.t

external new_ : string -> unit -> t = "ml_gtk_alert_dialog_new"

(* Properties *)

external get_cancel_button : t -> int = "ml_gtk_alert_dialog_get_cancel_button"

external set_cancel_button : t -> int -> unit = "ml_gtk_alert_dialog_set_cancel_button"

external get_default_button : t -> int = "ml_gtk_alert_dialog_get_default_button"

external set_default_button : t -> int -> unit = "ml_gtk_alert_dialog_set_default_button"

external get_detail : t -> string = "ml_gtk_alert_dialog_get_detail"

external set_detail : t -> string -> unit = "ml_gtk_alert_dialog_set_detail"

external get_message : t -> string = "ml_gtk_alert_dialog_get_message"

external set_message : t -> string -> unit = "ml_gtk_alert_dialog_set_message"

external get_modal : t -> bool = "ml_gtk_alert_dialog_get_modal"

external set_modal : t -> bool -> unit = "ml_gtk_alert_dialog_set_modal"

external show : t -> Gtk.Widget.t option -> unit = "ml_gtk_alert_dialog_show"

external get_buttons : t -> unit = "ml_gtk_alert_dialog_get_buttons"

