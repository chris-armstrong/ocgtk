(* High-level class for FontChooserWidget *)
class font_chooser_widget_skel (obj : Font_chooser_widget.t) = object (self)
  inherit GObj.widget_impl (Font_chooser_widget.as_widget obj)

end

class font_chooser_widget obj = object
  inherit font_chooser_widget_skel obj
end
