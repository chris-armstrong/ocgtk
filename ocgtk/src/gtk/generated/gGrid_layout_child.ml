class type grid_layout_child_t = object
    method get_column : unit -> int
    method get_column_span : unit -> int
    method get_row : unit -> int
    method get_row_span : unit -> int
    method set_column : int -> unit
    method set_column_span : int -> unit
    method set_row : int -> unit
    method set_row_span : int -> unit
    method as_grid_layout_child : Grid_layout_child.t
end

(* High-level class for GridLayoutChild *)
class grid_layout_child (obj : Grid_layout_child.t) : grid_layout_child_t = object (self)

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

