(* High-level class for AspectFrame *)
class aspect_frame (obj : Aspect_frame.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Aspect_frame.as_widget obj)

  method obey_child = Aspect_frame.get_obey_child obj
  method set_obey_child v = Aspect_frame.set_obey_child obj v

  method ratio = Aspect_frame.get_ratio obj
  method set_ratio v = Aspect_frame.set_ratio obj v

  method xalign = Aspect_frame.get_xalign obj
  method set_xalign v = Aspect_frame.set_xalign obj v

  method yalign = Aspect_frame.get_yalign obj
  method set_yalign v = Aspect_frame.set_yalign obj v

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Aspect_frame.get_child obj )

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Aspect_frame.set_child obj child)

  method as_widget = (Aspect_frame.as_widget obj)
    method as_aspect_frame = obj
end

