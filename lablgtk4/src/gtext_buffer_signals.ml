(* Signal handlers for TextBuffer *)
class text_buffer_signals (obj : Text_buffer.t) = object
  method apply_tag ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"apply-tag" ~callback ~after:false

  method begin_user_action ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"begin-user-action" ~callback ~after:false

  method changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

  method delete_range ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"delete-range" ~callback ~after:false

  method end_user_action ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"end-user-action" ~callback ~after:false

  method insert_child_anchor ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"insert-child-anchor" ~callback ~after:false

  method insert_paintable ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"insert-paintable" ~callback ~after:false

  method insert_text ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"insert-text" ~callback ~after:false

  method mark_deleted ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"mark-deleted" ~callback ~after:false

  method mark_set ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"mark-set" ~callback ~after:false

  method modified_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"modified-changed" ~callback ~after:false

  method paste_done ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"paste-done" ~callback ~after:false

  method redo ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"redo" ~callback ~after:false

  method remove_tag ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"remove-tag" ~callback ~after:false

  method undo ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"undo" ~callback ~after:false

end
