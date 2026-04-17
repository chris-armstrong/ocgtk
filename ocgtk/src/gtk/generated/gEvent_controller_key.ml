(* Signal class defined in gevent_controller_key_signals.ml *)

class type event_controller_key_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Gevent_controller_key_signals.event_controller_key_signals
    method forward : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method get_group : unit -> int
    method get_im_context : unit -> GIm_context.im_context_t option
    method set_im_context : GIm_context.im_context_t option -> unit
    method as_event_controller_key : Event_controller_key.t
end

(* High-level class for EventControllerKey *)
class event_controller_key (obj : Event_controller_key.t) : event_controller_key_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t)
  inherit Gevent_controller_key_signals.event_controller_key_signals obj

  method forward : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool =
    fun widget ->
      let widget = widget#as_widget in
      (Event_controller_key.forward obj widget)

  method get_group : unit -> int =
    fun () ->
      (Event_controller_key.get_group obj)

  method get_im_context : unit -> GIm_context.im_context_t option =
    fun () ->
      Option.map (fun ret -> new GIm_context.im_context ret) (Event_controller_key.get_im_context obj)

  method set_im_context : GIm_context.im_context_t option -> unit =
    fun im_context ->
      let im_context = Option.map (fun (c) -> c#as_im_context) im_context in
      (Event_controller_key.set_im_context obj im_context)

    method as_event_controller_key = obj
end

let new_ () : event_controller_key_t =
  new event_controller_key (Event_controller_key.new_ ())

