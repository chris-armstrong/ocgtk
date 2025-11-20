(* GENERATED CODE - DO NOT EDIT *)
(* Widget: UriLauncher *)

type t = Gtk.Widget.t

(** Create a new UriLauncher *)
external new_ : string option -> t = "ml_gtk_uri_launcher_new"

(* Properties *)

(** Get property: uri *)
external get_uri : t -> string = "ml_gtk_uri_launcher_get_uri"

(** Set property: uri *)
external set_uri : t -> string -> unit = "ml_gtk_uri_launcher_set_uri"

external launch_finish : t -> unit -> (bool, GError.t) result = "ml_gtk_uri_launcher_launch_finish"

external launch : t -> Gtk.Widget.t option -> unit -> unit -> unit -> unit = "ml_gtk_uri_launcher_launch"

