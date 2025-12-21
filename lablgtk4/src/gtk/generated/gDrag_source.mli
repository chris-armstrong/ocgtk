class drag_source : Drag_source.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Gdrag_source_signals.drag_source_signals
    method drag_cancel : unit -> unit
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_drag_source : Drag_source.t
  end

