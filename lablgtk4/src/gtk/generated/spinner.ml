(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Spinner *)

type t = [`spinner | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new Spinner *)
external new_ : unit -> t = "ml_gtk_spinner_new"

(* Properties *)

(** Get property: spinning *)
external get_spinning : t -> bool = "ml_gtk_spinner_get_spinning"

(** Set property: spinning *)
external set_spinning : t -> bool -> unit = "ml_gtk_spinner_set_spinning"

(** Stops the animation of the spinner. *)
external stop : t -> unit = "ml_gtk_spinner_stop"

(** Starts the animation of the spinner. *)
external start : t -> unit = "ml_gtk_spinner_start"

