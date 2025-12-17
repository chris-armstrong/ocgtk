(* Signal handlers for NativeDialog *)
class native_dialog_signals (obj : Native_dialog.t) = object
  method on_response ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"response" ~callback ~after:false

end
