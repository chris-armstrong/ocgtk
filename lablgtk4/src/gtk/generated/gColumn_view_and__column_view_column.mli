class column_view : Column_view_and__column_view_column.Column_view.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcolumn_view_signals.column_view_signals
    method append_column : <as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> -> unit
    method get_enable_rubberband : unit -> bool
    method get_header_factory : unit -> GList_item_factory.list_item_factory option
    method get_reorderable : unit -> bool
    method get_row_factory : unit -> GList_item_factory.list_item_factory option
    method get_show_column_separators : unit -> bool
    method get_show_row_separators : unit -> bool
    method get_single_click_activate : unit -> bool
    method get_sorter : unit -> GSorter.sorter option
    method get_tab_behavior : unit -> Gtk_enums.listtabbehavior
    method insert_column : int -> <as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> -> unit
    method remove_column : <as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> -> unit
    method set_enable_rubberband : bool -> unit
    method set_header_factory : #GList_item_factory.list_item_factory option -> unit
    method set_reorderable : bool -> unit
    method set_row_factory : #GList_item_factory.list_item_factory option -> unit
    method set_show_column_separators : bool -> unit
    method set_show_row_separators : bool -> unit
    method set_single_click_activate : bool -> unit
    method set_tab_behavior : Gtk_enums.listtabbehavior -> unit
    method sort_by_column : <as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> option -> Gtk_enums.sorttype -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_column_view : Column_view_and__column_view_column.Column_view.t
  end

and column_view_column : Column_view_and__column_view_column.Column_view_column.t ->
  object
    method get_column_view : unit -> column_view option
    method get_expand : unit -> bool
    method get_factory : unit -> GList_item_factory.list_item_factory option
    method get_fixed_width : unit -> int
    method get_id : unit -> string option
    method get_resizable : unit -> bool
    method get_sorter : unit -> GSorter.sorter option
    method get_title : unit -> string option
    method get_visible : unit -> bool
    method set_expand : bool -> unit
    method set_factory : #GList_item_factory.list_item_factory option -> unit
    method set_fixed_width : int -> unit
    method set_id : string option -> unit
    method set_resizable : bool -> unit
    method set_sorter : #GSorter.sorter option -> unit
    method set_title : string option -> unit
    method set_visible : bool -> unit
    method as_column_view_column : Column_view_and__column_view_column.Column_view_column.t
  end
