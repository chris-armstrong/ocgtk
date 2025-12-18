(* High-level class for CellView *)
class cell_view (obj : Cell_view.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Cell_view.as_widget obj)

  method draw_sensitive = Cell_view.get_draw_sensitive obj
  method set_draw_sensitive v = Cell_view.set_draw_sensitive obj v

  method fit_model = Cell_view.get_fit_model obj
  method set_fit_model v = Cell_view.set_fit_model obj v

  method get_displayed_row : unit -> Tree_path.t option = fun () -> (Cell_view.get_displayed_row obj )

  method get_model : unit -> GTree_model.tree_model option = fun () -> Option.map (fun ret -> new GTree_model.tree_model ret) (Cell_view.get_model obj )

  method set_displayed_row : Tree_path.t option -> unit = fun path -> (Cell_view.set_displayed_row obj path)

  method set_model : GTree_model.tree_model option -> unit = fun model -> (Cell_view.set_model obj ( model |> Option.map (fun x -> x#as_tree_model) ))

  method as_widget = (Cell_view.as_widget obj)
    method as_cell_view = obj
end

