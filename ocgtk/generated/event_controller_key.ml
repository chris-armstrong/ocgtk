class type event_controller_key_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

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

(* High-level class for EventControllerKey *)
class event_controller_key (obj : Raw.Event_controller_key.t) :
  event_controller_key_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj :> Raw.Event_controller.t)

    method on_im_update ?(after = false) ~callback () =
      Raw.Event_controller_key.on_im_update ~after self#as_event_controller_key
        ~callback

    method on_key_pressed ?(after = false) ~callback () =
      Raw.Event_controller_key.on_key_pressed ~after
        self#as_event_controller_key ~callback

    method on_key_released ?(after = false) ~callback () =
      Raw.Event_controller_key.on_key_released ~after
        self#as_event_controller_key ~callback

    method on_modifiers ?(after = false) ~callback () =
      Raw.Event_controller_key.on_modifiers ~after self#as_event_controller_key
        ~callback

    method forward :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        bool =
      fun widget ->
        let widget = widget#as_widget in
        Raw.Event_controller_key.forward obj widget

    method get_group : unit -> int =
      fun () -> Raw.Event_controller_key.get_group obj

    method get_im_context : unit -> Im_context.im_context_t option =
      fun () ->
        Option.map
          (fun ret -> new Im_context.im_context ret)
          (Raw.Event_controller_key.get_im_context obj)

    method set_im_context : Im_context.im_context_t option -> unit =
      fun im_context ->
        let im_context = Option.map (fun c -> c#as_im_context) im_context in
        Raw.Event_controller_key.set_im_context obj im_context

    method as_event_controller_key = obj
  end

let new_ () : event_controller_key_t =
  new event_controller_key (Raw.Event_controller_key.new_ ())
