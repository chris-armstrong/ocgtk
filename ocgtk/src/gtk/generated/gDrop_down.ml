(* Signal class defined in gdrop_down_signals.ml *)

class type drop_down_t = object
    inherit Gdrop_down_signals.drop_down_signals
    method get_enable_search : unit -> bool
    method get_expression : unit -> GExpression.expression_t option
    method get_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_header_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_list_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_model : unit -> Ocgtk_gio.Gio.list_model_t option
    method get_search_match_mode : unit -> Gtk_enums.stringfiltermatchmode
    method get_selected : unit -> int
    method get_show_arrow : unit -> bool
    method set_enable_search : bool -> unit
    method set_expression : GExpression.expression_t option -> unit
    method set_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_header_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_list_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_model : Ocgtk_gio.Gio.list_model_t option -> unit
    method set_search_match_mode : Gtk_enums.stringfiltermatchmode -> unit
    method set_selected : int -> unit
    method set_show_arrow : bool -> unit
    method as_drop_down : Drop_down.t
end

(* High-level class for DropDown *)
class drop_down (obj : Drop_down.t) : drop_down_t = object (self)
  inherit Gdrop_down_signals.drop_down_signals obj

  method get_enable_search : unit -> bool =
    fun () ->
      (Drop_down.get_enable_search obj)

  method get_expression : unit -> GExpression.expression_t option =
    fun () ->
      Option.map (fun ret -> new GExpression.expression ret) (Drop_down.get_expression obj)

  method get_factory : unit -> GList_item_factory.list_item_factory_t option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Drop_down.get_factory obj)

  method get_header_factory : unit -> GList_item_factory.list_item_factory_t option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Drop_down.get_header_factory obj)

  method get_list_factory : unit -> GList_item_factory.list_item_factory_t option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Drop_down.get_list_factory obj)

  method get_model : unit -> Ocgtk_gio.Gio.list_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.list_model ret) (Drop_down.get_model obj)

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

  method set_expression : GExpression.expression_t option -> unit =
    fun expression ->
      let expression = Option.map (fun (c) -> c#as_expression) expression in
      (Drop_down.set_expression obj expression)

  method set_factory : GList_item_factory.list_item_factory_t option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Drop_down.set_factory obj factory)

  method set_header_factory : GList_item_factory.list_item_factory_t option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Drop_down.set_header_factory obj factory)

  method set_list_factory : GList_item_factory.list_item_factory_t option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Drop_down.set_list_factory obj factory)

  method set_model : Ocgtk_gio.Gio.list_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_list_model) model in
      (Drop_down.set_model obj model)

  method set_search_match_mode : Gtk_enums.stringfiltermatchmode -> unit =
    fun search_match_mode ->
      (Drop_down.set_search_match_mode obj search_match_mode)

  method set_selected : int -> unit =
    fun position ->
      (Drop_down.set_selected obj position)

  method set_show_arrow : bool -> unit =
    fun show_arrow ->
      (Drop_down.set_show_arrow obj show_arrow)

    method as_drop_down = obj
end

