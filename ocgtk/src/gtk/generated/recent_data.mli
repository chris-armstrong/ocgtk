(* GENERATED CODE - DO NOT EDIT *)
(* RecentData: RecentData *)

type t = [ `recent_data ] Gobject.obj
(** Meta-data to be passed to gtk_recent_manager_add_full() when registering a
    recently used resource. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_display_name : t -> string = "ml_gtk_recent_data_get_display_name"
external get_description : t -> string = "ml_gtk_recent_data_get_description"
external get_mime_type : t -> string = "ml_gtk_recent_data_get_mime_type"
external get_app_name : t -> string = "ml_gtk_recent_data_get_app_name"
external get_app_exec : t -> string = "ml_gtk_recent_data_get_app_exec"
external get_groups : t -> string array = "ml_gtk_recent_data_get_groups"
external get_is_private : t -> bool = "ml_gtk_recent_data_get_is_private"

(* Setters *)
external set_display_name : t -> string -> unit
  = "ml_gtk_recent_data_set_display_name"

external set_description : t -> string -> unit
  = "ml_gtk_recent_data_set_description"

external set_mime_type : t -> string -> unit
  = "ml_gtk_recent_data_set_mime_type"

external set_app_name : t -> string -> unit = "ml_gtk_recent_data_set_app_name"
external set_app_exec : t -> string -> unit = "ml_gtk_recent_data_set_app_exec"

external set_groups : t -> string array -> unit
  = "ml_gtk_recent_data_set_groups"

external set_is_private : t -> bool -> unit
  = "ml_gtk_recent_data_set_is_private"

external make :
  string -> string -> string -> string -> string -> string array -> bool -> t
  = "ml_gtk_recent_data_make_bytecode" "ml_gtk_recent_data_make_native"
