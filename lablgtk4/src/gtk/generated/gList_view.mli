class list_view : List_view.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Glist_view_signals.list_view_signals
    method get_enable_rubberband : unit -> bool
    method get_factory : unit -> GList_item_factory.list_item_factory option
    method get_header_factory : unit -> GList_item_factory.list_item_factory option
    method get_model : unit -> GSelection_model.selection_model option
    method get_show_separators : unit -> bool
    method get_single_click_activate : unit -> bool
    method get_tab_behavior : unit -> Gtk_enums.listtabbehavior
    method scroll_to : int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit
    method set_enable_rubberband : bool -> unit
    method set_factory : #GList_item_factory.list_item_factory option -> unit
    method set_header_factory : #GList_item_factory.list_item_factory option -> unit
    method set_show_separators : bool -> unit
    method set_single_click_activate : bool -> unit
    method set_tab_behavior : Gtk_enums.listtabbehavior -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_list_view : List_view.t
  end

