class type drawing_area_t = object
  inherit Widget.widget_t

  (** {2:signals Signals} *)

  method on_resize :
    ?after:bool ->
    callback:(width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted once when the widget is realized, and then each time the widget is
      changed while realized.

      This is useful in order to keep state up to date with the widget size,
      like for instance a backing surface. *)

  (** {2:methods Methods} *)

  method get_content_height : unit -> int
  (** Retrieves the content height of the [GtkDrawingArea]. *)

  method get_content_width : unit -> int
  (** Retrieves the content width of the [GtkDrawingArea]. *)

  method set_content_height : int -> unit
  (** Sets the desired height of the contents of the drawing area.

      Note that because widgets may be allocated larger sizes than they
      requested, it is possible that the actual height passed to your draw
      function is larger than the height set here. You can use
      [Gtk.Widget.set_valign] to avoid that.

      If the height is set to 0 (the default), the drawing area may disappear.
  *)

  method set_content_width : int -> unit
  (** Sets the desired width of the contents of the drawing area.

      Note that because widgets may be allocated larger sizes than they
      requested, it is possible that the actual width passed to your draw
      function is larger than the width set here. You can use
      [Gtk.Widget.set_halign] to avoid that.

      If the width is set to 0 (the default), the drawing area may disappear. *)

  (** {2:conversions Conversions} *)

  method as_drawing_area : Raw.Drawing_area.t
end

(* High-level class for DrawingArea *)
class drawing_area (obj : Raw.Drawing_area.t) : drawing_area_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method on_resize ?(after = false) ~callback () =
      Raw.Drawing_area.on_resize ~after self#as_drawing_area ~callback

    method get_content_height : unit -> int =
      fun () -> Raw.Drawing_area.get_content_height obj

    method get_content_width : unit -> int =
      fun () -> Raw.Drawing_area.get_content_width obj

    method set_content_height : int -> unit =
      fun height -> Raw.Drawing_area.set_content_height obj height

    method set_content_width : int -> unit =
      fun width -> Raw.Drawing_area.set_content_width obj width

    method as_drawing_area = obj
  end

let new_ () : drawing_area_t = new drawing_area (Raw.Drawing_area.new_ ())
