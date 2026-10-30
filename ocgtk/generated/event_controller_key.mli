(** Provides access to key events.

    Its methods, signals and properties are on
    {!class-type-event_controller_key_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Event_controller_key}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [EventControllerKey].}

    Inherits from:
    {{!Ocgtk.Event_controller.class-type-event_controller_t}Ocgtk.Event_controller}

    Provides access to key events. *)
class type event_controller_key_t = object
  inherit Event_controller.event_controller_t

  (** {2:signals Signals} *)

  method on_im_update :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever the input method context filters away a keypress and
      prevents the [controller] receiving it.

      See [Gtk.EventControllerKey.set_im_context] and
      [Gtk.IMContext.filter_keypress]. *)

  method on_key_pressed :
    ?after:bool ->
    callback:
      (keyval:int -> keycode:int -> state:Ocgdk.Enums.modifiertype -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a key is pressed. *)

  method on_key_released :
    ?after:bool ->
    callback:
      (keyval:int -> keycode:int -> state:Ocgdk.Enums.modifiertype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a key is released. *)

  method on_modifiers :
    ?after:bool ->
    callback:(state:Ocgdk.Enums.modifiertype -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever the state of modifier keys and pointer buttons change. *)

  (** {2:methods Methods} *)

  method forward : Widget.widget_t -> bool
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

  (** {2:conversions Conversions} *)

  method as_event_controller_key : Raw.Event_controller_key.t
end

class event_controller_key :
  Raw.Event_controller_key.t ->
  event_controller_key_t
(** Wraps a raw handle of {!Ocgtk.Raw.Event_controller_key.t}. *)

(** {1:constructors Constructors} *)

val new_ : unit -> event_controller_key_t
(** Creates a new event controller that will handle key events. *)
