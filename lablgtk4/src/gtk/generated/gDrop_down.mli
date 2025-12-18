class drop_down : Drop_down.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gdrop_down_signals.drop_down_signals
    method enable_search : bool
    method set_enable_search : bool -> unit
    method selected : int
    method set_selected : int -> unit
    method show_arrow : bool
    method set_show_arrow : bool -> unit
    method get_expression : unit -> GExpression.expression option
    method get_factory : unit -> GList_item_factory.list_item_factory option
    method get_header_factory : unit -> GList_item_factory.list_item_factory option
    method get_list_factory : unit -> GList_item_factory.list_item_factory option
    method get_search_match_mode : unit -> Gtk_enums.stringfiltermatchmode
    method set_expression : #GExpression.expression option -> unit
    method set_factory : #GList_item_factory.list_item_factory option -> unit
    method set_header_factory : #GList_item_factory.list_item_factory option -> unit
    method set_list_factory : #GList_item_factory.list_item_factory option -> unit
    method set_search_match_mode : Gtk_enums.stringfiltermatchmode -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_drop_down : Drop_down.t
  end

