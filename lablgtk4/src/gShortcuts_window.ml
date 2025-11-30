(* High-level class for ShortcutsWindow *)
class shortcuts_window_skel (obj : Shortcuts_window.t) = object (self)
  inherit GObj.widget_impl (Shortcuts_window.as_widget obj)

end

class shortcuts_window obj = object
  inherit shortcuts_window_skel obj
end
