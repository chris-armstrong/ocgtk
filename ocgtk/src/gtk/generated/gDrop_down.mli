class type drop_down_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gdrop_down_signals.drop_down_signals
    method get_enable_search : unit -> bool
    method get_expression : unit -> GExpression.expression_t option
    method get_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_header_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_list_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method get_search_match_mode : unit -> Gtk_enums.stringfiltermatchmode
    method get_selected : unit -> int
    method get_selected_item : unit -> [`object_] Gobject.obj option
    method get_show_arrow : unit -> bool
    method set_enable_search : bool -> unit
    method set_expression : GExpression.expression_t option -> unit
    method set_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_header_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_list_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
    method set_search_match_mode : Gtk_enums.stringfiltermatchmode -> unit
    method set_selected : int -> unit
    method set_show_arrow : bool -> unit
    method as_drop_down : Drop_down.t
end

class drop_down : Drop_down.t -> drop_down_t

val new_ : Ocgtk_gio.Gio.List_model.list_model_t option -> GExpression.expression_t option -> drop_down_t
val new_from_strings : string array -> drop_down_t
