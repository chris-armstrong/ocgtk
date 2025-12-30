(* Signal class defined in gdrop_target_async_signals.ml *)

(* High-level class for DropTargetAsync *)
class drop_target_async (obj : Drop_target_async.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Drop_target_async.as_event_controller obj)
  inherit Gdrop_target_async_signals.drop_target_async_signals obj

  method as_event_controller = (Drop_target_async.as_event_controller obj)
    method as_drop_target_async = obj
end

