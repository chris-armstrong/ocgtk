class type search_bar_t = object
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_key_capture_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_search_mode : unit -> bool
    method get_show_close_button : unit -> bool
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_key_capture_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_search_mode : bool -> unit
    method set_show_close_button : bool -> unit
    method search_mode_enabled : bool
    method set_search_mode_enabled : bool -> unit
    method as_search_bar : Search_bar.t
end

class search_bar : Search_bar.t -> search_bar_t

