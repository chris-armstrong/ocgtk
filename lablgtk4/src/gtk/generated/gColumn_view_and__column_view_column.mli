class column_view : Column_view_and__column_view_column.Column_view.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcolumn_view_signals.column_view_signals
    method enable_rubberband : bool
    method set_enable_rubberband : bool -> unit
    method reorderable : bool
    method set_reorderable : bool -> unit
    method show_column_separators : bool
    method set_show_column_separators : bool -> unit
    method show_row_separators : bool
    method set_show_row_separators : bool -> unit
    method single_click_activate : bool
    method set_single_click_activate : bool -> unit
    method append_column : <as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> -> unit
    method get_header_factory : unit -> GList_item_factory.list_item_factory option
    method get_model : unit -> GSelection_model.selection_model option
    method get_row_factory : unit -> GList_item_factory.list_item_factory option
    method get_sorter : unit -> GSorter.sorter option
    method get_tab_behavior : unit -> Gtk_enums.listtabbehavior
    method insert_column : int -> <as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> -> unit
    method remove_column : <as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> -> unit
    method scroll_to : int -> <as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> option -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit
    method set_header_factory : #GList_item_factory.list_item_factory option -> unit
    method set_model : GSelection_model.selection_model option -> unit
    method set_row_factory : #GList_item_factory.list_item_factory option -> unit
    method set_tab_behavior : Gtk_enums.listtabbehavior -> unit
    method sort_by_column : <as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> option -> Gtk_enums.sorttype -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_column_view : Column_view_and__column_view_column.Column_view.t
  end

and column_view_column : Column_view_and__column_view_column.Column_view_column.t ->
  object
    method expand : bool
    method set_expand : bool -> unit
    method fixed_width : int
    method set_fixed_width : int -> unit
    method id : string
    method set_id : string -> unit
    method resizable : bool
    method set_resizable : bool -> unit
    method title : string
    method set_title : string -> unit
    method visible : bool
    method set_visible : bool -> unit
    method get_column_view : unit -> column_view option
    method get_factory : unit -> GList_item_factory.list_item_factory option
    method get_sorter : unit -> GSorter.sorter option
    method set_factory : #GList_item_factory.list_item_factory option -> unit
    method set_sorter : #GSorter.sorter option -> unit
    method as_column_view_column : Column_view_and__column_view_column.Column_view_column.t
  end
