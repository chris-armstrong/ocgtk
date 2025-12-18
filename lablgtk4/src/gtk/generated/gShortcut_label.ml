(* High-level class for ShortcutLabel *)
class shortcut_label (obj : Shortcut_label.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Shortcut_label.as_widget obj)

  method accelerator = Shortcut_label.get_accelerator obj
  method set_accelerator v = Shortcut_label.set_accelerator obj v

  method disabled_text = Shortcut_label.get_disabled_text obj
  method set_disabled_text v = Shortcut_label.set_disabled_text obj v

  method as_widget = (Shortcut_label.as_widget obj)
    method as_shortcut_label = obj
end

