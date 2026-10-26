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

(* High-level class for GridView *)
class grid_view (obj : Raw.Grid_view.t) : grid_view_t =
  object (self)
    inherit List_base.list_base (obj :> Raw.List_base.t)

    method on_activate ?(after = false) ~callback () =
      Raw.Grid_view.on_activate ~after self#as_grid_view ~callback

    method get_enable_rubberband : unit -> bool =
      fun () -> Raw.Grid_view.get_enable_rubberband obj

    method get_factory : unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Grid_view.get_factory obj)

    method get_max_columns : unit -> int =
      fun () -> Raw.Grid_view.get_max_columns obj

    method get_min_columns : unit -> int =
      fun () -> Raw.Grid_view.get_min_columns obj

    method get_model : unit -> Selection_model.selection_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Selection_model.selection_model ret)
          (Raw.Grid_view.get_model obj)

    method get_single_click_activate : unit -> bool =
      fun () -> Raw.Grid_view.get_single_click_activate obj

    method get_tab_behavior : unit -> Enums.listtabbehavior =
      fun () -> Raw.Grid_view.get_tab_behavior obj

    method scroll_to :
        int -> Enums.listscrollflags -> Raw.Scroll_info.t option -> unit =
      fun pos flags scroll -> Raw.Grid_view.scroll_to obj pos flags scroll

    method set_enable_rubberband : bool -> unit =
      fun enable_rubberband ->
        Raw.Grid_view.set_enable_rubberband obj enable_rubberband

    method set_factory : List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Grid_view.set_factory obj factory

    method set_max_columns : int -> unit =
      fun max_columns -> Raw.Grid_view.set_max_columns obj max_columns

    method set_min_columns : int -> unit =
      fun min_columns -> Raw.Grid_view.set_min_columns obj min_columns

    method set_model : Selection_model.selection_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_selection_model) model in
        Raw.Grid_view.set_model obj model

    method set_single_click_activate : bool -> unit =
      fun single_click_activate ->
        Raw.Grid_view.set_single_click_activate obj single_click_activate

    method set_tab_behavior : Enums.listtabbehavior -> unit =
      fun tab_behavior -> Raw.Grid_view.set_tab_behavior obj tab_behavior

    method as_grid_view = obj
  end

let new_ (model : Selection_model.selection_model_t option)
    (factory : List_item_factory.list_item_factory_t option) : grid_view_t =
  let model = Option.map (fun c -> c#as_selection_model) model in
  let factory = Option.map (fun c -> c#as_list_item_factory) factory in
  let obj_ = Raw.Grid_view.new_ model factory in
  new grid_view obj_
