(* High-level class for CellLayout *)
class cell_layout (obj : Cell_layout.t) = object (self)

  method add_attribute : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> string -> int -> unit =
    fun cell attribute column ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.add_attribute obj cell attribute column)

  method clear : unit -> unit = fun () -> (Cell_layout.clear obj )

  method clear_attributes : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> unit =
    fun cell ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.clear_attributes obj cell)

  method get_area : unit -> GCell_area_and__cell_area_context.cell_area option = fun () -> Option.map (fun ret -> new GCell_area_and__cell_area_context.cell_area ret) (Cell_layout.get_area obj )

  method pack_end : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> bool -> unit =
    fun cell expand ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.pack_end obj cell expand)

  method pack_start : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> bool -> unit =
    fun cell expand ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.pack_start obj cell expand)

  method reorder : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> int -> unit =
    fun cell position ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.reorder obj cell position)

    method as_cell_layout = obj
end

