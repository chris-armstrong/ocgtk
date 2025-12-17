(* Signal handlers for CellRendererText *)
class cell_renderer_text_signals (obj : Cell_renderer_text.t) = object
  method on_edited ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"edited" ~callback ~after:false

end
