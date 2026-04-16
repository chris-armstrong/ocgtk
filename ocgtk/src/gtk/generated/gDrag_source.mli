class type drag_source_t = object
  inherit GGesture_single.gesture_single_t
  inherit Gdrag_source_signals.drag_source_signals
  method drag_cancel : unit -> unit
  method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction

  method get_content :
    unit -> Ocgtk_gdk.Gdk.Content_provider.content_provider_t option

  method get_drag : unit -> Ocgtk_gdk.Gdk.Drag.drag_t option
  method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit

  method set_content :
    Ocgtk_gdk.Gdk.Content_provider.content_provider_t option -> unit

  method set_icon :
    Ocgtk_gdk.Gdk.Paintable.paintable_t option -> int -> int -> unit

  method as_drag_source : Drag_source.t
end

class drag_source : Drag_source.t -> drag_source_t

val new_ : unit -> drag_source_t
