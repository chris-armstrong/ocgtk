(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Spinner *)

type t = [`spinner | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new Spinner *)
external new_ : unit -> t = "ml_gtk_spinner_new"

(* Properties *)

(** Stops the animation of the spinner. *)
external stop : t -> unit = "ml_gtk_spinner_stop"

(** Starts the animation of the spinner. *)
external start : t -> unit = "ml_gtk_spinner_start"

(** Sets the activity of the spinner. *)
external set_spinning : t -> bool -> unit = "ml_gtk_spinner_set_spinning"

(** Returns whether the spinner is spinning. *)
external get_spinning : t -> bool = "ml_gtk_spinner_get_spinning"

