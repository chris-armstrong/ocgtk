(* Signal class defined in gshortcuts_section_signals.ml *)

class type shortcuts_section_t = object
    inherit GBox.box_t
    inherit Gshortcuts_section_signals.shortcuts_section_signals
    method add_group : GShortcuts_group.shortcuts_group_t -> unit
    method max_height : int
    method set_max_height : int -> unit
    method section_name : string
    method set_section_name : string -> unit
    method title : string
    method set_title : string -> unit
    method view_name : string
    method set_view_name : string -> unit
    method as_shortcuts_section : Shortcuts_section.t
end

(* High-level class for ShortcutsSection *)
class shortcuts_section (obj : Shortcuts_section.t) : shortcuts_section_t = object (self)
  inherit GBox.box (Obj.magic obj : Box.t)
  inherit Gshortcuts_section_signals.shortcuts_section_signals obj

  method add_group : GShortcuts_group.shortcuts_group_t -> unit =
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

