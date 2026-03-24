class type color_chooser_widget_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method show_editor : bool
    method set_show_editor : bool -> unit
    method as_color_chooser_widget : Color_chooser_widget.t
end

(* High-level class for ColorChooserWidget *)
class color_chooser_widget (obj : Color_chooser_widget.t) : color_chooser_widget_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method show_editor = Color_chooser_widget.get_show_editor obj
  method set_show_editor v =  Color_chooser_widget.set_show_editor obj v

    method as_color_chooser_widget = obj
end

let new_ () : color_chooser_widget_t =
  new color_chooser_widget (Color_chooser_widget.new_ ())

