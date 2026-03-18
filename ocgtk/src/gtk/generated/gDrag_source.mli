class drag_source : Drag_source.t ->
  object
    inherit Gdrag_source_signals.drag_source_signals
    method drag_cancel : unit -> unit
    method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction
    method get_content : unit -> Ocgtk_gdk.Gdk.content_provider option
    method get_drag : unit -> Ocgtk_gdk.Gdk.drag option
    method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit
    method set_content : #Ocgtk_gdk.Gdk.content_provider option -> unit
    method set_icon : #Ocgtk_gdk.Gdk.paintable option -> int -> int -> unit
    method as_drag_source : Drag_source.t
  end

