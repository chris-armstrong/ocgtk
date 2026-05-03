class type list_view_t = object
  inherit GList_base.list_base_t

  method on_activate :
    callback:(position:int -> unit) -> Gobject.Signal.handler_id

  method get_enable_rubberband : unit -> bool
  method get_factory : unit -> GList_item_factory.list_item_factory_t option

  method get_header_factory :
    unit -> GList_item_factory.list_item_factory_t option

  method get_model : unit -> GSelection_model.selection_model_t option
  method get_show_separators : unit -> bool
  method get_single_click_activate : unit -> bool
  method get_tab_behavior : unit -> Gtk_enums.listtabbehavior

  method scroll_to :
    int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit

  method set_enable_rubberband : bool -> unit
  method set_factory : GList_item_factory.list_item_factory_t option -> unit

  method set_header_factory :
    GList_item_factory.list_item_factory_t option -> unit

  method set_model : GSelection_model.selection_model_t option -> unit
  method set_show_separators : bool -> unit
  method set_single_click_activate : bool -> unit
  method set_tab_behavior : Gtk_enums.listtabbehavior -> unit
  method as_list_view : List_view.t
end

(* High-level class for ListView *)
class list_view (obj : List_view.t) : list_view_t =
  object (self)
    inherit GList_base.list_base (obj :> List_base.t)

    method on_activate ~callback =
      List_view.on_activate self#as_list_view ~callback

    method get_enable_rubberband : unit -> bool =
      fun () -> List_view.get_enable_rubberband obj

    method get_factory : unit -> GList_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new GList_item_factory.list_item_factory ret)
          (List_view.get_factory obj)

    method get_header_factory :
        unit -> GList_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new GList_item_factory.list_item_factory ret)
          (List_view.get_header_factory obj)

    method get_model : unit -> GSelection_model.selection_model_t option =
      fun () ->
        Option.map
          (fun ret -> new GSelection_model.selection_model ret)
          (List_view.get_model obj)

    method get_show_separators : unit -> bool =
      fun () -> List_view.get_show_separators obj

    method get_single_click_activate : unit -> bool =
      fun () -> List_view.get_single_click_activate obj

    method get_tab_behavior : unit -> Gtk_enums.listtabbehavior =
      fun () -> List_view.get_tab_behavior obj

    method scroll_to :
        int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit =
      fun pos flags scroll -> List_view.scroll_to obj pos flags scroll

    method set_enable_rubberband : bool -> unit =
      fun enable_rubberband ->
        List_view.set_enable_rubberband obj enable_rubberband

    method set_factory : GList_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        List_view.set_factory obj factory

    method set_header_factory :
        GList_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        List_view.set_header_factory obj factory

    method set_model : GSelection_model.selection_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_selection_model) model in
        List_view.set_model obj model

    method set_show_separators : bool -> unit =
      fun show_separators -> List_view.set_show_separators obj show_separators

    method set_single_click_activate : bool -> unit =
      fun single_click_activate ->
        List_view.set_single_click_activate obj single_click_activate

    method set_tab_behavior : Gtk_enums.listtabbehavior -> unit =
      fun tab_behavior -> List_view.set_tab_behavior obj tab_behavior

    method as_list_view = obj
  end

let new_ (model : GSelection_model.selection_model_t option)
    (factory : GList_item_factory.list_item_factory_t option) : list_view_t =
  let model = Option.map (fun c -> c#as_selection_model) model in
  let factory = Option.map (fun c -> c#as_list_item_factory) factory in
  let obj_ = List_view.new_ model factory in
  new list_view obj_
