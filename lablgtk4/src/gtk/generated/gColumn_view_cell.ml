(* High-level class for ColumnViewCell *)
class column_view_cell (obj : Column_view_cell.t) = object (self)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Column_view_cell.get_child obj)

  method get_focusable : unit -> bool =
    fun () ->
      (Column_view_cell.get_focusable obj)

  method get_position : unit -> int =
    fun () ->
      (Column_view_cell.get_position obj)

  method get_selected : unit -> bool =
    fun () ->
      (Column_view_cell.get_selected obj)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Column_view_cell.set_child obj child)

  method set_focusable : bool -> unit =
    fun focusable ->
      (Column_view_cell.set_focusable obj focusable)

    method as_column_view_cell = obj
end

