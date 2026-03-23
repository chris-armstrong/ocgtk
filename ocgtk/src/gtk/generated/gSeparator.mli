class type separator_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method as_separator : Separator.t
end

class separator : Separator.t -> separator_t

val new_ : Gtk_enums.orientation -> separator_t
