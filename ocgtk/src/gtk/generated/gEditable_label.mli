class type editable_label_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_editing : unit -> bool
    method start_editing : unit -> unit
    method stop_editing : bool -> unit
    method as_editable_label : Editable_label.t
end

class editable_label : Editable_label.t -> editable_label_t

