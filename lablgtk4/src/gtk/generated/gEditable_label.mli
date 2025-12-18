class editable_label : Editable_label.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method editing : bool
    method set_editing : bool -> unit
    method start_editing : unit -> unit
    method stop_editing : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_editable_label : Editable_label.t
  end

