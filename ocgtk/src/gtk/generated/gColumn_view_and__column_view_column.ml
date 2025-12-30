(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

(* Signal class defined in gcolumn_view_signals.ml *)

class column_view (obj : Column_view_and__column_view_column.Column_view.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Column_view_and__column_view_column.Column_view.as_widget obj)
  inherit Gcolumn_view_signals.column_view_signals obj

  method append_column : 'p1. (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) -> unit =
    fun column ->
      let column = column#as_column_view_column in
      (Column_view_and__column_view_column.Column_view.append_column obj column)

  method get_enable_rubberband : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view.get_enable_rubberband obj)

  method get_header_factory : unit -> GList_item_factory.list_item_factory option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Column_view_and__column_view_column.Column_view.get_header_factory obj)

  method get_model : unit -> GSelection_model.selection_model option =
    fun () ->
      Option.map (fun ret -> new GSelection_model.selection_model ret) (Column_view_and__column_view_column.Column_view.get_model obj)

  method get_reorderable : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view.get_reorderable obj)

  method get_row_factory : unit -> GList_item_factory.list_item_factory option =
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

  method get_sorter : unit -> GSorter.sorter option =
    fun () ->
      Option.map (fun ret -> new GSorter.sorter ret) (Column_view_and__column_view_column.Column_view.get_sorter obj)

  method get_tab_behavior : unit -> Gtk_enums.listtabbehavior =
    fun () ->
      (Column_view_and__column_view_column.Column_view.get_tab_behavior obj)

  method insert_column : 'p1. int -> (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) -> unit =
    fun position column ->
      let column = column#as_column_view_column in
      (Column_view_and__column_view_column.Column_view.insert_column obj position column)

  method remove_column : 'p1. (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) -> unit =
    fun column ->
      let column = column#as_column_view_column in
      (Column_view_and__column_view_column.Column_view.remove_column obj column)

  method scroll_to : 'p1. int -> (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) option -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit =
    fun pos column flags scroll ->
      let column = Option.map (fun (c) -> c#as_column_view_column) column in
      (Column_view_and__column_view_column.Column_view.scroll_to obj pos column flags scroll)

  method set_enable_rubberband : bool -> unit =
    fun enable_rubberband ->
      (Column_view_and__column_view_column.Column_view.set_enable_rubberband obj enable_rubberband)

  method set_header_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Column_view_and__column_view_column.Column_view.set_header_factory obj factory)

  method set_reorderable : bool -> unit =
    fun reorderable ->
      (Column_view_and__column_view_column.Column_view.set_reorderable obj reorderable)

  method set_row_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit =
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

  method sort_by_column : 'p1. (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) option -> Gtk_enums.sorttype -> unit =
    fun column direction ->
      let column = Option.map (fun (c) -> c#as_column_view_column) column in
      (Column_view_and__column_view_column.Column_view.sort_by_column obj column direction)

  method as_widget = (Column_view_and__column_view_column.Column_view.as_widget obj)
    method as_column_view = obj
end

and column_view_column (obj : Column_view_and__column_view_column.Column_view_column.t) = object (self)

  method get_column_view : unit -> column_view option =
    fun () ->
      Option.map (fun ret -> new column_view ret) (Column_view_and__column_view_column.Column_view_column.get_column_view obj)

  method get_expand : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_expand obj)

  method get_factory : unit -> GList_item_factory.list_item_factory option =
    fun () ->
      Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Column_view_and__column_view_column.Column_view_column.get_factory obj)

  method get_fixed_width : unit -> int =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_fixed_width obj)

  method get_id : unit -> string option =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_id obj)

  method get_resizable : unit -> bool =
    fun () ->
      (Column_view_and__column_view_column.Column_view_column.get_resizable obj)

  method get_sorter : unit -> GSorter.sorter option =
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

  method set_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit =
    fun factory ->
      let factory = Option.map (fun (c) -> c#as_list_item_factory) factory in
      (Column_view_and__column_view_column.Column_view_column.set_factory obj factory)

  method set_fixed_width : int -> unit =
    fun fixed_width ->
      (Column_view_and__column_view_column.Column_view_column.set_fixed_width obj fixed_width)

  method set_id : string option -> unit =
    fun id ->
      (Column_view_and__column_view_column.Column_view_column.set_id obj id)

  method set_resizable : bool -> unit =
    fun resizable ->
      (Column_view_and__column_view_column.Column_view_column.set_resizable obj resizable)

  method set_sorter : 'p1. (#GSorter.sorter as 'p1) option -> unit =
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
