class type aspect_frame_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_obey_child : unit -> bool
    method get_ratio : unit -> float
    method get_xalign : unit -> float
    method get_yalign : unit -> float
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_obey_child : bool -> unit
    method set_ratio : float -> unit
    method set_xalign : float -> unit
    method set_yalign : float -> unit
    method as_aspect_frame : Aspect_frame.t
end

(* High-level class for AspectFrame *)
class aspect_frame (obj : Aspect_frame.t) : aspect_frame_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Aspect_frame.get_child obj)

  method get_obey_child : unit -> bool =
    fun () ->
      (Aspect_frame.get_obey_child obj)

  method get_ratio : unit -> float =
    fun () ->
      (Aspect_frame.get_ratio obj)

  method get_xalign : unit -> float =
    fun () ->
      (Aspect_frame.get_xalign obj)

  method get_yalign : unit -> float =
    fun () ->
      (Aspect_frame.get_yalign obj)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Aspect_frame.set_child obj child)

  method set_obey_child : bool -> unit =
    fun obey_child ->
      (Aspect_frame.set_obey_child obj obey_child)

  method set_ratio : float -> unit =
    fun ratio ->
      (Aspect_frame.set_ratio obj ratio)

  method set_xalign : float -> unit =
    fun xalign ->
      (Aspect_frame.set_xalign obj xalign)

  method set_yalign : float -> unit =
    fun yalign ->
      (Aspect_frame.set_yalign obj yalign)

    method as_aspect_frame = obj
end

