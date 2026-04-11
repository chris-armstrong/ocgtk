(* Signal handlers for EventControllerKey *)
class event_controller_key_signals (obj : Event_controller_key.t) =
  object
    method on_im_update ~callback =
      Gobject.Signal.connect_simple obj ~name:"im-update" ~callback ~after:false
    (** Emitted whenever the input method context filters away
a keypress and prevents the @controller receiving it.

See [method@Gtk.EventControllerKey.set_im_context] and
[method@Gtk.IMContext.filter_keypress]. *)
  end
