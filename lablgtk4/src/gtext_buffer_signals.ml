(* Signal handlers for TextBuffer *)
class text_buffer_signals (obj : Text_buffer_and__text_iter_and__text_mark.Text_buffer.t) = object
  method on_apply_tag ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"apply-tag" ~callback ~after:false

  method on_begin_user_action ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"begin-user-action" ~callback ~after:false

  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

  method on_delete_range ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"delete-range" ~callback ~after:false

  method on_end_user_action ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"end-user-action" ~callback ~after:false

  method on_insert_child_anchor ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"insert-child-anchor" ~callback ~after:false

  method on_insert_paintable ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"insert-paintable" ~callback ~after:false

  method on_insert_text ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"insert-text" ~callback ~after:false

  method on_mark_deleted ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"mark-deleted" ~callback ~after:false

  method on_mark_set ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"mark-set" ~callback ~after:false

  method on_modified_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"modified-changed" ~callback ~after:false

  method on_paste_done ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"paste-done" ~callback ~after:false

  method on_redo ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"redo" ~callback ~after:false

  method on_remove_tag ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"remove-tag" ~callback ~after:false

  method on_undo ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"undo" ~callback ~after:false

end
