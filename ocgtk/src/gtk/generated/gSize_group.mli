class type size_group_t = object
    method add_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method get_mode : unit -> Gtk_enums.sizegroupmode
    method remove_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_mode : Gtk_enums.sizegroupmode -> unit
    method as_size_group : Size_group.t
end

class size_group : Size_group.t -> size_group_t

val new_ : Gtk_enums.sizegroupmode -> size_group_t
