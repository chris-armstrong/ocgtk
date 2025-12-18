class drop_target_async : Drop_target_async.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Gdrop_target_async_signals.drop_target_async_signals
    method get_actions : unit -> Gdk.dragaction
    method set_actions : Gdk.dragaction -> unit
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_drop_target_async : Drop_target_async.t
  end

