class type border_node_t = object
    method get_colors : unit -> Ocgtk_gdk.Gdk.rgb_a_t
    method get_outline : unit -> Rounded_rect.t
    method get_widths : unit -> float array
    method as_border_node : Border_node.t
end

(* High-level class for BorderNode *)
class border_node (obj : Border_node.t) : border_node_t = object (self)

  method get_colors : unit -> Ocgtk_gdk.Gdk.rgb_a_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.rgb_a(Border_node.get_colors obj)

  method get_outline : unit -> Rounded_rect.t =
    fun () ->
      (Border_node.get_outline obj)

  method get_widths : unit -> float array =
    fun () ->
      (Border_node.get_widths obj)

    method as_border_node = obj
end

