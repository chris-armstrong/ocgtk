(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type column_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Scrollable.scrollable_t

  method on_activate :
    ?after:bool ->
    callback:(position:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method append_column : column_view_column_t -> unit
  method get_columns : unit -> Ocgio.List_model.list_model_t
  method get_enable_rubberband : unit -> bool

  method get_header_factory :
    unit -> List_item_factory.list_item_factory_t option

  method get_model : unit -> Selection_model.selection_model_t option
  method get_reorderable : unit -> bool
  method get_row_factory : unit -> List_item_factory.list_item_factory_t option
  method get_show_column_separators : unit -> bool
  method get_show_row_separators : unit -> bool
  method get_single_click_activate : unit -> bool
  method get_sorter : unit -> Sorter.sorter_t option
  method get_tab_behavior : unit -> Enums.listtabbehavior
  method insert_column : int -> column_view_column_t -> unit
  method remove_column : column_view_column_t -> unit

  method scroll_to :
    int ->
    column_view_column_t option ->
    Enums.listscrollflags ->
    Raw.Scroll_info.t option ->
    unit

  method set_enable_rubberband : bool -> unit

  method set_header_factory :
    List_item_factory.list_item_factory_t option -> unit

  method set_model : Selection_model.selection_model_t option -> unit
  method set_reorderable : bool -> unit
  method set_row_factory : List_item_factory.list_item_factory_t option -> unit
  method set_show_column_separators : bool -> unit
  method set_show_row_separators : bool -> unit
  method set_single_click_activate : bool -> unit
  method set_tab_behavior : Enums.listtabbehavior -> unit
  method sort_by_column : column_view_column_t option -> Enums.sorttype -> unit
  method as_column_view : Raw.Column_view.t
end

and column_view_column_t = object
  method get_column_view : unit -> column_view_t option
  method get_expand : unit -> bool
  method get_factory : unit -> List_item_factory.list_item_factory_t option
  method get_fixed_width : unit -> int
  method get_header_menu : unit -> Ocgio.Menu_model.menu_model_t option
  method get_id : unit -> string option
  method get_resizable : unit -> bool
  method get_sorter : unit -> Sorter.sorter_t option
  method get_title : unit -> string option
  method get_visible : unit -> bool
  method set_expand : bool -> unit
  method set_factory : List_item_factory.list_item_factory_t option -> unit
  method set_fixed_width : int -> unit
  method set_header_menu : Ocgio.Menu_model.menu_model_t option -> unit
  method set_id : string option -> unit
  method set_resizable : bool -> unit
  method set_sorter : Sorter.sorter_t option -> unit
  method set_title : string option -> unit
  method set_visible : bool -> unit
  method as_column_view_column : Raw.Column_view_column.t
end

class column_view (obj : Raw.Column_view.t) : column_view_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Scrollable.scrollable (Raw.Scrollable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Column_view.on_activate ~after self#as_column_view ~callback

    method append_column : column_view_column_t -> unit =
      fun column ->
        let column = column#as_column_view_column in
        Raw.Column_view.append_column obj column

    method get_columns : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model (Raw.Column_view.get_columns obj)

    method get_enable_rubberband : unit -> bool =
      fun () -> Raw.Column_view.get_enable_rubberband obj

    method get_header_factory :
        unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Column_view.get_header_factory obj)

    method get_model : unit -> Selection_model.selection_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Selection_model.selection_model ret)
          (Raw.Column_view.get_model obj)

    method get_reorderable : unit -> bool =
      fun () -> Raw.Column_view.get_reorderable obj

    method get_row_factory :
        unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Column_view.get_row_factory obj)

    method get_show_column_separators : unit -> bool =
      fun () -> Raw.Column_view.get_show_column_separators obj

    method get_show_row_separators : unit -> bool =
      fun () -> Raw.Column_view.get_show_row_separators obj

    method get_single_click_activate : unit -> bool =
      fun () -> Raw.Column_view.get_single_click_activate obj

    method get_sorter : unit -> Sorter.sorter_t option =
      fun () ->
        Option.map
          (fun ret -> new Sorter.sorter ret)
          (Raw.Column_view.get_sorter obj)

    method get_tab_behavior : unit -> Enums.listtabbehavior =
      fun () -> Raw.Column_view.get_tab_behavior obj

    method insert_column : int -> column_view_column_t -> unit =
      fun position column ->
        let column = column#as_column_view_column in
        Raw.Column_view.insert_column obj position column

    method remove_column : column_view_column_t -> unit =
      fun column ->
        let column = column#as_column_view_column in
        Raw.Column_view.remove_column obj column

    method scroll_to :
        int ->
        column_view_column_t option ->
        Enums.listscrollflags ->
        Raw.Scroll_info.t option ->
        unit =
      fun pos column flags scroll ->
        let column = Option.map (fun c -> c#as_column_view_column) column in
        Raw.Column_view.scroll_to obj pos column flags scroll

    method set_enable_rubberband : bool -> unit =
      fun enable_rubberband ->
        Raw.Column_view.set_enable_rubberband obj enable_rubberband

    method set_header_factory :
        List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Column_view.set_header_factory obj factory

    method set_model : Selection_model.selection_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_selection_model) model in
        Raw.Column_view.set_model obj model

    method set_reorderable : bool -> unit =
      fun reorderable -> Raw.Column_view.set_reorderable obj reorderable

    method set_row_factory :
        List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Column_view.set_row_factory obj factory

    method set_show_column_separators : bool -> unit =
      fun show_column_separators ->
        Raw.Column_view.set_show_column_separators obj show_column_separators

    method set_show_row_separators : bool -> unit =
      fun show_row_separators ->
        Raw.Column_view.set_show_row_separators obj show_row_separators

    method set_single_click_activate : bool -> unit =
      fun single_click_activate ->
        Raw.Column_view.set_single_click_activate obj single_click_activate

    method set_tab_behavior : Enums.listtabbehavior -> unit =
      fun tab_behavior -> Raw.Column_view.set_tab_behavior obj tab_behavior

    method sort_by_column :
        column_view_column_t option -> Enums.sorttype -> unit =
      fun column direction ->
        let column = Option.map (fun c -> c#as_column_view_column) column in
        Raw.Column_view.sort_by_column obj column direction

    method as_column_view = obj
  end

and column_view_column (obj : Raw.Column_view_column.t) : column_view_column_t =
  object (self)
    method get_column_view : unit -> column_view_t option =
      fun () ->
        Option.map
          (fun ret -> new column_view ret)
          (Raw.Column_view_column.get_column_view obj)

    method get_expand : unit -> bool =
      fun () -> Raw.Column_view_column.get_expand obj

    method get_factory : unit -> List_item_factory.list_item_factory_t option =
      fun () ->
        Option.map
          (fun ret -> new List_item_factory.list_item_factory ret)
          (Raw.Column_view_column.get_factory obj)

    method get_fixed_width : unit -> int =
      fun () -> Raw.Column_view_column.get_fixed_width obj

    method get_header_menu : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Column_view_column.get_header_menu obj)

    method get_id : unit -> string option =
      fun () -> Raw.Column_view_column.get_id obj

    method get_resizable : unit -> bool =
      fun () -> Raw.Column_view_column.get_resizable obj

    method get_sorter : unit -> Sorter.sorter_t option =
      fun () ->
        Option.map
          (fun ret -> new Sorter.sorter ret)
          (Raw.Column_view_column.get_sorter obj)

    method get_title : unit -> string option =
      fun () -> Raw.Column_view_column.get_title obj

    method get_visible : unit -> bool =
      fun () -> Raw.Column_view_column.get_visible obj

    method set_expand : bool -> unit =
      fun expand -> Raw.Column_view_column.set_expand obj expand

    method set_factory : List_item_factory.list_item_factory_t option -> unit =
      fun factory ->
        let factory = Option.map (fun c -> c#as_list_item_factory) factory in
        Raw.Column_view_column.set_factory obj factory

    method set_fixed_width : int -> unit =
      fun fixed_width -> Raw.Column_view_column.set_fixed_width obj fixed_width

    method set_header_menu : Ocgio.Menu_model.menu_model_t option -> unit =
      fun menu ->
        let menu = Option.map (fun c -> c#as_menu_model) menu in
        Raw.Column_view_column.set_header_menu obj menu

    method set_id : string option -> unit =
      fun id -> Raw.Column_view_column.set_id obj id

    method set_resizable : bool -> unit =
      fun resizable -> Raw.Column_view_column.set_resizable obj resizable

    method set_sorter : Sorter.sorter_t option -> unit =
      fun sorter ->
        let sorter = Option.map (fun c -> c#as_sorter) sorter in
        Raw.Column_view_column.set_sorter obj sorter

    method set_title : string option -> unit =
      fun title -> Raw.Column_view_column.set_title obj title

    method set_visible : bool -> unit =
      fun visible -> Raw.Column_view_column.set_visible obj visible

    method as_column_view_column = obj
  end

let new_ (model : Selection_model.selection_model_t option) : column_view_t =
  let model = Option.map (fun c -> c#as_selection_model) model in
  let obj_ = Raw.Column_view.new_ model in
  new column_view obj_

let new_ (title : string option)
    (factory : List_item_factory.list_item_factory_t option) :
    column_view_column_t =
  let factory = Option.map (fun c -> c#as_list_item_factory) factory in
  let obj_ = Raw.Column_view_column.new_ title factory in
  new column_view_column obj_
