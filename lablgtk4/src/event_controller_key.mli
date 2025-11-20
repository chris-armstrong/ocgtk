(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerKey *)

type t = EventController.t

(** Create a new EventControllerKey *)
external new_ : unit -> t = "ml_gtk_event_controller_key_new"

external set_im_context : t -> Gtk.Widget.t option -> unit = "ml_gtk_event_controller_key_set_im_context"

external get_im_context : t -> Gtk.Widget.t = "ml_gtk_event_controller_key_get_im_context"

external get_group : t -> int = "ml_gtk_event_controller_key_get_group"

external forward : t -> Gtk.Widget.t -> bool = "ml_gtk_event_controller_key_forward"

