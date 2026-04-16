(* Signal handlers for AppChooserButton *)
class app_chooser_button_signals (obj : App_chooser_button.t) =
  object
    method on_activate ~callback =
      Gobject.Signal.connect_simple obj ~name:"activate" ~callback ~after:false
    (** Emitted to when the button is activated.

        The `::activate` signal on `GtkAppChooserButton` is an action signal and
        emitting it causes the button to pop up its dialog. *)

    method on_changed ~callback =
      Gobject.Signal.connect_simple obj ~name:"changed" ~callback ~after:false
    (** Emitted when the active application changes. *)
  end
