class type grid_view_t = object
  inherit List_base.list_base_t

  method on_activate :
    ?after:bool ->
    callback:(position:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_enable_rubberband : unit -> bool
  method get_factory : unit -> List_item_factory.list_item_factory_t option
  method get_max_columns : unit -> int
  method get_min_columns : unit -> int
  method get_model : unit -> Selection_model.selection_model_t option
  method get_single_click_activate : unit -> bool
  method get_tab_behavior : unit -> Enums.listtabbehavior

  method scroll_to :
    int -> Enums.listscrollflags -> Raw.Scroll_info.t option -> unit

  method set_enable_rubberband : bool -> unit
  method set_factory : List_item_factory.list_item_factory_t option -> unit
  method set_max_columns : int -> unit
  method set_min_columns : int -> unit
  method set_model : Selection_model.selection_model_t option -> unit
  method set_single_click_activate : bool -> unit
  method set_tab_behavior : Enums.listtabbehavior -> unit
  method as_grid_view : Raw.Grid_view.t
end

class grid_view : Raw.Grid_view.t -> grid_view_t

val new_ :
  Selection_model.selection_model_t option ->
  List_item_factory.list_item_factory_t option ->
  grid_view_t
