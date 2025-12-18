(* Signal class defined in gapp_chooser_button_signals.ml *)

(* High-level class for AppChooserButton *)
class app_chooser_button (obj : App_chooser_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (App_chooser_button.as_widget obj)
  inherit Gapp_chooser_button_signals.app_chooser_button_signals obj

  method heading = App_chooser_button.get_heading obj
  method set_heading v = App_chooser_button.set_heading obj v

  method modal = App_chooser_button.get_modal obj
  method set_modal v = App_chooser_button.set_modal obj v

  method show_default_item = App_chooser_button.get_show_default_item obj
  method set_show_default_item v = App_chooser_button.set_show_default_item obj v

  method show_dialog_item = App_chooser_button.get_show_dialog_item obj
  method set_show_dialog_item v = App_chooser_button.set_show_dialog_item obj v

  method append_separator : unit -> unit = fun () -> (App_chooser_button.append_separator obj )

  method set_active_custom_item : string -> unit = fun name -> (App_chooser_button.set_active_custom_item obj name)

  method as_widget = (App_chooser_button.as_widget obj)
    method as_app_chooser_button = obj
end

