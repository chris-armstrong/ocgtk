(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Application *)

type t = Gtk.Widget.t

external new_ : string option -> unit -> t = "ml_gtk_application_new"

(* Properties *)

external get_register_session : t -> bool = "ml_gtk_application_get_register_session"

external set_register_session : t -> bool -> unit = "ml_gtk_application_set_register_session"

external get_screensaver_active : t -> bool = "ml_gtk_application_get_screensaver_active"

external uninhibit : t -> int -> unit = "ml_gtk_application_uninhibit"

external remove_window : t -> Gtk.Widget.t -> unit = "ml_gtk_application_remove_window"

external list_action_descriptions : t -> unit = "ml_gtk_application_list_action_descriptions"

external inhibit : t -> Gtk.Widget.t option -> Gtk_enums.applicationinhibitflags -> string option -> int = "ml_gtk_application_inhibit"

external get_window_by_id : t -> int -> Gtk.Widget.t = "ml_gtk_application_get_window_by_id"

external get_active_window : t -> Gtk.Widget.t = "ml_gtk_application_get_active_window"

external get_actions_for_accel : t -> string -> unit = "ml_gtk_application_get_actions_for_accel"

external get_accels_for_action : t -> string -> unit = "ml_gtk_application_get_accels_for_action"

external add_window : t -> Gtk.Widget.t -> unit = "ml_gtk_application_add_window"

