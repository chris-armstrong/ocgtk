class tooltip : Tooltip.t ->
  object
    method set_custom : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_icon_from_icon_name : string option -> unit
    method set_markup : string option -> unit
    method set_text : string option -> unit
    method as_tooltip : Tooltip.t
  end

