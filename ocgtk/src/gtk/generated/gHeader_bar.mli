class type header_bar_t = object
    method get_decoration_layout : unit -> string option
    method get_show_title_buttons : unit -> bool
    method get_title_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method pack_end : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method pack_start : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_decoration_layout : string option -> unit
    method set_show_title_buttons : bool -> unit
    method set_title_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method as_header_bar : Header_bar.t
end

class header_bar : Header_bar.t -> header_bar_t

