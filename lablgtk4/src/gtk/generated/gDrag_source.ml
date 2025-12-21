(* Signal class defined in gdrag_source_signals.ml *)

(* High-level class for DragSource *)
class drag_source (obj : Drag_source.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Drag_source.as_event_controller obj)
  inherit Gdrag_source_signals.drag_source_signals obj

  method drag_cancel : unit -> unit =
    fun () ->
      (Drag_source.drag_cancel obj)

  method as_event_controller = (Drag_source.as_event_controller obj)
    method as_drag_source = obj
end

