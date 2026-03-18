(* Signal class defined in gshortcuts_section_signals.ml *)

(* High-level class for ShortcutsSection *)
class shortcuts_section (obj : Shortcuts_section.t) = object (self)
  inherit Gshortcuts_section_signals.shortcuts_section_signals obj

  method add_group : 'p1. (#GShortcuts_group.shortcuts_group as 'p1) -> unit =
    fun group ->
      let group = group#as_shortcuts_group in
      (Shortcuts_section.add_group obj group)

  method max_height = Shortcuts_section.get_max_height obj
  method set_max_height v =  Shortcuts_section.set_max_height obj v

  method section_name = Shortcuts_section.get_section_name obj
  method set_section_name v =  Shortcuts_section.set_section_name obj v

  method title = Shortcuts_section.get_title obj
  method set_title v =  Shortcuts_section.set_title obj v

  method view_name = Shortcuts_section.get_view_name obj
  method set_view_name v =  Shortcuts_section.set_view_name obj v

    method as_shortcuts_section = obj
end

