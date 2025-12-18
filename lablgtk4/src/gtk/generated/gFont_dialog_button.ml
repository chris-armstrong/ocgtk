(* Signal class defined in gfont_dialog_button_signals.ml *)

(* High-level class for FontDialogButton *)
class font_dialog_button (obj : Font_dialog_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Font_dialog_button.as_widget obj)
  inherit Gfont_dialog_button_signals.font_dialog_button_signals obj

  method font_features = Font_dialog_button.get_font_features obj
  method set_font_features v = Font_dialog_button.set_font_features obj v

  method use_font = Font_dialog_button.get_use_font obj
  method set_use_font v = Font_dialog_button.set_use_font obj v

  method use_size = Font_dialog_button.get_use_size obj
  method set_use_size v = Font_dialog_button.set_use_size obj v

  method get_dialog : unit -> GFont_dialog.font_dialog option = fun () -> Option.map (fun ret -> new GFont_dialog.font_dialog ret) (Font_dialog_button.get_dialog obj )

  method get_level : unit -> Gtk_enums.fontlevel = fun () -> (Font_dialog_button.get_level obj )

  method set_dialog : 'p1. (#GFont_dialog.font_dialog as 'p1) -> unit = fun dialog -> (Font_dialog_button.set_dialog obj ( dialog#as_font_dialog ))

  method set_level : Gtk_enums.fontlevel -> unit = fun level -> (Font_dialog_button.set_level obj level)

  method as_widget = (Font_dialog_button.as_widget obj)
    method as_font_dialog_button = obj
end

