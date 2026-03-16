(* High-level class for BorderNode *)
class border_node (obj : Border_node.t) = object (self)

  method get_outline : unit -> Rounded_rect.t =
    fun () ->
      (Border_node.get_outline obj)

  method get_widths : unit -> float array =
    fun () ->
      (Border_node.get_widths obj)

    method as_border_node = obj
end

