(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Spinner *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_spinner_new"

(* Properties *)

external get_spinning : t -> bool = "ml_gtk_spinner_get_spinning"

external set_spinning : t -> bool -> unit = "ml_gtk_spinner_set_spinning"

external stop : t -> unit = "ml_gtk_spinner_stop"

external start : t -> unit = "ml_gtk_spinner_start"

