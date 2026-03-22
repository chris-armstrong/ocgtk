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

class frame : Frame.t -> frame_t

val new_ : string option -> frame_t
