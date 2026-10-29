class type color_chooser_widget_t = object
  inherit Widget.widget_t
  inherit Color_chooser.color_chooser_t

  (** {2:properties Properties} *)

  method show_editor : bool
  (** [TRUE] when the color chooser is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  method set_show_editor : bool -> unit
  (** [TRUE] when the color chooser is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  (** {2:conversions Conversions} *)

  method as_color_chooser_widget : Raw.Color_chooser_widget.t
end

(* High-level class for ColorChooserWidget *)
class color_chooser_widget (obj : Raw.Color_chooser_widget.t) :
  color_chooser_widget_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    inherit Color_chooser.color_chooser (Raw.Color_chooser.from_gobject obj)
    method show_editor = Raw.Color_chooser_widget.get_show_editor obj
    method set_show_editor v = Raw.Color_chooser_widget.set_show_editor obj v
    method as_color_chooser_widget = obj
  end

let new_ () : color_chooser_widget_t =
  new color_chooser_widget (Raw.Color_chooser_widget.new_ ())
