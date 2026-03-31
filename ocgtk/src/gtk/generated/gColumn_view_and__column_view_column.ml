(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type column_view_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gcolumn_view_signals.column_view_signals
    method append_column : column_view_column_t -> unit
    method get_columns : unit -> Ocgtk_gio.Gio.List_model.list_model_t
    method get_enable_rubberband : unit -> bool
    method get_header_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_model : unit -> GSelection_model.selection_model_t option
    method get_reorderable : unit -> bool
    method get_row_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_show_column_separators : unit -> bool
    method get_show_row_separators : unit -> bool
    method get_single_click_activate : unit -> bool
    method get_sorter : unit -> GSorter.sorter_t option
    method get_tab_behavior : unit -> Gtk_enums.listtabbehavior
    method insert_column : int -> column_view_column_t -> unit
    method remove_column : column_view_column_t -> unit
    method scroll_to : int -> column_view_column_t option -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit
    method set_enable_rubberband : bool -> unit
    method set_header_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_reorderable : bool -> unit
    method set_row_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_show_column_separators : bool -> unit
    method set_show_row_separators : bool -> unit
    method set_single_click_activate : bool -> unit
    method set_tab_behavior : Gtk_enums.listtabbehavior -> unit
    method sort_by_column : column_view_column_t option -> Gtk_enums.sorttype -> unit
    method as_column_view : Column_view_and__column_view_column.Column_view.t
end

and column_view_column_t = object
    method get_column_view : unit -> column_view_t option
    method get_expand : unit -> bool
    method get_factory : unit -> GList_item_factory.list_item_factory_t option
    method get_fixed_width : unit -> int
    method get_header_menu : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option
    method get_id : unit -> string option
    method get_resizable : unit -> bool
    method get_sorter : unit -> GSorter.sorter_t option
    method get_title : unit -> string option
    method get_visible : unit -> bool
    method set_expand : bool -> unit
    method set_factory : GList_item_factory.list_item_factory_t option -> unit
    method set_fixed_width : int -> unit
    method set_header_menu : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit
    method set_id : string option -> unit
    method set_resizable : bool -> unit
    method set_sorter : GSorter.sorter_t option -> unit
    method set_title : string option -> unit
    method set_visible : bool -> unit
    method as_column_view_column : Column_view_and__column_view_column.Column_view_column.t
end


(* Signal class defined in gcolumn_view_signals.ml *)

class column_view (obj : Column_view_and__column_view_column.Column_view.t) : column_view_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gcolumn_view_signals.column_view_signals obj

  method append_column : column_view_column_t -> unit =
    fun column ->
      let column = column#as_column_view_column in
      (Column_view_and__column_view_column.Column_view.append_column obj column)

  method get_columns : unit -> Ocgtk_gio.Gio.List_model.list_model_t =
    fun () ->
      new  Ocgtk_gio.Gio.List_model.list_model(Column_view_and__column_view_column.Column_view.get_columns obj)

  method get_enable_rubberband : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view.get_enable_rubberband obj)

  method get_header_factory : unit -> GList_item_factory.list_item_factory_t option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Column_view_and__column_view_column.Column_view.get_header_factory obj)

  method get_model : unit -> GSelection_model.selection_model_t option =
    fun () ->
      Option.map (fun ret -> new GSelection_model.selection_model ret) (Column_view_and__column_view_column.Column_view.get_model obj)

  method get_reorderable : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view.get_reorderable obj)

  method get_row_factory : unit -> GList_item_factory.list_item_factory_t option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Column_view_and__column_view_column.Column_view.get_row_factory obj)

  method get_show_column_separators : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view.get_show_column_separators obj)

  method get_show_row_separators : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view.get_show_row_separators obj)

  method get_single_click_activate : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view.get_single_click_activate obj)

  method get_sorter : unit -> GSorter.sorter_t option =
    fun () ->
      Option.map (fun ret -> new GSorter.sorter ret) (Column_view_and__column_view_column.Column_view.get_sorter obj)

  method get_tab_behavior : unit -> Gtk_enums.listtabbehavior =
    fun () ->
      (Column_view_and__column_view_column.Column_view.get_tab_behavior obj)

  method insert_column : int -> column_view_column_t -> unit =
    fun position column ->
      let column = column#as_column_view_column in
      (Column_view_and__column_view_column.Column_view.insert_column obj position column)

  method remove_column : column_view_column_t -> unit =
    fun column ->
      let column = column#as_column_view_column in
      (Column_view_and__column_view_column.Column_view.remove_column obj column)

  method scroll_to : int -> column_view_column_t option -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit =
    fun pos column flags scroll ->
      let column = Option.map (fun (c) -> c#as_column_view_column) column in
      (Column_view_and__column_view_column.Column_view.scroll_to obj pos column flags scroll)

  method set_enable_rubberband : bool -> unit =
    fun enable_rubberband ->
      (Column_view_and__column_view_column.Column_view.set_enable_rubberband obj enable_rubberband)

  method set_header_factory : GList_item_factory.list_item_factory_t option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Column_view_and__column_view_column.Column_view.set_header_factory obj factory)

  method set_reorderable : bool -> unit =
    fun reorderable ->
      (Column_view_and__column_view_column.Column_view.set_reorderable obj reorderable)

  method set_row_factory : GList_item_factory.list_item_factory_t option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Column_view_and__column_view_column.Column_view.set_row_factory obj factory)

  method set_show_column_separators : bool -> unit =
    fun show_column_separators ->
      (Column_view_and__column_view_column.Column_view.set_show_column_separators obj show_column_separators)

  method set_show_row_separators : bool -> unit =
    fun show_row_separators ->
      (Column_view_and__column_view_column.Column_view.set_show_row_separators obj show_row_separators)

  method set_single_click_activate : bool -> unit =
    fun single_click_activate ->
      (Column_view_and__column_view_column.Column_view.set_single_click_activate obj single_click_activate)

  method set_tab_behavior : Gtk_enums.listtabbehavior -> unit =
    fun tab_behavior ->
      (Column_view_and__column_view_column.Column_view.set_tab_behavior obj tab_behavior)

  method sort_by_column : column_view_column_t option -> Gtk_enums.sorttype -> unit =
    fun column direction ->
      let column = Option.map (fun (c) -> c#as_column_view_column) column in
      (Column_view_and__column_view_column.Column_view.sort_by_column obj column direction)

    method as_column_view = obj
end

and column_view_column (obj : Column_view_and__column_view_column.Column_view_column.t) : column_view_column_t = object (self)

  method get_column_view : unit -> column_view_t option =
    fun () ->
      Option.map (fun ret -> new column_view ret) (Column_view_and__column_view_column.Column_view_column.get_column_view obj)

  method get_expand : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_expand obj)

  method get_factory : unit -> GList_item_factory.list_item_factory_t option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Column_view_and__column_view_column.Column_view_column.get_factory obj)

  method get_fixed_width : unit -> int =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_fixed_width obj)

  method get_header_menu : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.Menu_model.menu_model ret) (Column_view_and__column_view_column.Column_view_column.get_header_menu obj)

  method get_id : unit -> string option =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_id obj)

  method get_resizable : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_resizable obj)

  method get_sorter : unit -> GSorter.sorter_t option =
    fun () ->
      Option.map (fun ret -> new GSorter.sorter ret) (Column_view_and__column_view_column.Column_view_column.get_sorter obj)

  method get_title : unit -> string option =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_title obj)

  method get_visible : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_visible obj)

  method set_expand : bool -> unit =
    fun expand ->
      (Column_view_and__column_view_column.Column_view_column.set_expand obj expand)

  method set_factory : GList_item_factory.list_item_factory_t option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Column_view_and__column_view_column.Column_view_column.set_factory obj factory)

  method set_fixed_width : int -> unit =
    fun fixed_width ->
      (Column_view_and__column_view_column.Column_view_column.set_fixed_width obj fixed_width)

  method set_header_menu : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit =
    fun menu ->
      let menu = Option.map (fun (c) -> c#as_menu_model) menu in
      (Column_view_and__column_view_column.Column_view_column.set_header_menu obj menu)

  method set_id : string option -> unit =
    fun id ->
      (Column_view_and__column_view_column.Column_view_column.set_id obj id)

  method set_resizable : bool -> unit =
    fun resizable ->
      (Column_view_and__column_view_column.Column_view_column.set_resizable obj resizable)

  method set_sorter : GSorter.sorter_t option -> unit =
    fun sorter ->
      let sorter = Option.map (fun (c) -> c#as_sorter) sorter in
      (Column_view_and__column_view_column.Column_view_column.set_sorter obj sorter)

  method set_title : string option -> unit =
    fun title ->
      (Column_view_and__column_view_column.Column_view_column.set_title obj title)

  method set_visible : bool -> unit =
    fun visible ->
      (Column_view_and__column_view_column.Column_view_column.set_visible obj visible)

    method as_column_view_column = obj
end
let new_ (model : GSelection_model.selection_model_t option) : column_view_t =
  let model = Option.map (fun c -> c#as_selection_model) model in
  let obj_ = Column_view_and__column_view_column.Column_view.new_ model in
  new column_view obj_

let new_ (title : string option) (factory : GList_item_factory.list_item_factory_t option) : column_view_column_t =
  let factory = Option.map (fun c -> c#as_list_item_factory) factory in
  let obj_ = Column_view_and__column_view_column.Column_view_column.new_ title factory in
  new column_view_column obj_

