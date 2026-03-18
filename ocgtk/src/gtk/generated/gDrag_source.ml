(* Signal class defined in gdrag_source_signals.ml *)

(* High-level class for DragSource *)
class drag_source (obj : Drag_source.t) = object (self)
  inherit Gdrag_source_signals.drag_source_signals obj

  method drag_cancel : unit -> unit =
    fun () ->
      (Drag_source.drag_cancel obj)

  method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction =
    fun () ->
      (Drag_source.get_actions obj)

  method get_content : unit -> Ocgtk_gdk.Gdk.content_provider option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.content_provider ret) (Drag_source.get_content obj)

  method get_drag : unit -> Ocgtk_gdk.Gdk.drag option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.drag ret) (Drag_source.get_drag obj)

  method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit =
    fun actions ->
      (Drag_source.set_actions obj actions)

  method set_content : 'p1. (#Ocgtk_gdk.Gdk.content_provider as 'p1) option -> unit =
    fun content ->
      let content = Option.map (fun (c) -> c#as_content_provider) content in
      (Drag_source.set_content obj content)

  method set_icon : 'p1. (#Ocgtk_gdk.Gdk.paintable as 'p1) option -> int -> int -> unit =
    fun paintable hot_x hot_y ->
      let paintable = Option.map (fun (c) -> c#as_paintable) paintable in
      (Drag_source.set_icon obj paintable hot_x hot_y)

    method as_drag_source = obj
end

