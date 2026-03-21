class type cell_layout_t = object
    method add_attribute : GCell_renderer.cell_renderer_t -> string -> int -> unit
    method clear : unit -> unit
    method clear_attributes : GCell_renderer.cell_renderer_t -> unit
    method get_area : unit -> GCell_area_and__cell_area_context.cell_area_t option
    method pack_end : GCell_renderer.cell_renderer_t -> bool -> unit
    method pack_start : GCell_renderer.cell_renderer_t -> bool -> unit
    method reorder : GCell_renderer.cell_renderer_t -> int -> unit
    method as_cell_layout : Cell_layout.t
end

class cell_layout : Cell_layout.t -> cell_layout_t

