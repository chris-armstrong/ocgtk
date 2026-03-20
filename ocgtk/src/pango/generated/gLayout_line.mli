class type layout_line_t = object
    method get_length : unit -> int
    method get_resolved_direction : unit -> Pango_enums.direction
    method get_start_index : unit -> int
    method is_paragraph_start : unit -> bool
    method ref : unit -> Layout_line.t option
    method unref : unit -> unit
    method as_layout_line : Layout_line.t
end

class layout_line : Layout_line.t -> layout_line_t

