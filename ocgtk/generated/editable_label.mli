class type editable_label_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Editable.editable_t
  method get_editing : unit -> bool
  method start_editing : unit -> unit
  method stop_editing : bool -> unit
  method as_editable_label : Raw.Editable_label.t
end

class editable_label : Raw.Editable_label.t -> editable_label_t

val new_ : string -> editable_label_t
