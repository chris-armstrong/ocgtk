class icon_view : Icon_view.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gicon_view_signals.icon_view_signals
    method get_activate_on_single_click : unit -> bool
    method get_column_spacing : unit -> int
    method get_columns : unit -> int
    method get_item_column : Tree_path.t -> int
    method get_item_orientation : unit -> Gtk_enums.orientation
    method get_item_padding : unit -> int
    method get_item_row : Tree_path.t -> int
    method get_item_width : unit -> int
    method get_margin : unit -> int
    method get_markup_column : unit -> int
    method get_model : unit -> GTree_model.tree_model option
    method get_path_at_pos : int -> int -> Tree_path.t option
    method get_pixbuf_column : unit -> int
    method get_reorderable : unit -> bool
    method get_row_spacing : unit -> int
    method get_selection_mode : unit -> Gtk_enums.selectionmode
    method get_spacing : unit -> int
    method get_text_column : unit -> int
    method get_tooltip_column : unit -> int
    method item_activated : Tree_path.t -> unit
    method path_is_selected : Tree_path.t -> bool
    method scroll_to_path : Tree_path.t -> bool -> float -> float -> unit
    method select_all : unit -> unit
    method select_path : Tree_path.t -> unit
    method set_activate_on_single_click : bool -> unit
    method set_column_spacing : int -> unit
    method set_columns : int -> unit
    (* method set_cursor : ... *) (* CONFLICT: incompatible signature with parent method *)
    method set_drag_dest_item : Tree_path.t option -> Gtk_enums.iconviewdropposition -> unit
    method set_item_orientation : Gtk_enums.orientation -> unit
    method set_item_padding : int -> unit
    method set_item_width : int -> unit
    method set_margin : int -> unit
    method set_markup_column : int -> unit
    method set_model : GTree_model.tree_model option -> unit
    method set_pixbuf_column : int -> unit
    method set_reorderable : bool -> unit
    method set_row_spacing : int -> unit
    method set_selection_mode : Gtk_enums.selectionmode -> unit
    method set_spacing : int -> unit
    method set_text_column : int -> unit
    method set_tooltip_cell : #GTooltip.tooltip -> Tree_path.t -> #GCell_renderer.cell_renderer option -> unit
    method set_tooltip_column : int -> unit
    method set_tooltip_item : #GTooltip.tooltip -> Tree_path.t -> unit
    method unselect_all : unit -> unit
    method unselect_path : Tree_path.t -> unit
    method unset_model_drag_dest : unit -> unit
    method unset_model_drag_source : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_icon_view : Icon_view.t
  end

