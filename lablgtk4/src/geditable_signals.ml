(* Signal handlers for Editable *)
class editable_signals (obj : Editable.t) = object
  method on_changed ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"changed" ~callback ~after:false

  method on_delete_text ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"delete-text" ~callback ~after:false

  method on_insert_text ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"insert-text" ~callback ~after:false

end
