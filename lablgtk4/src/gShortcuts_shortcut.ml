(* High-level class for ShortcutsShortcut *)
class shortcuts_shortcut_skel (obj : Shortcuts_shortcut.t) = object (self)
  inherit GObj.widget_impl (Shortcuts_shortcut.as_widget obj)

end

class shortcuts_shortcut obj = object
  inherit shortcuts_shortcut_skel obj
end
