(* Signal handlers for Text *)
class text_signals (obj : Text.t) = object
  method activate ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"activate" ~callback ~after:false

  method backspace ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"backspace" ~callback ~after:false

  method copy_clipboard ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"copy-clipboard" ~callback ~after:false

  method cut_clipboard ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"cut-clipboard" ~callback ~after:false

  method delete_from_cursor ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"delete-from-cursor" ~callback ~after:false

  method insert_at_cursor ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"insert-at-cursor" ~callback ~after:false

  method insert_emoji ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"insert-emoji" ~callback ~after:false

  method move_cursor ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"move-cursor" ~callback ~after:false

  method paste_clipboard ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"paste-clipboard" ~callback ~after:false

  method preedit_changed ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"preedit-changed" ~callback ~after:false

  method toggle_overwrite ~callback =
    Gobject.Signal.connect_simple (Text.as_widget obj :> [`widget] Gobject.obj) ~name:"toggle-overwrite" ~callback ~after:false

end
