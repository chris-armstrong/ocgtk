(* Signal class defined in gdrop_down_signals.ml *)

(* High-level class for DropDown *)
class drop_down (obj : Drop_down.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Drop_down.as_widget obj)
  inherit Gdrop_down_signals.drop_down_signals obj

  method get_enable_search : unit -> bool =
    fun () ->
      (Drop_down.get_enable_search obj)

  method get_expression : unit -> GExpression.expression option =
    fun () ->
      Option.map (fun ret -> new GExpression.expression ret) (Drop_down.get_expression obj)

  method get_factory : unit -> GList_item_factory.list_item_factory option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Drop_down.get_factory obj)

  method get_header_factory : unit -> GList_item_factory.list_item_factory option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Drop_down.get_header_factory obj)

  method get_list_factory : unit -> GList_item_factory.list_item_factory option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Drop_down.get_list_factory obj)

  method get_search_match_mode : unit -> Gtk_enums.stringfiltermatchmode =
    fun () ->
      (Drop_down.get_search_match_mode obj)

  method get_selected : unit -> int =
    fun () ->
      (Drop_down.get_selected obj)

  method get_show_arrow : unit -> bool =
    fun () ->
      (Drop_down.get_show_arrow obj)

  method set_enable_search : bool -> unit =
    fun enable_search ->
      (Drop_down.set_enable_search obj enable_search)

  method set_expression : 'p1. (#GExpression.expression as 'p1) option -> unit =
    fun expression ->
      let expression = Option.map (fun (c) -> c#as_expression) expression in
      (Drop_down.set_expression obj expression)

  method set_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Drop_down.set_factory obj factory)

  method set_header_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Drop_down.set_header_factory obj factory)

  method set_list_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Drop_down.set_list_factory obj factory)

  method set_search_match_mode : Gtk_enums.stringfiltermatchmode -> unit =
    fun search_match_mode ->
      (Drop_down.set_search_match_mode obj search_match_mode)

  method set_selected : int -> unit =
    fun position ->
      (Drop_down.set_selected obj position)

  method set_show_arrow : bool -> unit =
    fun show_arrow ->
      (Drop_down.set_show_arrow obj show_arrow)

  method as_widget = (Drop_down.as_widget obj)
    method as_drop_down = obj
end

