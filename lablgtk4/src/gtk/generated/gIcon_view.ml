(* Signal class defined in gicon_view_signals.ml *)

(* High-level class for IconView *)
class icon_view (obj : Icon_view.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Icon_view.as_widget obj)
  inherit Gicon_view_signals.icon_view_signals obj

  method activate_on_single_click = Icon_view.get_activate_on_single_click obj
  method set_activate_on_single_click v = Icon_view.set_activate_on_single_click obj v

  method column_spacing = Icon_view.get_column_spacing obj
  method set_column_spacing v = Icon_view.set_column_spacing obj v

  method columns = Icon_view.get_columns obj
  method set_columns v = Icon_view.set_columns obj v

  method item_padding = Icon_view.get_item_padding obj
  method set_item_padding v = Icon_view.set_item_padding obj v

  method item_width = Icon_view.get_item_width obj
  method set_item_width v = Icon_view.set_item_width obj v

  method margin = Icon_view.get_margin obj
  method set_margin v = Icon_view.set_margin obj v

  method markup_column = Icon_view.get_markup_column obj
  method set_markup_column v = Icon_view.set_markup_column obj v

  method pixbuf_column = Icon_view.get_pixbuf_column obj
  method set_pixbuf_column v = Icon_view.set_pixbuf_column obj v

  method reorderable = Icon_view.get_reorderable obj
  method set_reorderable v = Icon_view.set_reorderable obj v

  method row_spacing = Icon_view.get_row_spacing obj
  method set_row_spacing v = Icon_view.set_row_spacing obj v

  method spacing = Icon_view.get_spacing obj
  method set_spacing v = Icon_view.set_spacing obj v

  method text_column = Icon_view.get_text_column obj
  method set_text_column v = Icon_view.set_text_column obj v

  method tooltip_column = Icon_view.get_tooltip_column obj
  method set_tooltip_column v = Icon_view.set_tooltip_column obj v

  method get_item_column : Tree_path.t -> int = fun path -> (Icon_view.get_item_column obj path)

  method get_item_orientation : unit -> Gtk_enums.orientation = fun () -> (Icon_view.get_item_orientation obj )

  method get_item_row : Tree_path.t -> int = fun path -> (Icon_view.get_item_row obj path)

  method get_model : unit -> GTree_model.tree_model option = fun () -> Option.map (fun ret -> new GTree_model.tree_model ret) (Icon_view.get_model obj )

  method get_path_at_pos : int -> int -> Tree_path.t option = fun x y -> (Icon_view.get_path_at_pos obj x y)

  method get_selection_mode : unit -> Gtk_enums.selectionmode = fun () -> (Icon_view.get_selection_mode obj )

  method item_activated : Tree_path.t -> unit = fun path -> (Icon_view.item_activated obj path)

  method path_is_selected : Tree_path.t -> bool = fun path -> (Icon_view.path_is_selected obj path)

  method scroll_to_path : Tree_path.t -> bool -> float -> float -> unit = fun path use_align row_align col_align -> (Icon_view.scroll_to_path obj path use_align row_align col_align)

  method select_all : unit -> unit = fun () -> (Icon_view.select_all obj )

  method select_path : Tree_path.t -> unit = fun path -> (Icon_view.select_path obj path)

  (* method set_cursor = ... *) (* CONFLICT: incompatible signature with parent method *)

  method set_drag_dest_item : Tree_path.t option -> Gtk_enums.iconviewdropposition -> unit = fun path pos -> (Icon_view.set_drag_dest_item obj path pos)

  method set_item_orientation : Gtk_enums.orientation -> unit = fun orientation -> (Icon_view.set_item_orientation obj orientation)

  method set_model : GTree_model.tree_model option -> unit = fun model -> (Icon_view.set_model obj ( model |> Option.map (fun x -> x#as_tree_model) ))

  method set_selection_mode : Gtk_enums.selectionmode -> unit = fun mode -> (Icon_view.set_selection_mode obj mode)

  method set_tooltip_cell : 'p1 'p2. (#GTooltip.tooltip as 'p1) -> Tree_path.t -> (#GCell_renderer.cell_renderer as 'p2) option -> unit =
    fun tooltip path cell ->
      let tooltip = tooltip#as_tooltip in
      let cell = Option.map (fun (c) -> c#as_cell_renderer) cell in
      (Icon_view.set_tooltip_cell obj tooltip path cell)

  method set_tooltip_item : 'p1. (#GTooltip.tooltip as 'p1) -> Tree_path.t -> unit = fun tooltip path -> (Icon_view.set_tooltip_item obj ( tooltip#as_tooltip ) path)

  method unselect_all : unit -> unit = fun () -> (Icon_view.unselect_all obj )

  method unselect_path : Tree_path.t -> unit = fun path -> (Icon_view.unselect_path obj path)

  method unset_model_drag_dest : unit -> unit = fun () -> (Icon_view.unset_model_drag_dest obj )

  method unset_model_drag_source : unit -> unit = fun () -> (Icon_view.unset_model_drag_source obj )

  method as_widget = (Icon_view.as_widget obj)
    method as_icon_view = obj
end

