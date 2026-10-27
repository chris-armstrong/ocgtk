class type grid_view_t = object
  inherit List_base.list_base_t

  method on_activate :
    ?after:bool ->
    callback:(position:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_enable_rubberband : unit -> bool
  (** Returns whether rows can be selected by dragging with the mouse. *)

  method get_factory : unit -> List_item_factory.list_item_factory_t option
  (** Gets the factory that's currently used to populate list items. *)

  method get_max_columns : unit -> int
  (** Gets the maximum number of columns that the grid will use. *)

  method get_min_columns : unit -> int
  (** Gets the minimum number of columns that the grid will use. *)

  method get_model : unit -> Selection_model.selection_model_t option
  (** Gets the model that's currently used to read the items displayed. *)

  method get_single_click_activate : unit -> bool
  (** Returns whether items will be activated on single click and selected on
      hover. *)

  method get_tab_behavior : unit -> Enums.listtabbehavior
  (** Gets the behavior set for the <kbd>Tab</kbd> key. *)

  method scroll_to :
    int -> Enums.listscrollflags -> Raw.Scroll_info.t option -> unit
  (** Scrolls to the item at the given position and performs the actions
      specified in [flags].

      This function works no matter if the gridview is shown or focused. If it
      isn't, then the changes will take effect once that happens. *)

  method set_enable_rubberband : bool -> unit
  (** Sets whether selections can be changed by dragging with the mouse. *)

  method set_factory : List_item_factory.list_item_factory_t option -> unit
  (** Sets the [GtkListItemFactory] to use for populating list items. *)

  method set_max_columns : int -> unit
  (** Sets the maximum number of columns to use.

      This number must be at least 1.

      If [max_columns] is smaller than the minimum set via
      [Gtk.GridView.set_min_columns], that value is used instead. *)

  method set_min_columns : int -> unit
  (** Sets the minimum number of columns to use.

      This number must be at least 1.

      If [min_columns] is smaller than the minimum set via
      [Gtk.GridView.set_max_columns], that value is ignored. *)

  method set_model : Selection_model.selection_model_t option -> unit
  (** Sets the model to use.

      This must be a [Gtk.SelectionModel]. *)

  method set_single_click_activate : bool -> unit
  (** Sets whether items should be activated on single click and selected on
      hover. *)

  method set_tab_behavior : Enums.listtabbehavior -> unit
  (** Sets the behavior of the <kbd>Tab</kbd> and
      <kbd>Shift</kbd>+<kbd>Tab</kbd> keys. *)

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
