(* GENERATED CODE - DO NOT EDIT *)
(* UriLauncher: UriLauncher *)

type t = [`uri_launcher | `object_] Gobject.obj

(** Create a new UriLauncher *)
external new_ : string option -> t = "ml_gtk_uri_launcher_new"

(* Properties *)

(** Sets the uri that will be opened. *)
external set_uri : t -> string option -> unit = "ml_gtk_uri_launcher_set_uri"

(** Gets the uri that will be opened. *)
external get_uri : t -> string option = "ml_gtk_uri_launcher_get_uri"

