class type cell_area_box_t = object
    inherit GCell_area_and__cell_area_context.cell_area_t
    method get_spacing : unit -> int
    method pack_end : GCell_renderer.cell_renderer_t -> bool -> bool -> bool -> unit
    method pack_start : GCell_renderer.cell_renderer_t -> bool -> bool -> bool -> unit
    method set_spacing : int -> unit
    method as_cell_area_box : Cell_area_box.t
end

(* High-level class for CellAreaBox *)
class cell_area_box (obj : Cell_area_box.t) : cell_area_box_t = object (self)
  inherit GCell_area_and__cell_area_context.cell_area (Obj.magic obj : Cell_area_and__cell_area_context.Cell_area.t)

  method get_spacing : unit -> int =
    fun () ->
      (Cell_area_box.get_spacing obj)

  method pack_end : GCell_renderer.cell_renderer_t -> bool -> bool -> bool -> unit =
    fun renderer expand align fixed ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_box.pack_end obj renderer expand align fixed)

  method pack_start : GCell_renderer.cell_renderer_t -> bool -> bool -> bool -> unit =
    fun renderer expand align fixed ->
      let renderer = renderer#as_cell_renderer in
      (Cell_area_box.pack_start obj renderer expand align fixed)

  method set_spacing : int -> unit =
    fun spacing ->
      (Cell_area_box.set_spacing obj spacing)

    method as_cell_area_box = obj
end

let new_ () : cell_area_box_t =
  new cell_area_box (Cell_area_box.new_ ())

