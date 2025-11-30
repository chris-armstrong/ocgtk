(* Signal handlers for ShortcutsSection *)
class shortcuts_section_signals (obj : Shortcuts_section.t) = object
  method change_current_page ~callback =
    Gobject.Signal.connect_simple (Shortcuts_section.as_widget obj :> [`widget] Gobject.obj) ~name:"change-current-page" ~callback ~after:false

end
