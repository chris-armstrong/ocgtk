(* High-level class for GridLayoutChild *)
class grid_layout_child (obj : Grid_layout_child.t) = object (self)

  method get_column : unit -> int =
    fun () ->
      (Grid_layout_child.get_column obj)

  method get_column_span : unit -> int =
    fun () ->
      (Grid_layout_child.get_column_span obj)

  method get_row : unit -> int =
    fun () ->
      (Grid_layout_child.get_row obj)

  method get_row_span : unit -> int =
    fun () ->
      (Grid_layout_child.get_row_span obj)

  method set_column : int -> unit =
    fun column ->
      (Grid_layout_child.set_column obj column)

  method set_column_span : int -> unit =
    fun span ->
      (Grid_layout_child.set_column_span obj span)

  method set_row : int -> unit =
    fun row ->
      (Grid_layout_child.set_row obj row)

  method set_row_span : int -> unit =
    fun span ->
      (Grid_layout_child.set_row_span obj span)

    method as_grid_layout_child = obj
end

