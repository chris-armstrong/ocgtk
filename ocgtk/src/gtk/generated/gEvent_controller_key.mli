class type event_controller_key_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .event_controller_t

  method on_im_update : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_key_pressed :
    callback:
      (keyval:int ->
      keycode:int ->
      state:Ocgtk_gdk.Gdk_enums.modifiertype ->
      bool) ->
    Gobject.Signal.handler_id

  method on_key_released :
    callback:
      (keyval:int ->
      keycode:int ->
      state:Ocgtk_gdk.Gdk_enums.modifiertype ->
      unit) ->
    Gobject.Signal.handler_id

  method on_modifiers :
    callback:(state:Ocgtk_gdk.Gdk_enums.modifiertype -> bool) ->
    Gobject.Signal.handler_id

  method forward :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    bool

  method get_group : unit -> int
  method get_im_context : unit -> GIm_context.im_context_t option
  method set_im_context : GIm_context.im_context_t option -> unit
  method as_event_controller_key : Event_controller_key.t
end

class event_controller_key : Event_controller_key.t -> event_controller_key_t

val new_ : unit -> event_controller_key_t
