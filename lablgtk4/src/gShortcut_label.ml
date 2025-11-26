(* High-level class for ShortcutLabel *)
class shortcut_label_skel (obj : Shortcut_label.t) = object (self)
  inherit GObj.widget_impl (Shortcut_label.as_widget obj)

end

class shortcut_label obj = object
  inherit shortcut_label_skel obj
end
