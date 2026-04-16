(* GENERATED CODE - DO NOT EDIT *)
(* AppChooser: AppChooser *)

type t = [`app_chooser] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gtk_app_chooser_from_gobject"

(* Methods *)
(** Reloads the list of applications. *)
external refresh : t -> unit = "ml_gtk_app_chooser_refresh"

(** Returns the content type for which the `GtkAppChooser`
shows applications. *)
external get_content_type : t -> string = "ml_gtk_app_chooser_get_content_type"

(** Returns the currently selected application. *)
external get_app_info : t -> Ocgtk_gio.Gio.Wrappers.App_info.t option = "ml_gtk_app_chooser_get_app_info"

(* Properties *)

