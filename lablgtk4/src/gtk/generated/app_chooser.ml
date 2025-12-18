(* GENERATED CODE - DO NOT EDIT *)
(* AppChooser: AppChooser *)

type t = [`app_chooser] Gobject.obj

(* Properties *)

(** Get property: content-type *)
external get_content_type : t -> string = "ml_gtk_app_chooser_get_content_type"

(** Reloads the list of applications. *)
external refresh : t -> unit = "ml_gtk_app_chooser_refresh"

