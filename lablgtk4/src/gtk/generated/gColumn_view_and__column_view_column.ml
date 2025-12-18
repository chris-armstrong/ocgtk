(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

(* Signal class defined in gcolumn_view_signals.ml *)

class column_view (obj : Column_view_and__column_view_column.Column_view.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Column_view_and__column_view_column.Column_view.as_widget obj)
  inherit Gcolumn_view_signals.column_view_signals obj

  method enable_rubberband = Column_view_and__column_view_column.Column_view.get_enable_rubberband obj
  method set_enable_rubberband v = Column_view_and__column_view_column.Column_view.set_enable_rubberband obj v

  method reorderable = Column_view_and__column_view_column.Column_view.get_reorderable obj
  method set_reorderable v = Column_view_and__column_view_column.Column_view.set_reorderable obj v

  method show_column_separators = Column_view_and__column_view_column.Column_view.get_show_column_separators obj
  method set_show_column_separators v = Column_view_and__column_view_column.Column_view.set_show_column_separators obj v

  method show_row_separators = Column_view_and__column_view_column.Column_view.get_show_row_separators obj
  method set_show_row_separators v = Column_view_and__column_view_column.Column_view.set_show_row_separators obj v

  method single_click_activate = Column_view_and__column_view_column.Column_view.get_single_click_activate obj
  method set_single_click_activate v = Column_view_and__column_view_column.Column_view.set_single_click_activate obj v

  method append_column : 'p1. (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) -> unit = fun column -> (Column_view_and__column_view_column.Column_view.append_column obj ( column#as_column_view_column ))

  method get_header_factory : unit -> GList_item_factory.list_item_factory option = fun () -> Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Column_view_and__column_view_column.Column_view.get_header_factory obj )

  method get_model : unit -> GSelection_model.selection_model option = fun () -> Option.map (fun ret -> new GSelection_model.selection_model ret) (Column_view_and__column_view_column.Column_view.get_model obj )

  method get_row_factory : unit -> GList_item_factory.list_item_factory option = fun () -> Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Column_view_and__column_view_column.Column_view.get_row_factory obj )

  method get_sorter : unit -> GSorter.sorter option = fun () -> Option.map (fun ret -> new GSorter.sorter ret) (Column_view_and__column_view_column.Column_view.get_sorter obj )

  method get_tab_behavior : unit -> Gtk_enums.listtabbehavior = fun () -> (Column_view_and__column_view_column.Column_view.get_tab_behavior obj )

  method insert_column : 'p1. int -> (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) -> unit = fun position column -> (Column_view_and__column_view_column.Column_view.insert_column obj position ( column#as_column_view_column ))

  method remove_column : 'p1. (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) -> unit = fun column -> (Column_view_and__column_view_column.Column_view.remove_column obj ( column#as_column_view_column ))

  method scroll_to : 'p1. int -> (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) option -> Gtk_enums.listscrollflags -> Scroll_info.t option -> unit = fun pos column flags scroll -> (Column_view_and__column_view_column.Column_view.scroll_to obj pos ( column |> Option.map (fun x -> x#as_column_view_column) ) flags scroll)

  method set_header_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit = fun factory -> (Column_view_and__column_view_column.Column_view.set_header_factory obj ( factory |> Option.map (fun x -> x#as_list_item_factory) ))

  method set_model : GSelection_model.selection_model option -> unit = fun model -> (Column_view_and__column_view_column.Column_view.set_model obj ( model |> Option.map (fun x -> x#as_selection_model) ))

  method set_row_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit = fun factory -> (Column_view_and__column_view_column.Column_view.set_row_factory obj ( factory |> Option.map (fun x -> x#as_list_item_factory) ))

  method set_tab_behavior : Gtk_enums.listtabbehavior -> unit = fun tab_behavior -> (Column_view_and__column_view_column.Column_view.set_tab_behavior obj tab_behavior)

  method sort_by_column : 'p1. (<as_column_view_column: Column_view_and__column_view_column.Column_view_column.t; ..> as 'p1) option -> Gtk_enums.sorttype -> unit = fun column direction -> (Column_view_and__column_view_column.Column_view.sort_by_column obj ( column |> Option.map (fun x -> x#as_column_view_column) ) direction)

  method as_widget = (Column_view_and__column_view_column.Column_view.as_widget obj)
    method as_column_view = obj
end

and column_view_column (obj : Column_view_and__column_view_column.Column_view_column.t) = object (self)

  method expand = Column_view_and__column_view_column.Column_view_column.get_expand obj
  method set_expand v = Column_view_and__column_view_column.Column_view_column.set_expand obj v

  method fixed_width = Column_view_and__column_view_column.Column_view_column.get_fixed_width obj
  method set_fixed_width v = Column_view_and__column_view_column.Column_view_column.set_fixed_width obj v

  method id = Column_view_and__column_view_column.Column_view_column.get_id obj
  method set_id v = Column_view_and__column_view_column.Column_view_column.set_id obj v

  method resizable = Column_view_and__column_view_column.Column_view_column.get_resizable obj
  method set_resizable v = Column_view_and__column_view_column.Column_view_column.set_resizable obj v

  method title = Column_view_and__column_view_column.Column_view_column.get_title obj
  method set_title v = Column_view_and__column_view_column.Column_view_column.set_title obj v

  method visible = Column_view_and__column_view_column.Column_view_column.get_visible obj
  method set_visible v = Column_view_and__column_view_column.Column_view_column.set_visible obj v

  method get_column_view : unit -> column_view option = fun () -> Option.map (fun ret -> new column_view ret) (Column_view_and__column_view_column.Column_view_column.get_column_view obj )

  method get_factory : unit -> GList_item_factory.list_item_factory option = fun () -> Option.map (fun ret -> new GList_item_factory.list_item_factory ret) (Column_view_and__column_view_column.Column_view_column.get_factory obj )

  method get_sorter : unit -> GSorter.sorter option = fun () -> Option.map (fun ret -> new GSorter.sorter ret) (Column_view_and__column_view_column.Column_view_column.get_sorter obj )

  method set_factory : 'p1. (#GList_item_factory.list_item_factory as 'p1) option -> unit = fun factory -> (Column_view_and__column_view_column.Column_view_column.set_factory obj ( factory |> Option.map (fun x -> x#as_list_item_factory) ))

  method set_sorter : 'p1. (#GSorter.sorter as 'p1) option -> unit = fun sorter -> (Column_view_and__column_view_column.Column_view_column.set_sorter obj ( sorter |> Option.map (fun x -> x#as_sorter) ))

    method as_column_view_column = obj
end
