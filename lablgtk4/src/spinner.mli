(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Spinner *)

type t = Gtk.widget

(** Create a new Spinner *)
external new_ : unit -> t = "ml_gtk_spinner_new"

(* Properties *)

(** Get property: spinning *)
external get_spinning : t -> bool = "ml_gtk_spinner_get_spinning"

(** Set property: spinning *)
external set_spinning : t -> bool -> unit = "ml_gtk_spinner_set_spinning"

external stop : t -> unit = "ml_gtk_spinner_stop"

external start : t -> unit = "ml_gtk_spinner_start"

