class cell_layout : Cell_layout.t ->
  object
    method add_attribute : #GCell_renderer.cell_renderer -> string -> int -> unit
    method clear : unit -> unit
    method clear_attributes : #GCell_renderer.cell_renderer -> unit
    method get_area : unit -> GCell_area_and__cell_area_context.cell_area option
    method pack_end : #GCell_renderer.cell_renderer -> bool -> unit
    method pack_start : #GCell_renderer.cell_renderer -> bool -> unit
    method reorder : #GCell_renderer.cell_renderer -> int -> unit
    method as_cell_layout : Cell_layout.t
  end

