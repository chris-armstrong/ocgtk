class type center_layout_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager_t
    method get_baseline_position : unit -> Gtk_enums.baselineposition
    method get_center_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_end_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_orientation : unit -> Gtk_enums.orientation
    method get_shrink_center_last : unit -> bool
    method get_start_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method set_baseline_position : Gtk_enums.baselineposition -> unit
    method set_center_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_end_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_orientation : Gtk_enums.orientation -> unit
    method set_shrink_center_last : bool -> unit
    method set_start_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method as_center_layout : Center_layout.t
end

class center_layout : Center_layout.t -> center_layout_t

val new_ : unit -> center_layout_t
