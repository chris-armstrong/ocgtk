(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerKey: EventControllerKey *)

type t = [ `event_controller_key | `event_controller | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_event_controller_key_new"
(** Create a new EventControllerKey *)

(* Methods *)

external set_im_context : t -> Im_context.t option -> unit
  = "ml_gtk_event_controller_key_set_im_context"
(** Sets the input method context of the key @controller. *)

external get_im_context : t -> Im_context.t option
  = "ml_gtk_event_controller_key_get_im_context"
(** Gets the input method context of the key @controller. *)

external get_group : t -> int = "ml_gtk_event_controller_key_get_group"
(** Gets the key group of the current event of this @controller.

See [method@Gdk.KeyEvent.get_layout]. *)

external forward :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
  .Widget
  .t ->
  bool = "ml_gtk_event_controller_key_forward"
(** Forwards the current event of this @controller to a @widget.

This function can only be used in handlers for the
[signal@Gtk.EventControllerKey::key-pressed],
[signal@Gtk.EventControllerKey::key-released]
or [signal@Gtk.EventControllerKey::modifiers] signals. *)
