(* High-level class for LayoutLine *)
class layout_line (obj : Layout_line.t) = object (self)

  method get_length : unit -> int =
    fun () ->
      (Layout_line.get_length obj)

  method get_resolved_direction : unit -> Pango_enums.direction =
    fun () ->
      (Layout_line.get_resolved_direction obj)

  method get_start_index : unit -> int =
    fun () ->
      (Layout_line.get_start_index obj)

  method is_paragraph_start : unit -> bool =
    fun () ->
      (Layout_line.is_paragraph_start obj)

  method ref : unit -> Layout_line.t option =
    fun () ->
      (Layout_line.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Layout_line.unref obj)

    method as_layout_line = obj
end

