class type drop_down_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_enable_search : unit -> bool
  method get_expression : unit -> Expression.expression_t option
  method get_factory : unit -> List_item_factory.list_item_factory_t option

  method get_header_factory :
    unit -> List_item_factory.list_item_factory_t option

  method get_list_factory : unit -> List_item_factory.list_item_factory_t option
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_search_match_mode : unit -> Enums.stringfiltermatchmode
  method get_selected : unit -> int
  method get_selected_item : unit -> [ `object_ ] Gobject.obj option
  method get_show_arrow : unit -> bool
  method set_enable_search : bool -> unit
  method set_expression : Expression.expression_t option -> unit
  method set_factory : List_item_factory.list_item_factory_t option -> unit

  method set_header_factory :
    List_item_factory.list_item_factory_t option -> unit

  method set_list_factory : List_item_factory.list_item_factory_t option -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_search_match_mode : Enums.stringfiltermatchmode -> unit
  method set_selected : int -> unit
  method set_show_arrow : bool -> unit
  method as_drop_down : Raw.Drop_down.t
end

class drop_down : Raw.Drop_down.t -> drop_down_t

val new_ :
  Ocgio.List_model.list_model_t option ->
  Expression.expression_t option ->
  drop_down_t

val new_from_strings : string array -> drop_down_t
