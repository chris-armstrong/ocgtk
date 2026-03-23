class type frame_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_label : unit -> string option
    method get_label_align : unit -> float
    method get_label_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_label : string option -> unit
    method set_label_align : float -> unit
    method set_label_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method label_xalign : float
    method set_label_xalign : float -> unit
    method as_frame : Frame.t
end

(* High-level class for Frame *)
class frame (obj : Frame.t) : frame_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Frame.get_child obj)

  method get_label : unit -> string option =
    fun () ->
      (Frame.get_label obj)

  method get_label_align : unit -> float =
    fun () ->
      (Frame.get_label_align obj)

  method get_label_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Frame.get_label_widget obj)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Frame.set_child obj child)

  method set_label : string option -> unit =
    fun label ->
      (Frame.set_label obj label)

  method set_label_align : float -> unit =
    fun xalign ->
      (Frame.set_label_align obj xalign)

  method set_label_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun label_widget ->
      let label_widget = Option.map (fun (c) -> c#as_widget) label_widget in
      (Frame.set_label_widget obj label_widget)

  method label_xalign = Frame.get_label_xalign obj
  method set_label_xalign v =  Frame.set_label_xalign obj v

    method as_frame = obj
end

let new_ (label : string option) : frame_t =
  new frame (Frame.new_ label)

