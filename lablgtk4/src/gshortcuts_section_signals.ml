(* Signal handlers for ShortcutsSection *)
class shortcuts_section_signals (obj : Shortcuts_section.t) = object
  method on_change_current_page ~callback =
    Gobject.Signal.connect_simple (Obj.magic (obj :> _ Gobject.obj) : [`widget] Gobject.obj) ~name:"change-current-page" ~callback ~after:false

end
