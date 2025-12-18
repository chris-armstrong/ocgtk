(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

(* Signal class defined in gtree_selection_signals.ml *)

class tree_selection (obj : Tree_selection_and__tree_view.Tree_selection.t) = object (self)
  inherit Gtree_selection_signals.tree_selection_signals obj

  method count_selected_rows : unit -> int = fun () -> (Tree_selection_and__tree_view.Tree_selection.count_selected_rows obj )

  method get_mode : unit -> Gtk_enums.selectionmode = fun () -> (Tree_selection_and__tree_view.Tree_selection.get_mode obj )

  method get_tree_view : unit -> tree_view = fun () -> new  tree_view(Tree_selection_and__tree_view.Tree_selection.get_tree_view obj )

  method iter_is_selected : Tree_iter.t -> bool = fun iter -> (Tree_selection_and__tree_view.Tree_selection.iter_is_selected obj iter)

  method path_is_selected : Tree_path.t -> bool = fun path -> (Tree_selection_and__tree_view.Tree_selection.path_is_selected obj path)

  method select_all : unit -> unit = fun () -> (Tree_selection_and__tree_view.Tree_selection.select_all obj )

  method select_iter : Tree_iter.t -> unit = fun iter -> (Tree_selection_and__tree_view.Tree_selection.select_iter obj iter)

  method select_path : Tree_path.t -> unit = fun path -> (Tree_selection_and__tree_view.Tree_selection.select_path obj path)

  method select_range : Tree_path.t -> Tree_path.t -> unit = fun start_path end_path -> (Tree_selection_and__tree_view.Tree_selection.select_range obj start_path end_path)

  method set_mode : Gtk_enums.selectionmode -> unit = fun type_ -> (Tree_selection_and__tree_view.Tree_selection.set_mode obj type_)

  method unselect_all : unit -> unit = fun () -> (Tree_selection_and__tree_view.Tree_selection.unselect_all obj )

  method unselect_iter : Tree_iter.t -> unit = fun iter -> (Tree_selection_and__tree_view.Tree_selection.unselect_iter obj iter)

  method unselect_path : Tree_path.t -> unit = fun path -> (Tree_selection_and__tree_view.Tree_selection.unselect_path obj path)

  method unselect_range : Tree_path.t -> Tree_path.t -> unit = fun start_path end_path -> (Tree_selection_and__tree_view.Tree_selection.unselect_range obj start_path end_path)

    method as_tree_selection = obj
end
(* Signal class defined in gtree_view_signals.ml *)


and tree_view (obj : Tree_selection_and__tree_view.Tree_view.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Tree_selection_and__tree_view.Tree_view.as_widget obj)
  inherit Gtree_view_signals.tree_view_signals obj

  method activate_on_single_click = Tree_selection_and__tree_view.Tree_view.get_activate_on_single_click obj
  method set_activate_on_single_click v = Tree_selection_and__tree_view.Tree_view.set_activate_on_single_click obj v

  method enable_search = Tree_selection_and__tree_view.Tree_view.get_enable_search obj
  method set_enable_search v = Tree_selection_and__tree_view.Tree_view.set_enable_search obj v

  method enable_tree_lines = Tree_selection_and__tree_view.Tree_view.get_enable_tree_lines obj
  method set_enable_tree_lines v = Tree_selection_and__tree_view.Tree_view.set_enable_tree_lines obj v

  method fixed_height_mode = Tree_selection_and__tree_view.Tree_view.get_fixed_height_mode obj
  method set_fixed_height_mode v = Tree_selection_and__tree_view.Tree_view.set_fixed_height_mode obj v

  method headers_clickable = Tree_selection_and__tree_view.Tree_view.get_headers_clickable obj
  method set_headers_clickable v = Tree_selection_and__tree_view.Tree_view.set_headers_clickable obj v

  method headers_visible = Tree_selection_and__tree_view.Tree_view.get_headers_visible obj
  method set_headers_visible v = Tree_selection_and__tree_view.Tree_view.set_headers_visible obj v

  method hover_expand = Tree_selection_and__tree_view.Tree_view.get_hover_expand obj
  method set_hover_expand v = Tree_selection_and__tree_view.Tree_view.set_hover_expand obj v

  method hover_selection = Tree_selection_and__tree_view.Tree_view.get_hover_selection obj
  method set_hover_selection v = Tree_selection_and__tree_view.Tree_view.set_hover_selection obj v

  method level_indentation = Tree_selection_and__tree_view.Tree_view.get_level_indentation obj
  method set_level_indentation v = Tree_selection_and__tree_view.Tree_view.set_level_indentation obj v

  method reorderable = Tree_selection_and__tree_view.Tree_view.get_reorderable obj
  method set_reorderable v = Tree_selection_and__tree_view.Tree_view.set_reorderable obj v

  method rubber_banding = Tree_selection_and__tree_view.Tree_view.get_rubber_banding obj
  method set_rubber_banding v = Tree_selection_and__tree_view.Tree_view.set_rubber_banding obj v

  method search_column = Tree_selection_and__tree_view.Tree_view.get_search_column obj
  method set_search_column v = Tree_selection_and__tree_view.Tree_view.set_search_column obj v

  method show_expanders = Tree_selection_and__tree_view.Tree_view.get_show_expanders obj
  method set_show_expanders v = Tree_selection_and__tree_view.Tree_view.set_show_expanders obj v

  method tooltip_column = Tree_selection_and__tree_view.Tree_view.get_tooltip_column obj
  method set_tooltip_column v = Tree_selection_and__tree_view.Tree_view.set_tooltip_column obj v

  method append_column : 'p1. (#GTree_view_column.tree_view_column as 'p1) -> int = fun column -> (Tree_selection_and__tree_view.Tree_view.append_column obj ( column#as_tree_view_column ))

  method collapse_all : unit -> unit = fun () -> (Tree_selection_and__tree_view.Tree_view.collapse_all obj )

  method collapse_row : Tree_path.t -> bool = fun path -> (Tree_selection_and__tree_view.Tree_view.collapse_row obj path)

  method columns_autosize : unit -> unit = fun () -> (Tree_selection_and__tree_view.Tree_view.columns_autosize obj )

  method expand_all : unit -> unit = fun () -> (Tree_selection_and__tree_view.Tree_view.expand_all obj )

  method expand_row : Tree_path.t -> bool -> bool = fun path open_all -> (Tree_selection_and__tree_view.Tree_view.expand_row obj path open_all)

  method expand_to_path : Tree_path.t -> unit = fun path -> (Tree_selection_and__tree_view.Tree_view.expand_to_path obj path)

  method get_column : int -> GTree_view_column.tree_view_column option = fun n -> Option.map (fun ret -> new GTree_view_column.tree_view_column ret) (Tree_selection_and__tree_view.Tree_view.get_column obj n)

  method get_expander_column : unit -> GTree_view_column.tree_view_column option = fun () -> Option.map (fun ret -> new GTree_view_column.tree_view_column ret) (Tree_selection_and__tree_view.Tree_view.get_expander_column obj )

  method get_grid_lines : unit -> Gtk_enums.treeviewgridlines = fun () -> (Tree_selection_and__tree_view.Tree_view.get_grid_lines obj )

  method get_model : unit -> GTree_model.tree_model option = fun () -> Option.map (fun ret -> new GTree_model.tree_model ret) (Tree_selection_and__tree_view.Tree_view.get_model obj )

  method get_n_columns : unit -> int = fun () -> (Tree_selection_and__tree_view.Tree_view.get_n_columns obj )

  method get_search_entry : unit -> GEditable.editable option = fun () -> Option.map (fun ret -> new GEditable.editable ret) (Tree_selection_and__tree_view.Tree_view.get_search_entry obj )

  method get_selection : unit -> tree_selection = fun () -> new  tree_selection(Tree_selection_and__tree_view.Tree_view.get_selection obj )

  method insert_column : 'p1. (#GTree_view_column.tree_view_column as 'p1) -> int -> int = fun column position -> (Tree_selection_and__tree_view.Tree_view.insert_column obj ( column#as_tree_view_column ) position)

  method is_rubber_banding_active : unit -> bool = fun () -> (Tree_selection_and__tree_view.Tree_view.is_rubber_banding_active obj )

  method move_column_after : 'p1 'p2. (#GTree_view_column.tree_view_column as 'p1) -> (#GTree_view_column.tree_view_column as 'p2) option -> unit = fun column base_column -> (Tree_selection_and__tree_view.Tree_view.move_column_after obj ( column#as_tree_view_column ) ( base_column |> Option.map (fun x -> x#as_tree_view_column) ))

  method remove_column : 'p1. (#GTree_view_column.tree_view_column as 'p1) -> int = fun column -> (Tree_selection_and__tree_view.Tree_view.remove_column obj ( column#as_tree_view_column ))

  method row_activated : 'p1. Tree_path.t -> (#GTree_view_column.tree_view_column as 'p1) option -> unit = fun path column -> (Tree_selection_and__tree_view.Tree_view.row_activated obj path ( column |> Option.map (fun x -> x#as_tree_view_column) ))

  method row_expanded : Tree_path.t -> bool = fun path -> (Tree_selection_and__tree_view.Tree_view.row_expanded obj path)

  method scroll_to_cell : 'p1. Tree_path.t option -> (#GTree_view_column.tree_view_column as 'p1) option -> bool -> float -> float -> unit = fun path column use_align row_align col_align -> (Tree_selection_and__tree_view.Tree_view.scroll_to_cell obj path ( column |> Option.map (fun x -> x#as_tree_view_column) ) use_align row_align col_align)

  method scroll_to_point : int -> int -> unit = fun tree_x tree_y -> (Tree_selection_and__tree_view.Tree_view.scroll_to_point obj tree_x tree_y)

  (* method set_cursor = ... *) (* CONFLICT: incompatible signature with parent method *)

  method set_cursor_on_cell : 'p1 'p2. Tree_path.t -> (#GTree_view_column.tree_view_column as 'p1) option -> (#GCell_renderer.cell_renderer as 'p2) option -> bool -> unit =
    fun path focus_column focus_cell start_editing ->
      let focus_column = Option.map (fun (c) -> c#as_tree_view_column) focus_column in
      let focus_cell = Option.map (fun (c) -> c#as_cell_renderer) focus_cell in
      (Tree_selection_and__tree_view.Tree_view.set_cursor_on_cell obj path focus_column focus_cell start_editing)

  method set_drag_dest_row : Tree_path.t option -> Gtk_enums.treeviewdropposition -> unit = fun path pos -> (Tree_selection_and__tree_view.Tree_view.set_drag_dest_row obj path pos)

  method set_expander_column : 'p1. (#GTree_view_column.tree_view_column as 'p1) option -> unit = fun column -> (Tree_selection_and__tree_view.Tree_view.set_expander_column obj ( column |> Option.map (fun x -> x#as_tree_view_column) ))

  method set_grid_lines : Gtk_enums.treeviewgridlines -> unit = fun grid_lines -> (Tree_selection_and__tree_view.Tree_view.set_grid_lines obj grid_lines)

  method set_model : GTree_model.tree_model option -> unit = fun model -> (Tree_selection_and__tree_view.Tree_view.set_model obj ( model |> Option.map (fun x -> x#as_tree_model) ))

  method set_search_entry : GEditable.editable option -> unit = fun entry -> (Tree_selection_and__tree_view.Tree_view.set_search_entry obj ( entry |> Option.map (fun x -> x#as_editable) ))

  method set_tooltip_cell : 'p1 'p2 'p3. (#GTooltip.tooltip as 'p1) -> Tree_path.t option -> (#GTree_view_column.tree_view_column as 'p2) option -> (#GCell_renderer.cell_renderer as 'p3) option -> unit =
    fun tooltip path column cell ->
      let tooltip = tooltip#as_tooltip in
      let column = Option.map (fun (c) -> c#as_tree_view_column) column in
      let cell = Option.map (fun (c) -> c#as_cell_renderer) cell in
      (Tree_selection_and__tree_view.Tree_view.set_tooltip_cell obj tooltip path column cell)

  method set_tooltip_row : 'p1. (#GTooltip.tooltip as 'p1) -> Tree_path.t -> unit = fun tooltip path -> (Tree_selection_and__tree_view.Tree_view.set_tooltip_row obj ( tooltip#as_tooltip ) path)

  method unset_rows_drag_dest : unit -> unit = fun () -> (Tree_selection_and__tree_view.Tree_view.unset_rows_drag_dest obj )

  method unset_rows_drag_source : unit -> unit = fun () -> (Tree_selection_and__tree_view.Tree_view.unset_rows_drag_source obj )

  method as_widget = (Tree_selection_and__tree_view.Tree_view.as_widget obj)
    method as_tree_view = obj
end
