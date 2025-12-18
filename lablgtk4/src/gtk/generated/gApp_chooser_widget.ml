(* Signal class defined in gapp_chooser_widget_signals.ml *)

(* High-level class for AppChooserWidget *)
class app_chooser_widget (obj : App_chooser_widget.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (App_chooser_widget.as_widget obj)
  inherit Gapp_chooser_widget_signals.app_chooser_widget_signals obj

  method default_text = App_chooser_widget.get_default_text obj
  method set_default_text v = App_chooser_widget.set_default_text obj v

  method show_all = App_chooser_widget.get_show_all obj
  method set_show_all v = App_chooser_widget.set_show_all obj v

  method show_default = App_chooser_widget.get_show_default obj
  method set_show_default v = App_chooser_widget.set_show_default obj v

  method show_fallback = App_chooser_widget.get_show_fallback obj
  method set_show_fallback v = App_chooser_widget.set_show_fallback obj v

  method show_other = App_chooser_widget.get_show_other obj
  method set_show_other v = App_chooser_widget.set_show_other obj v

  method show_recommended = App_chooser_widget.get_show_recommended obj
  method set_show_recommended v = App_chooser_widget.set_show_recommended obj v

  method as_widget = (App_chooser_widget.as_widget obj)
    method as_app_chooser_widget = obj
end

