class type cell_area_box_t = object
  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_area_t
  inherit Orientable.orientable_t
  method get_spacing : unit -> int
  method set_spacing : int -> unit
  method as_cell_area_box : Raw.Cell_area_box.t
end

class cell_area_box : Raw.Cell_area_box.t -> cell_area_box_t

val new_ : unit -> cell_area_box_t
