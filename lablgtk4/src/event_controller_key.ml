(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerKey *)

type t = EventController.t

(** Create a new EventControllerKey *)
external new_ : unit -> t = "ml_gtk_event_controller_key_new"

(** Sets the input method context of the key @controller. *)
external set_im_context : t -> Gtk.widget option -> unit = "ml_gtk_event_controller_key_set_im_context"

(** Gets the input method context of the key @controller. *)
external get_im_context : t -> Gtk.widget = "ml_gtk_event_controller_key_get_im_context"

(** Gets the key group of the current event of this @controller.

See [method@Gdk.KeyEvent.get_layout]. *)
external get_group : t -> int = "ml_gtk_event_controller_key_get_group"

(** Forwards the current event of this @controller to a @widget.

This function can only be used in handlers for the
[signal@Gtk.EventControllerKey::key-pressed],
[signal@Gtk.EventControllerKey::key-released]
or [signal@Gtk.EventControllerKey::modifiers] signals. *)
external forward : t -> Gtk.widget -> bool = "ml_gtk_event_controller_key_forward"

