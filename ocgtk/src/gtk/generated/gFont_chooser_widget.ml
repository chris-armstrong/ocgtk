class type font_chooser_widget_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GFont_chooser.font_chooser_t
    method tweak_action : Ocgtk_gio.Gio.Action.action_t
    method as_font_chooser_widget : Font_chooser_widget.t
end

(* High-level class for FontChooserWidget *)
class font_chooser_widget (obj : Font_chooser_widget.t) : font_chooser_widget_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit GFont_chooser.font_chooser (Font_chooser.from_gobject obj)

  method tweak_action = new Ocgtk_gio.Gio.Action.action (Font_chooser_widget.get_tweak_action obj)

    method as_font_chooser_widget = obj
end

let new_ () : font_chooser_widget_t =
  new font_chooser_widget (Font_chooser_widget.new_ ())

