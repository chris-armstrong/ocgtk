class type grid_view_t = object
  inherit GList_base.list_base_t

  method on_activate :
    callback:(position:int -> unit) -> Gobject.Signal.handler_id

  method get_enable_rubberband : unit -> bool
  method get_factory : unit -> GList_item_factory.list_item_factory_t option
  method get_max_columns : unit -> int
  method get_min_columns : unit -> int
  method get_model : unit -> GSelection_model.selection_model_t option
  method get_single_click_activate : unit -> bool
  method get_tab_behavior : unit -> Gtk_enums.listtabbehavior

  method scroll_to :
    int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit

  method set_enable_rubberband : bool -> unit
  method set_factory : GList_item_factory.list_item_factory_t option -> unit
  method set_max_columns : int -> unit
  method set_min_columns : int -> unit
  method set_model : GSelection_model.selection_model_t option -> unit
  method set_single_click_activate : bool -> unit
  method set_tab_behavior : Gtk_enums.listtabbehavior -> unit
  method as_grid_view : Grid_view.t
end

class grid_view : Grid_view.t -> grid_view_t

val new_ :
  GSelection_model.selection_model_t option ->
  GList_item_factory.list_item_factory_t option ->
  grid_view_t
