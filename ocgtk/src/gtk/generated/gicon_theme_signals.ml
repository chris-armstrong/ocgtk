(* Signal handlers for IconTheme *)
class icon_theme_signals (obj : Icon_theme.t) = object
  (** Emitted when the icon theme changes.

This can happen because current icon theme is switched or
because GTK detects that a change has occurred in the
contents of the current icon theme. *)
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

end
