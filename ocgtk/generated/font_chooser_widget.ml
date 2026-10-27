class type font_chooser_widget_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Font_chooser.font_chooser_t

  method tweak_action : Ocgio.Action.action_t
  (** A toggle action that can be used to switch to the tweak page of the font
      chooser widget, which lets the user tweak the OpenType features and
      variation axes of the selected font.

      The action will be enabled or disabled depending on whether the selected
      font has any features or axes. *)

  method as_font_chooser_widget : Raw.Font_chooser_widget.t
end

(* High-level class for FontChooserWidget *)
class font_chooser_widget (obj : Raw.Font_chooser_widget.t) :
  font_chooser_widget_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Font_chooser.font_chooser (Raw.Font_chooser.from_gobject obj)

    method tweak_action =
      new Ocgio.Action.action (Raw.Font_chooser_widget.get_tweak_action obj)

    method as_font_chooser_widget = obj
  end

let new_ () : font_chooser_widget_t =
  new font_chooser_widget (Raw.Font_chooser_widget.new_ ())
