class type dialog_t = object
    inherit GApplication_and__window_and__window_group.window_t
    inherit Gdialog_signals.dialog_signals
    method add_action_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> unit
    method add_button : string -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_content_area : unit -> GBox.box_t
    method get_header_bar : unit -> GHeader_bar.header_bar_t
    method get_response_for_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int
    method get_widget_for_response : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method response : int -> unit
    method set_default_response : int -> unit
    method set_response_sensitive : int -> bool -> unit
    method use_header_bar : int
    method as_dialog : Dialog.t
end

class dialog : Dialog.t -> dialog_t

val new_ : unit -> dialog_t
