(* Signal class defined in gbutton_signals.ml *)

(* High-level class for Button *)
class button_skel (obj : Button.t) = object (self)
  inherit GObj.widget_impl (Button.as_widget obj)

  method connect = new Gbutton_signals.button_signals obj

  method get_can_shrink () = Button.get_can_shrink obj
  method can_shrink () = Button.get_can_shrink obj

  method get_child () = Button.get_child obj
  method child () = Button.get_child obj

  method get_has_frame () = Button.get_has_frame obj
  method has_frame () = Button.get_has_frame obj

  method get_icon_name () = Button.get_icon_name obj
  method icon_name () = Button.get_icon_name obj

  method get_label () = Button.get_label obj
  method label () = Button.get_label obj

  method get_use_underline () = Button.get_use_underline obj
  method use_underline () = Button.get_use_underline obj

  method set_can_shrink can_shrink = Button.set_can_shrink obj can_shrink

  method set_child child = Button.set_child obj child

  method set_has_frame has_frame = Button.set_has_frame obj has_frame

  method set_icon_name icon_name = Button.set_icon_name obj icon_name

  method set_label label = Button.set_label obj label

  method set_use_underline use_underline = Button.set_use_underline obj use_underline

end

class button obj = object
  inherit button_skel obj
end
