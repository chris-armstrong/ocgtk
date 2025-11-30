(* High-level class for ShortcutsSection *)
class shortcuts_section_skel (obj : Shortcuts_section.t) = object (self)
  inherit GObj.widget_impl (Shortcuts_section.as_widget obj)

end

class shortcuts_section obj = object
  inherit shortcuts_section_skel obj
end
