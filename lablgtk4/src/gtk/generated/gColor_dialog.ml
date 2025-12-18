(* High-level class for ColorDialog *)
class color_dialog (obj : Color_dialog.t) = object (self)

  method modal = Color_dialog.get_modal obj
  method set_modal v = Color_dialog.set_modal obj v

  method title = Color_dialog.get_title obj
  method set_title v = Color_dialog.set_title obj v

  method with_alpha = Color_dialog.get_with_alpha obj
  method set_with_alpha v = Color_dialog.set_with_alpha obj v

    method as_color_dialog = obj
end

