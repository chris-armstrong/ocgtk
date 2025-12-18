class shortcut_label : Shortcut_label.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_accelerator : unit -> string option
    method get_disabled_text : unit -> string option
    method set_accelerator : string -> unit
    method set_disabled_text : string -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_shortcut_label : Shortcut_label.t
  end

