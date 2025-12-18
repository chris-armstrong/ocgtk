(* Signal class defined in gtree_view_column_signals.ml *)

(* High-level class for TreeViewColumn *)
class tree_view_column (obj : Tree_view_column.t) = object (self)
  inherit Gtree_view_column_signals.tree_view_column_signals obj

  method alignment = Tree_view_column.get_alignment obj
  method set_alignment v = Tree_view_column.set_alignment obj v

  method add_attribute : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> string -> int -> unit =
    fun cell_renderer attribute column ->
      let cell_renderer = cell_renderer#as_cell_renderer in
      (Tree_view_column.add_attribute obj cell_renderer attribute column)

  method cell_is_visible : unit -> bool = fun () -> (Tree_view_column.cell_is_visible obj )

  method cell_set_cell_data : GTree_model.tree_model -> Tree_iter.t -> bool -> bool -> unit = fun tree_model iter is_expander is_expanded -> (Tree_view_column.cell_set_cell_data obj ( tree_model#as_tree_model ) iter is_expander is_expanded)

  method clear : unit -> unit = fun () -> (Tree_view_column.clear obj )

  method clear_attributes : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> unit =
    fun cell_renderer ->
      let cell_renderer = cell_renderer#as_cell_renderer in
      (Tree_view_column.clear_attributes obj cell_renderer)

  method clicked : unit -> unit = fun () -> (Tree_view_column.clicked obj )

  method focus_cell : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> unit =
    fun cell ->
      let cell = cell#as_cell_renderer in
      (Tree_view_column.focus_cell obj cell)

  method get_button : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun () -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Tree_view_column.get_button obj )

  method get_clickable : unit -> bool = fun () -> (Tree_view_column.get_clickable obj )

  method get_expand : unit -> bool = fun () -> (Tree_view_column.get_expand obj )

  method get_fixed_width : unit -> int = fun () -> (Tree_view_column.get_fixed_width obj )

  method get_max_width : unit -> int = fun () -> (Tree_view_column.get_max_width obj )

  method get_min_width : unit -> int = fun () -> (Tree_view_column.get_min_width obj )

  method get_reorderable : unit -> bool = fun () -> (Tree_view_column.get_reorderable obj )

  method get_resizable : unit -> bool = fun () -> (Tree_view_column.get_resizable obj )

  method get_sizing : unit -> Gtk_enums.treeviewcolumnsizing = fun () -> (Tree_view_column.get_sizing obj )

  method get_sort_column_id : unit -> int = fun () -> (Tree_view_column.get_sort_column_id obj )

  method get_sort_indicator : unit -> bool = fun () -> (Tree_view_column.get_sort_indicator obj )

  method get_sort_order : unit -> Gtk_enums.sorttype = fun () -> (Tree_view_column.get_sort_order obj )

  method get_spacing : unit -> int = fun () -> (Tree_view_column.get_spacing obj )

  method get_title : unit -> string = fun () -> (Tree_view_column.get_title obj )

  method get_tree_view : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Tree_view_column.get_tree_view obj )

  method get_visible : unit -> bool = fun () -> (Tree_view_column.get_visible obj )

  method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Tree_view_column.get_widget obj )

  method get_width : unit -> int = fun () -> (Tree_view_column.get_width obj )

  method get_x_offset : unit -> int = fun () -> (Tree_view_column.get_x_offset obj )

  method pack_end : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> bool -> unit =
    fun cell expand ->
      let cell = cell#as_cell_renderer in
      (Tree_view_column.pack_end obj cell expand)

  method pack_start : 'p1. (#GCell_renderer.cell_renderer as 'p1) -> bool -> unit =
    fun cell expand ->
      let cell = cell#as_cell_renderer in
      (Tree_view_column.pack_start obj cell expand)

  method queue_resize : unit -> unit = fun () -> (Tree_view_column.queue_resize obj )

  method set_clickable : bool -> unit = fun clickable -> (Tree_view_column.set_clickable obj clickable)

  method set_expand : bool -> unit = fun expand -> (Tree_view_column.set_expand obj expand)

  method set_fixed_width : int -> unit = fun fixed_width -> (Tree_view_column.set_fixed_width obj fixed_width)

  method set_max_width : int -> unit = fun max_width -> (Tree_view_column.set_max_width obj max_width)

  method set_min_width : int -> unit = fun min_width -> (Tree_view_column.set_min_width obj min_width)

  method set_reorderable : bool -> unit = fun reorderable -> (Tree_view_column.set_reorderable obj reorderable)

  method set_resizable : bool -> unit = fun resizable -> (Tree_view_column.set_resizable obj resizable)

  method set_sizing : Gtk_enums.treeviewcolumnsizing -> unit = fun type_ -> (Tree_view_column.set_sizing obj type_)

  method set_sort_column_id : int -> unit = fun sort_column_id -> (Tree_view_column.set_sort_column_id obj sort_column_id)

  method set_sort_indicator : bool -> unit = fun setting -> (Tree_view_column.set_sort_indicator obj setting)

  method set_sort_order : Gtk_enums.sorttype -> unit = fun order -> (Tree_view_column.set_sort_order obj order)

  method set_spacing : int -> unit = fun spacing -> (Tree_view_column.set_spacing obj spacing)

  method set_title : string -> unit = fun title -> (Tree_view_column.set_title obj title)

  method set_visible : bool -> unit = fun visible -> (Tree_view_column.set_visible obj visible)

  method set_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Tree_view_column.set_widget obj widget)

    method as_tree_view_column = obj
end

