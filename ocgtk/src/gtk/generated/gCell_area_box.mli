class type cell_area_box_t = object
    inherit GCell_area_and__cell_area_context.cell_area_t
    method get_spacing : unit -> int
    method pack_end : GCell_renderer.cell_renderer_t -> bool -> bool -> bool -> unit
    method pack_start : GCell_renderer.cell_renderer_t -> bool -> bool -> bool -> unit
    method set_spacing : int -> unit
    method as_cell_area_box : Cell_area_box.t
end

class cell_area_box : Cell_area_box.t -> cell_area_box_t

