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

(* High-level class for CellLayout *)
class cell_layout (obj : Cell_layout.t) : cell_layout_t = object (self)

  method add_attribute : GCell_renderer.cell_renderer_t -> string -> int -> unit =
    fun cell attribute column ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.add_attribute obj cell attribute column)

  method clear : unit -> unit =
    fun () ->
      (Cell_layout.clear obj)

  method clear_attributes : GCell_renderer.cell_renderer_t -> unit =
    fun cell ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.clear_attributes obj cell)

  method get_area : unit -> GCell_area_and__cell_area_context.cell_area_t option =
    fun () ->
      Option.map (fun ret -> new GCell_area_and__cell_area_context.cell_area ret) (Cell_layout.get_area obj)

  method pack_end : GCell_renderer.cell_renderer_t -> bool -> unit =
    fun cell expand ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.pack_end obj cell expand)

  method pack_start : GCell_renderer.cell_renderer_t -> bool -> unit =
    fun cell expand ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.pack_start obj cell expand)

  method reorder : GCell_renderer.cell_renderer_t -> int -> unit =
    fun cell position ->
      let cell = cell#as_cell_renderer in
      (Cell_layout.reorder obj cell position)

    method as_cell_layout = obj
end

