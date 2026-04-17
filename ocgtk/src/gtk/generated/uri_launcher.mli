(* GENERATED CODE - DO NOT EDIT *)
(* UriLauncher: UriLauncher *)

type t = [ `uri_launcher | `object_ ] Gobject.obj

external new_ : string option -> t = "ml_gtk_uri_launcher_new"
(** Create a new UriLauncher *)

(* Methods *)

external set_uri : t -> string option -> unit = "ml_gtk_uri_launcher_set_uri"
(** Sets the uri that will be opened. *)

external launch_finish :
  t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (bool, GError.t) result
  = "ml_gtk_uri_launcher_launch_finish"
(** Finishes the [method@Gtk.UriLauncher.launch] call and returns the result. *)

external get_uri : t -> string option = "ml_gtk_uri_launcher_get_uri"
(** Gets the uri that will be opened. *)

(* Properties *)
