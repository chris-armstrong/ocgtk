class type action_bar_t = object
    method get_center_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_revealed : unit -> bool
    method pack_end : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method pack_start : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_center_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_revealed : bool -> unit
    method as_action_bar : Action_bar.t
end

class action_bar : Action_bar.t -> action_bar_t

