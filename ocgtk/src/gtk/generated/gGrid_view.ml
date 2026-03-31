(* Signal class defined in ggrid_view_signals.ml *)

class type grid_view_t = object
    inherit GList_base.list_base_t
    inherit Ggrid_view_signals.grid_view_signals
    method get_enable_rubberband : unit -> bool
    method get_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_max_columns : unit -> int
    method get_min_columns : unit -> int
    method get_model : unit -> GSelection_model.selection_model_t option
    method get_single_click_activate : unit -> bool
    method get_tab_behavior : unit -> Gtk_enums.listtabbehavior
    method scroll_to : int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit
    method set_enable_rubberband : bool -> unit
    method set_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_max_columns : int -> unit
    method set_min_columns : int -> unit
    method set_single_click_activate : bool -> unit
    method set_tab_behavior : Gtk_enums.listtabbehavior -> unit
    method as_grid_view : Grid_view.t
end

(* High-level class for GridView *)
class grid_view (obj : Grid_view.t) : grid_view_t = object (self)
  inherit GList_base.list_base (obj :> List_base.t)
  inherit Ggrid_view_signals.grid_view_signals obj

  method get_enable_rubberband : unit -> bool =
    fun () ->
      (Grid_view.get_enable_rubberband obj)

  method get_factory : unit -> GList_item_factory.list_item_factory_t option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Grid_view.get_factory obj)

  method get_max_columns : unit -> int =
    fun () ->
      (Grid_view.get_max_columns obj)

  method get_min_columns : unit -> int =
    fun () ->
      (Grid_view.get_min_columns obj)

  method get_model : unit -> GSelection_model.selection_model_t option =
    fun () ->
      Option.map (fun ret -> new GSelection_model.selection_model ret) (Grid_view.get_model obj)

  method get_single_click_activate : unit -> bool =
    fun () ->
      (Grid_view.get_single_click_activate obj)

  method get_tab_behavior : unit -> Gtk_enums.listtabbehavior =
    fun () ->
      (Grid_view.get_tab_behavior obj)

  method scroll_to : int -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit =
    fun pos flags scroll ->
      (Grid_view.scroll_to obj pos flags scroll)

  method set_enable_rubberband : bool -> unit =
    fun enable_rubberband ->
      (Grid_view.set_enable_rubberband obj enable_rubberband)

  method set_factory : GList_item_factory.list_item_factory_t option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Grid_view.set_factory obj factory)

  method set_max_columns : int -> unit =
    fun max_columns ->
      (Grid_view.set_max_columns obj max_columns)

  method set_min_columns : int -> unit =
    fun min_columns ->
      (Grid_view.set_min_columns obj min_columns)

  method set_single_click_activate : bool -> unit =
    fun single_click_activate ->
      (Grid_view.set_single_click_activate obj single_click_activate)

  method set_tab_behavior : Gtk_enums.listtabbehavior -> unit =
    fun tab_behavior ->
      (Grid_view.set_tab_behavior obj tab_behavior)

    method as_grid_view = obj
end

let new_ (model : GSelection_model.selection_model_t option) (factory : GList_item_factory.list_item_factory_t option) : grid_view_t =
  let model = Option.map (fun c -> c#as_selection_model) model in
  let factory = Option.map (fun c -> c#as_list_item_factory) factory in
  let obj_ = Grid_view.new_ model factory in
  new grid_view obj_

