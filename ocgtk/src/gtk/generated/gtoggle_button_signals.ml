(* Signal handlers for ToggleButton *)
class toggle_button_signals (obj : Toggle_button.t) =
  object
    method on_toggled ~callback =
      Gobject.Signal.connect_simple obj ~name:"toggled" ~callback ~after:false
    (** Emitted whenever the `GtkToggleButton`'s state is changed. *)
  end
