class grid_view : Grid_view.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Ggrid_view_signals.grid_view_signals
    method enable_rubberband : bool
    method set_enable_rubberband : bool -> unit
    method max_columns : int
    method set_max_columns : int -> unit
    method min_columns : int
    method set_min_columns : int -> unit
    method single_click_activate : bool
    method set_single_click_activate : bool -> unit
    method get_factory : unit -> GList_item_factory.list_item_factory option
    method get_model : unit -> GSelection_model.selection_model option
    method get_tab_behavior : unit -> Gtk_enums.listtabbehavior
    method scroll_to : int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit
    method set_factory : #GList_item_factory.list_item_factory option -> unit
    method set_model : GSelection_model.selection_model option -> unit
    method set_tab_behavior : Gtk_enums.listtabbehavior -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_grid_view : Grid_view.t
  end

