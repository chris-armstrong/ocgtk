class cell_area_box : Cell_area_box.t ->
  object
    method get_spacing : unit -> int
    method pack_end : #GCell_renderer.cell_renderer -> bool -> bool -> bool -> unit
    method pack_start : #GCell_renderer.cell_renderer -> bool -> bool -> bool -> unit
    method set_spacing : int -> unit
    method as_cell_area_box : Cell_area_box.t
  end

