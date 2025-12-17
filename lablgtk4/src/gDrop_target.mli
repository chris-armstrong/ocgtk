class drop_target : Drop_target.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Gdrop_target_signals.drop_target_signals
    method get_actions : unit -> Gdk.dragaction
    method get_preload : unit -> bool
    method reject : unit -> unit
    method set_actions : Gdk.dragaction -> unit
    method set_preload : bool -> unit
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_drop_target : Drop_target.t
  end

