(* Signal handlers for EntryBuffer *)
class entry_buffer_signals (obj : Entry_buffer.t) = object
  method deleted_text ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"deleted-text" ~callback ~after:false

  method inserted_text ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"inserted-text" ~callback ~after:false

end
