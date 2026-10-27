(** Provides access to key events.

    Its methods, signals and properties are on
    {!class-type-event_controller_key_t}. The functions it is built on are in
    {!Ocgtk.Raw.Event_controller_key}. *)

(** The methods, signals and properties of a [GtkEventControllerKey]. *)
class type event_controller_key_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_im_update :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_key_pressed :
    ?after:bool ->
    callback:
      (keyval:int -> keycode:int -> state:Ocgdk.Enums.modifiertype -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_key_released :
    ?after:bool ->
    callback:
      (keyval:int -> keycode:int -> state:Ocgdk.Enums.modifiertype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_modifiers :
    ?after:bool ->
    callback:(state:Ocgdk.Enums.modifiertype -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method forward :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    bool
  (** Forwards the current event of this [controller] to a [widget].

      This function can only be used in handlers for the
      [Gtk.EventControllerKey::key-pressed],
      [Gtk.EventControllerKey::key-released] or
      [Gtk.EventControllerKey::modifiers] signals. *)

  method get_group : unit -> int
  (** Gets the key group of the current event of this [controller].

      See [Gdk.KeyEvent.get_layout]. *)

  method get_im_context : unit -> Im_context.im_context_t option
  (** Gets the input method context of the key [controller]. *)

  method set_im_context : Im_context.im_context_t option -> unit
  (** Sets the input method context of the key [controller]. *)

  method as_event_controller_key : Raw.Event_controller_key.t
end

class event_controller_key :
  Raw.Event_controller_key.t ->
  event_controller_key_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Event_controller_key.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkEventControllerKey], give one already wrapped. *)

val new_ : unit -> event_controller_key_t
