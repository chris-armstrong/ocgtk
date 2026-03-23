class type window_controls_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_decoration_layout : unit -> string option
    method get_empty : unit -> bool
    method get_side : unit -> Gtk_enums.packtype
    method set_decoration_layout : string option -> unit
    method set_side : Gtk_enums.packtype -> unit
    method as_window_controls : Window_controls.t
end

class window_controls : Window_controls.t -> window_controls_t

val new_ : Gtk_enums.packtype -> window_controls_t
