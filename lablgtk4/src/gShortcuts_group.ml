(* High-level class for ShortcutsGroup *)
class shortcuts_group_skel (obj : Shortcuts_group.t) = object (self)
  inherit GObj.widget_impl (Shortcuts_group.as_widget obj)

end

class shortcuts_group obj = object
  inherit shortcuts_group_skel obj
end
