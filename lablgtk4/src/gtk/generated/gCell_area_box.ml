(* High-level class for CellAreaBox *)
class cell_area_box (obj : Cell_area_box.t) = object (self)

  method spacing = Cell_area_box.get_spacing obj
  method set_spacing v = Cell_area_box.set_spacing obj v

  method pack_end : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> bool -> bool -> bool -> unit =
    fun renderer expand align fixed ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_box.pack_end obj renderer expand align fixed)

  method pack_start : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> bool -> bool -> bool -> unit =
    fun renderer expand align fixed ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_box.pack_start obj renderer expand align fixed)

    method as_cell_area_box = obj
end

