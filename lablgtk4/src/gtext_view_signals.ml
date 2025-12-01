(* Signal handlers for TextView *)
class text_view_signals (obj : Text_view.t) = object
  method backspace ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"backspace" ~callback ~after:false

  method copy_clipboard ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"copy-clipboard" ~callback ~after:false

  method cut_clipboard ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"cut-clipboard" ~callback ~after:false

  method delete_from_cursor ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"delete-from-cursor" ~callback ~after:false

  method extend_selection ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"extend-selection" ~callback ~after:false

  method insert_at_cursor ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"insert-at-cursor" ~callback ~after:false

  method insert_emoji ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"insert-emoji" ~callback ~after:false

  method move_cursor ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"move-cursor" ~callback ~after:false

  method move_viewport ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"move-viewport" ~callback ~after:false

  method paste_clipboard ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"paste-clipboard" ~callback ~after:false

  method preedit_changed ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"preedit-changed" ~callback ~after:false

  method select_all ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"select-all" ~callback ~after:false

  method set_anchor ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"set-anchor" ~callback ~after:false

  method toggle_cursor_visible ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"toggle-cursor-visible" ~callback ~after:false

  method toggle_overwrite ~callback =
    Gobject.Signal.connect_simple (Text_view.as_widget obj :> [`widget] Gobject.obj) ~name:"toggle-overwrite" ~callback ~after:false

end
