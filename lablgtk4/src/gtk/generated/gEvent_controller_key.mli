class event_controller_key : Event_controller_key.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Gevent_controller_key_signals.event_controller_key_signals
    method forward : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> bool
    method get_group : unit -> int
    method get_im_context : unit -> GIm_context.im_context option
    method set_im_context : #GIm_context.im_context option -> unit
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_event_controller_key : Event_controller_key.t
  end

