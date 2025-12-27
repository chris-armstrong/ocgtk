(* High-level class for CellView *)
class cell_view (obj : Cell_view.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Cell_view.as_widget obj)

  method get_displayed_row : unit -> Tree_path.t option =
    fun () ->
      (Cell_view.get_displayed_row obj)

  method get_draw_sensitive : unit -> bool =
    fun () ->
      (Cell_view.get_draw_sensitive obj)

  method get_fit_model : unit -> bool =
    fun () ->
      (Cell_view.get_fit_model obj)

  method get_model : unit -> GTree_model.tree_model option =
    fun () ->
      Option.map (fun ret -> new GTree_model.tree_model ret) (Cell_view.get_model obj)

  method set_displayed_row : Tree_path.t option -> unit =
    fun path ->
      (Cell_view.set_displayed_row obj path)

  method set_draw_sensitive : bool -> unit =
    fun draw_sensitive ->
      (Cell_view.set_draw_sensitive obj draw_sensitive)

  method set_fit_model : bool -> unit =
    fun fit_model ->
      (Cell_view.set_fit_model obj fit_model)

  method cell_area = new GCell_area_and__cell_area_context.cell_area (Cell_view.get_cell_area obj)

  method cell_area_context = new GCell_area_and__cell_area_context.cell_area_context (Cell_view.get_cell_area_context obj)

  method as_widget = (Cell_view.as_widget obj)
    method as_cell_view = obj
end

