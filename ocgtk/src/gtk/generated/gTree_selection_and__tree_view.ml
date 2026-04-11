(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type tree_selection_t = object
    inherit Gtree_selection_signals.tree_selection_signals
    method count_selected_rows : unit -> int
    method get_mode : unit -> Gtk_enums.selectionmode
    method get_tree_view : unit -> tree_view_t
    method iter_is_selected : Tree_iter.t -> bool
    method path_is_selected : Tree_path.t -> bool
    method select_all : unit -> unit
    method select_iter : Tree_iter.t -> unit
    method select_path : Tree_path.t -> unit
    method select_range : Tree_path.t -> Tree_path.t -> unit
    method set_mode : Gtk_enums.selectionmode -> unit
    method unselect_all : unit -> unit
    method unselect_iter : Tree_iter.t -> unit
    method unselect_path : Tree_path.t -> unit
    method unselect_range : Tree_path.t -> Tree_path.t -> unit
    method as_tree_selection : Tree_selection_and__tree_view.Tree_selection.t
end

and tree_view_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GScrollable.scrollable_t
    inherit Gtree_view_signals.tree_view_signals
    method append_column : GTree_view_column.tree_view_column_t -> int
    method collapse_all : unit -> unit
    method collapse_row : Tree_path.t -> bool
    method columns_autosize : unit -> unit
    method create_row_drag_icon : Tree_path.t -> Ocgtk_gdk.Gdk.Paintable.paintable_t option
    method enable_model_drag_dest : Ocgtk_gdk.Gdk.Content_formats.content_formats_t -> Ocgtk_gdk.Gdk.dragaction -> unit
    method enable_model_drag_source : Ocgtk_gdk.Gdk.modifiertype -> Ocgtk_gdk.Gdk.Content_formats.content_formats_t -> Ocgtk_gdk.Gdk.dragaction -> unit
    method expand_all : unit -> unit
    method expand_row : Tree_path.t -> bool -> bool
    method expand_to_path : Tree_path.t -> unit
    method get_activate_on_single_click : unit -> bool
    method get_column : int -> GTree_view_column.tree_view_column_t option
    method get_columns : unit -> Tree_view_column.t list
    method get_enable_search : unit -> bool
    method get_enable_tree_lines : unit -> bool
    method get_expander_column : unit -> GTree_view_column.tree_view_column_t option
    method get_fixed_height_mode : unit -> bool
    method get_grid_lines : unit -> Gtk_enums.treeviewgridlines
    method get_headers_clickable : unit -> bool
    method get_headers_visible : unit -> bool
    method get_hover_expand : unit -> bool
    method get_hover_selection : unit -> bool
    method get_level_indentation : unit -> int
    method get_model : unit -> GTree_model.tree_model_t option
    method get_n_columns : unit -> int
    method get_reorderable : unit -> bool
    method get_rubber_banding : unit -> bool
    method get_search_column : unit -> int
    method get_search_entry : unit -> GEditable.editable_t option
    method get_selection : unit -> tree_selection_t
    method get_show_expanders : unit -> bool
    method get_tooltip_column : unit -> int
    method insert_column : GTree_view_column.tree_view_column_t -> int -> int
    method is_rubber_banding_active : unit -> bool
    method move_column_after : GTree_view_column.tree_view_column_t -> GTree_view_column.tree_view_column_t option -> unit
    method remove_column : GTree_view_column.tree_view_column_t -> int
    method row_activated : Tree_path.t -> GTree_view_column.tree_view_column_t option -> unit
    method row_expanded : Tree_path.t -> bool
    method scroll_to_cell : Tree_path.t option -> GTree_view_column.tree_view_column_t option -> bool -> float -> float -> unit
    method scroll_to_point : int -> int -> unit
    method set_activate_on_single_click : bool -> unit
    method set_cursor_on_cell : Tree_path.t -> GTree_view_column.tree_view_column_t option -> GCell_renderer.cell_renderer_t option -> bool -> unit
    method set_drag_dest_row : Tree_path.t option -> Gtk_enums.treeviewdropposition -> unit
    method set_enable_search : bool -> unit
    method set_enable_tree_lines : bool -> unit
    method set_expander_column : GTree_view_column.tree_view_column_t option -> unit
    method set_fixed_height_mode : bool -> unit
    method set_grid_lines : Gtk_enums.treeviewgridlines -> unit
    method set_headers_clickable : bool -> unit
    method set_headers_visible : bool -> unit
    method set_hover_expand : bool -> unit
    method set_hover_selection : bool -> unit
    method set_level_indentation : int -> unit
    method set_model : GTree_model.tree_model_t option -> unit
    method set_reorderable : bool -> unit
    method set_rubber_banding : bool -> unit
    method set_search_column : int -> unit
    method set_search_entry : GEditable.editable_t option -> unit
    method set_show_expanders : bool -> unit
    method set_tooltip_cell : GTooltip.tooltip_t -> Tree_path.t option -> GTree_view_column.tree_view_column_t option -> GCell_renderer.cell_renderer_t option -> unit
    method set_tooltip_column : int -> unit
    method set_tooltip_row : GTooltip.tooltip_t -> Tree_path.t -> unit
    method unset_rows_drag_dest : unit -> unit
    method unset_rows_drag_source : unit -> unit
    method enable_grid_lines : Gtk_enums.treeviewgridlines
    method set_enable_grid_lines : Gtk_enums.treeviewgridlines -> unit
    method as_tree_view : Tree_selection_and__tree_view.Tree_view.t
end


(* Signal class defined in gtree_selection_signals.ml *)

class tree_selection (obj : Tree_selection_and__tree_view.Tree_selection.t) : tree_selection_t = object (self)
  inherit Gtree_selection_signals.tree_selection_signals obj

  method count_selected_rows : unit -> int =
    fun () ->
      (Tree_selection_and__tree_view.Tree_selection.count_selected_rows obj)

  method get_mode : unit -> Gtk_enums.selectionmode =
    fun () ->
      (Tree_selection_and__tree_view.Tree_selection.get_mode obj)

  method get_tree_view : unit -> tree_view_t =
    fun () ->
      new  tree_view(Tree_selection_and__tree_view.Tree_selection.get_tree_view obj)

  method iter_is_selected : Tree_iter.t -> bool =
    fun iter ->
      (Tree_selection_and__tree_view.Tree_selection.iter_is_selected obj iter)

  method path_is_selected : Tree_path.t -> bool =
    fun path ->
      (Tree_selection_and__tree_view.Tree_selection.path_is_selected obj path)

  method select_all : unit -> unit =
    fun () ->
      (Tree_selection_and__tree_view.Tree_selection.select_all obj)

  method select_iter : Tree_iter.t -> unit =
    fun iter ->
      (Tree_selection_and__tree_view.Tree_selection.select_iter obj iter)

  method select_path : Tree_path.t -> unit =
    fun path ->
      (Tree_selection_and__tree_view.Tree_selection.select_path obj path)

  method select_range : Tree_path.t -> Tree_path.t -> unit =
    fun start_path end_path ->
      (Tree_selection_and__tree_view.Tree_selection.select_range obj start_path end_path)

  method set_mode : Gtk_enums.selectionmode -> unit =
    fun type_ ->
      (Tree_selection_and__tree_view.Tree_selection.set_mode obj type_)

  method unselect_all : unit -> unit =
    fun () ->
      (Tree_selection_and__tree_view.Tree_selection.unselect_all obj)

  method unselect_iter : Tree_iter.t -> unit =
    fun iter ->
      (Tree_selection_and__tree_view.Tree_selection.unselect_iter obj iter)

  method unselect_path : Tree_path.t -> unit =
    fun path ->
      (Tree_selection_and__tree_view.Tree_selection.unselect_path obj path)

  method unselect_range : Tree_path.t -> Tree_path.t -> unit =
    fun start_path end_path ->
      (Tree_selection_and__tree_view.Tree_selection.unselect_range obj start_path end_path)

    method as_tree_selection = obj
end
(* Signal class defined in gtree_view_signals.ml *)


and tree_view (obj : Tree_selection_and__tree_view.Tree_view.t) : tree_view_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit GScrollable.scrollable (Scrollable.from_gobject obj)
  inherit Gtree_view_signals.tree_view_signals obj

  method append_column : GTree_view_column.tree_view_column_t -> int =
    fun column ->
      let column = column#as_tree_view_column in
      (Tree_selection_and__tree_view.Tree_view.append_column obj column)

  method collapse_all : unit -> unit =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.collapse_all obj)

  method collapse_row : Tree_path.t -> bool =
    fun path ->
      (Tree_selection_and__tree_view.Tree_view.collapse_row obj path)

  method columns_autosize : unit -> unit =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.columns_autosize obj)

  method create_row_drag_icon : Tree_path.t -> Ocgtk_gdk.Gdk.Paintable.paintable_t option =
    fun path ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Paintable.paintable ret) (Tree_selection_and__tree_view.Tree_view.create_row_drag_icon obj path)

  method enable_model_drag_dest : Ocgtk_gdk.Gdk.Content_formats.content_formats_t -> Ocgtk_gdk.Gdk.dragaction -> unit =
    fun formats actions ->
      let formats = formats#as_content_formats in
      (Tree_selection_and__tree_view.Tree_view.enable_model_drag_dest obj formats actions)

  method enable_model_drag_source : Ocgtk_gdk.Gdk.modifiertype -> Ocgtk_gdk.Gdk.Content_formats.content_formats_t -> Ocgtk_gdk.Gdk.dragaction -> unit =
    fun start_button_mask formats actions ->
      let formats = formats#as_content_formats in
      (Tree_selection_and__tree_view.Tree_view.enable_model_drag_source obj start_button_mask formats actions)

  method expand_all : unit -> unit =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.expand_all obj)

  method expand_row : Tree_path.t -> bool -> bool =
    fun path open_all ->
      (Tree_selection_and__tree_view.Tree_view.expand_row obj path open_all)

  method expand_to_path : Tree_path.t -> unit =
    fun path ->
      (Tree_selection_and__tree_view.Tree_view.expand_to_path obj path)

  method get_activate_on_single_click : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_activate_on_single_click obj)

  method get_column : int -> GTree_view_column.tree_view_column_t option =
    fun n ->
      Option.map (fun ret -> new GTree_view_column.tree_view_column ret) (Tree_selection_and__tree_view.Tree_view.get_column obj n)

  method get_columns : unit -> Tree_view_column.t list =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_columns obj)

  method get_enable_search : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_enable_search obj)

  method get_enable_tree_lines : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_enable_tree_lines obj)

  method get_expander_column : unit -> GTree_view_column.tree_view_column_t option =
    fun () ->
      Option.map (fun ret -> new GTree_view_column.tree_view_column ret) (Tree_selection_and__tree_view.Tree_view.get_expander_column obj)

  method get_fixed_height_mode : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_fixed_height_mode obj)

  method get_grid_lines : unit -> Gtk_enums.treeviewgridlines =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_grid_lines obj)

  method get_headers_clickable : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_headers_clickable obj)

  method get_headers_visible : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_headers_visible obj)

  method get_hover_expand : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_hover_expand obj)

  method get_hover_selection : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_hover_selection obj)

  method get_level_indentation : unit -> int =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_level_indentation obj)

  method get_model : unit -> GTree_model.tree_model_t option =
    fun () ->
      Option.map (fun ret -> new GTree_model.tree_model ret) (Tree_selection_and__tree_view.Tree_view.get_model obj)

  method get_n_columns : unit -> int =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_n_columns obj)

  method get_reorderable : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_reorderable obj)

  method get_rubber_banding : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_rubber_banding obj)

  method get_search_column : unit -> int =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_search_column obj)

  method get_search_entry : unit -> GEditable.editable_t option =
    fun () ->
      Option.map (fun ret -> new GEditable.editable ret) (Tree_selection_and__tree_view.Tree_view.get_search_entry obj)

  method get_selection : unit -> tree_selection_t =
    fun () ->
      new  tree_selection(Tree_selection_and__tree_view.Tree_view.get_selection obj)

  method get_show_expanders : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_show_expanders obj)

  method get_tooltip_column : unit -> int =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.get_tooltip_column obj)

  method insert_column : GTree_view_column.tree_view_column_t -> int -> int =
    fun column position ->
      let column = column#as_tree_view_column in
      (Tree_selection_and__tree_view.Tree_view.insert_column obj column position)

  method is_rubber_banding_active : unit -> bool =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.is_rubber_banding_active obj)

  method move_column_after : GTree_view_column.tree_view_column_t -> GTree_view_column.tree_view_column_t option -> unit =
    fun column base_column ->
      let column = column#as_tree_view_column in
      let base_column = Option.map (fun (c) -> c#as_tree_view_column) base_column in
      (Tree_selection_and__tree_view.Tree_view.move_column_after obj column base_column)

  method remove_column : GTree_view_column.tree_view_column_t -> int =
    fun column ->
      let column = column#as_tree_view_column in
      (Tree_selection_and__tree_view.Tree_view.remove_column obj column)

  method row_activated : Tree_path.t -> GTree_view_column.tree_view_column_t option -> unit =
    fun path column ->
      let column = Option.map (fun (c) -> c#as_tree_view_column) column in
      (Tree_selection_and__tree_view.Tree_view.row_activated obj path column)

  method row_expanded : Tree_path.t -> bool =
    fun path ->
      (Tree_selection_and__tree_view.Tree_view.row_expanded obj path)

  method scroll_to_cell : Tree_path.t option -> GTree_view_column.tree_view_column_t option -> bool -> float -> float -> unit =
    fun path column use_align row_align col_align ->
      let column = Option.map (fun (c) -> c#as_tree_view_column) column in
      (Tree_selection_and__tree_view.Tree_view.scroll_to_cell obj path column use_align row_align col_align)

  method scroll_to_point : int -> int -> unit =
    fun tree_x tree_y ->
      (Tree_selection_and__tree_view.Tree_view.scroll_to_point obj tree_x tree_y)

  method set_activate_on_single_click : bool -> unit =
    fun single ->
      (Tree_selection_and__tree_view.Tree_view.set_activate_on_single_click obj single)

  method set_cursor_on_cell : Tree_path.t -> GTree_view_column.tree_view_column_t option -> GCell_renderer.cell_renderer_t option -> bool -> unit =
    fun path focus_column focus_cell start_editing ->
      let focus_column = Option.map (fun (c) -> c#as_tree_view_column) focus_column in
      let focus_cell = Option.map (fun (c) -> c#as_cell_renderer) focus_cell in
      (Tree_selection_and__tree_view.Tree_view.set_cursor_on_cell obj path focus_column focus_cell start_editing)

  method set_drag_dest_row : Tree_path.t option -> Gtk_enums.treeviewdropposition -> unit =
    fun path pos ->
      (Tree_selection_and__tree_view.Tree_view.set_drag_dest_row obj path pos)

  method set_enable_search : bool -> unit =
    fun enable_search ->
      (Tree_selection_and__tree_view.Tree_view.set_enable_search obj enable_search)

  method set_enable_tree_lines : bool -> unit =
    fun enabled ->
      (Tree_selection_and__tree_view.Tree_view.set_enable_tree_lines obj enabled)

  method set_expander_column : GTree_view_column.tree_view_column_t option -> unit =
    fun column ->
      let column = Option.map (fun (c) -> c#as_tree_view_column) column in
      (Tree_selection_and__tree_view.Tree_view.set_expander_column obj column)

  method set_fixed_height_mode : bool -> unit =
    fun enable ->
      (Tree_selection_and__tree_view.Tree_view.set_fixed_height_mode obj enable)

  method set_grid_lines : Gtk_enums.treeviewgridlines -> unit =
    fun grid_lines ->
      (Tree_selection_and__tree_view.Tree_view.set_grid_lines obj grid_lines)

  method set_headers_clickable : bool -> unit =
    fun setting ->
      (Tree_selection_and__tree_view.Tree_view.set_headers_clickable obj setting)

  method set_headers_visible : bool -> unit =
    fun headers_visible ->
      (Tree_selection_and__tree_view.Tree_view.set_headers_visible obj headers_visible)

  method set_hover_expand : bool -> unit =
    fun expand ->
      (Tree_selection_and__tree_view.Tree_view.set_hover_expand obj expand)

  method set_hover_selection : bool -> unit =
    fun hover ->
      (Tree_selection_and__tree_view.Tree_view.set_hover_selection obj hover)

  method set_level_indentation : int -> unit =
    fun indentation ->
      (Tree_selection_and__tree_view.Tree_view.set_level_indentation obj indentation)

  method set_model : GTree_model.tree_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_tree_model) model in
      (Tree_selection_and__tree_view.Tree_view.set_model obj model)

  method set_reorderable : bool -> unit =
    fun reorderable ->
      (Tree_selection_and__tree_view.Tree_view.set_reorderable obj reorderable)

  method set_rubber_banding : bool -> unit =
    fun enable ->
      (Tree_selection_and__tree_view.Tree_view.set_rubber_banding obj enable)

  method set_search_column : int -> unit =
    fun column ->
      (Tree_selection_and__tree_view.Tree_view.set_search_column obj column)

  method set_search_entry : GEditable.editable_t option -> unit =
    fun entry ->
      let entry = Option.map (fun (c) -> c#as_editable) entry in
      (Tree_selection_and__tree_view.Tree_view.set_search_entry obj entry)

  method set_show_expanders : bool -> unit =
    fun enabled ->
      (Tree_selection_and__tree_view.Tree_view.set_show_expanders obj enabled)

  method set_tooltip_cell : GTooltip.tooltip_t -> Tree_path.t option -> GTree_view_column.tree_view_column_t option -> GCell_renderer.cell_renderer_t option -> unit =
    fun tooltip path column cell ->
      let tooltip = tooltip#as_tooltip in
      let column = Option.map (fun (c) -> c#as_tree_view_column) column in
      let cell = Option.map (fun (c) -> c#as_cell_renderer) cell in
      (Tree_selection_and__tree_view.Tree_view.set_tooltip_cell obj tooltip path column cell)

  method set_tooltip_column : int -> unit =
    fun column ->
      (Tree_selection_and__tree_view.Tree_view.set_tooltip_column obj column)

  method set_tooltip_row : GTooltip.tooltip_t -> Tree_path.t -> unit =
    fun tooltip path ->
      let tooltip = tooltip#as_tooltip in
      (Tree_selection_and__tree_view.Tree_view.set_tooltip_row obj tooltip path)

  method unset_rows_drag_dest : unit -> unit =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.unset_rows_drag_dest obj)

  method unset_rows_drag_source : unit -> unit =
    fun () ->
      (Tree_selection_and__tree_view.Tree_view.unset_rows_drag_source obj)

  method enable_grid_lines = Tree_selection_and__tree_view.Tree_view.get_enable_grid_lines obj
  method set_enable_grid_lines v =  Tree_selection_and__tree_view.Tree_view.set_enable_grid_lines obj v

    method as_tree_view = obj
end
let new_ () : tree_view_t =
  new tree_view (Tree_selection_and__tree_view.Tree_view.new_ ())

let new_with_model (model : GTree_model.tree_model_t) : tree_view_t =
  let model = model#as_tree_model in
  let obj_ = Tree_selection_and__tree_view.Tree_view.new_with_model model in
  new tree_view obj_

