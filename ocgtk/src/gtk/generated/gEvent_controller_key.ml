(* Signal class defined in gevent_controller_key_signals.ml *)

(* High-level class for EventControllerKey *)
class event_controller_key (obj : Event_controller_key.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Event_controller_key.as_event_controller obj)
  inherit Gevent_controller_key_signals.event_controller_key_signals obj

  method forward : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool =
    fun widget ->
      let widget = widget#as_widget in
      (Event_controller_key.forward obj widget)

  method get_group : unit -> int =
    fun () ->
      (Event_controller_key.get_group obj)

  method get_im_context : unit -> GIm_context.im_context option =
    fun () ->
      Option.map (fun ret -> new GIm_context.im_context ret) (Event_controller_key.get_im_context obj)

  method set_im_context : 'p1. (#GIm_context.im_context as 'p1) option -> unit =
    fun im_context ->
      let im_context = Option.map (fun (c) -> c#as_im_context) im_context in
      (Event_controller_key.set_im_context obj im_context)

  method as_event_controller = (Event_controller_key.as_event_controller obj)
    method as_event_controller_key = obj
end

