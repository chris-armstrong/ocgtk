(* High-level class for Frame *)
class frame (obj : Frame.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Frame.as_widget obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Frame.get_child obj)

  method get_label : unit -> string option =
    fun () ->
      (Frame.get_label obj)

  method get_label_align : unit -> float =
    fun () ->
      (Frame.get_label_align obj)

  method get_label_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Frame.get_label_widget obj)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Frame.set_child obj child)

  method set_label : string option -> unit =
    fun label ->
      (Frame.set_label obj label)

  method set_label_align : float -> unit =
    fun xalign ->
      (Frame.set_label_align obj xalign)

  method set_label_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun label_widget ->
      let label_widget = Option.map (fun (c) -> c#as_widget) label_widget in
      (Frame.set_label_widget obj label_widget)

  method label_xalign = Frame.get_label_xalign obj
  method set_label_xalign v =  Frame.set_label_xalign obj v

  method as_widget = (Frame.as_widget obj)
    method as_frame = obj
end

