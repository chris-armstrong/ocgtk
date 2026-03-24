(* Signal class defined in gicon_view_signals.ml *)

class type icon_view_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gicon_view_signals.icon_view_signals
    method create_drag_icon : Tree_path.t -> Ocgtk_gdk.Gdk.Paintable.paintable_t option
    method enable_model_drag_dest : Ocgtk_gdk.Gdk.Content_formats.content_formats_t -> Ocgtk_gdk.Gdk.dragaction -> unit
    method enable_model_drag_source : Ocgtk_gdk.Gdk.modifiertype -> Ocgtk_gdk.Gdk.Content_formats.content_formats_t -> Ocgtk_gdk.Gdk.dragaction -> unit
    method get_activate_on_single_click : unit -> bool
    method get_column_spacing : unit -> int
    method get_columns : unit -> int
    method get_item_column : Tree_path.t -> int
    method get_item_orientation : unit -> Gtk_enums.orientation
    method get_item_padding : unit -> int
    method get_item_row : Tree_path.t -> int
    method get_item_width : unit -> int
    method get_margin : unit -> int
    method get_markup_column : unit -> int
    method get_model : unit -> GTree_model.tree_model_t option
    method get_path_at_pos : int -> int -> Tree_path.t option
    method get_pixbuf_column : unit -> int
    method get_reorderable : unit -> bool
    method get_row_spacing : unit -> int
    method get_selection_mode : unit -> Gtk_enums.selectionmode
    method get_spacing : unit -> int
    method get_text_column : unit -> int
    method get_tooltip_column : unit -> int
    method item_activated : Tree_path.t -> unit
    method path_is_selected : Tree_path.t -> bool
    method scroll_to_path : Tree_path.t -> bool -> float -> float -> unit
    method select_all : unit -> unit
    method select_path : Tree_path.t -> unit
    method set_activate_on_single_click : bool -> unit
    method set_column_spacing : int -> unit
    method set_columns : int -> unit
    method set_drag_dest_item : Tree_path.t option -> Gtk_enums.iconviewdropposition -> unit
    method set_item_orientation : Gtk_enums.orientation -> unit
    method set_item_padding : int -> unit
    method set_item_width : int -> unit
    method set_margin : int -> unit
    method set_markup_column : int -> unit
    method set_pixbuf_column : int -> unit
    method set_reorderable : bool -> unit
    method set_row_spacing : int -> unit
    method set_selection_mode : Gtk_enums.selectionmode -> unit
    method set_spacing : int -> unit
    method set_text_column : int -> unit
    method set_tooltip_cell : GTooltip.tooltip_t -> Tree_path.t -> GCell_renderer.cell_renderer_t option -> unit
    method set_tooltip_column : int -> unit
    method set_tooltip_item : GTooltip.tooltip_t -> Tree_path.t -> unit
    method unselect_all : unit -> unit
    method unselect_path : Tree_path.t -> unit
    method unset_model_drag_dest : unit -> unit
    method unset_model_drag_source : unit -> unit
    method cell_area : GCell_area_and__cell_area_context.cell_area_t
    method as_icon_view : Icon_view.t
end

(* High-level class for IconView *)
class icon_view (obj : Icon_view.t) : icon_view_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gicon_view_signals.icon_view_signals obj

  method create_drag_icon : Tree_path.t -> Ocgtk_gdk.Gdk.Paintable.paintable_t option =
    fun path ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Paintable.paintable ret) (Icon_view.create_drag_icon obj path)

  method enable_model_drag_dest : Ocgtk_gdk.Gdk.Content_formats.content_formats_t -> Ocgtk_gdk.Gdk.dragaction -> unit =
    fun formats actions ->
      let formats = formats#as_content_formats in
      (Icon_view.enable_model_drag_dest obj formats actions)

  method enable_model_drag_source : Ocgtk_gdk.Gdk.modifiertype -> Ocgtk_gdk.Gdk.Content_formats.content_formats_t -> Ocgtk_gdk.Gdk.dragaction -> unit =
    fun start_button_mask formats actions ->
      let formats = formats#as_content_formats in
      (Icon_view.enable_model_drag_source obj start_button_mask formats actions)

  method get_activate_on_single_click : unit -> bool =
    fun () ->
      (Icon_view.get_activate_on_single_click obj)

  method get_column_spacing : unit -> int =
    fun () ->
      (Icon_view.get_column_spacing obj)

  method get_columns : unit -> int =
    fun () ->
      (Icon_view.get_columns obj)

  method get_item_column : Tree_path.t -> int =
    fun path ->
      (Icon_view.get_item_column obj path)

  method get_item_orientation : unit -> Gtk_enums.orientation =
    fun () ->
      (Icon_view.get_item_orientation obj)

  method get_item_padding : unit -> int =
    fun () ->
      (Icon_view.get_item_padding obj)

  method get_item_row : Tree_path.t -> int =
    fun path ->
      (Icon_view.get_item_row obj path)

  method get_item_width : unit -> int =
    fun () ->
      (Icon_view.get_item_width obj)

  method get_margin : unit -> int =
    fun () ->
      (Icon_view.get_margin obj)

  method get_markup_column : unit -> int =
    fun () ->
      (Icon_view.get_markup_column obj)

  method get_model : unit -> GTree_model.tree_model_t option =
    fun () ->
      Option.map (fun ret -> new GTree_model.tree_model ret) (Icon_view.get_model obj)

  method get_path_at_pos : int -> int -> Tree_path.t option =
    fun x y ->
      (Icon_view.get_path_at_pos obj x y)

  method get_pixbuf_column : unit -> int =
    fun () ->
      (Icon_view.get_pixbuf_column obj)

  method get_reorderable : unit -> bool =
    fun () ->
      (Icon_view.get_reorderable obj)

  method get_row_spacing : unit -> int =
    fun () ->
      (Icon_view.get_row_spacing obj)

  method get_selection_mode : unit -> Gtk_enums.selectionmode =
    fun () ->
      (Icon_view.get_selection_mode obj)

  method get_spacing : unit -> int =
    fun () ->
      (Icon_view.get_spacing obj)

  method get_text_column : unit -> int =
    fun () ->
      (Icon_view.get_text_column obj)

  method get_tooltip_column : unit -> int =
    fun () ->
      (Icon_view.get_tooltip_column obj)

  method item_activated : Tree_path.t -> unit =
    fun path ->
      (Icon_view.item_activated obj path)

  method path_is_selected : Tree_path.t -> bool =
    fun path ->
      (Icon_view.path_is_selected obj path)

  method scroll_to_path : Tree_path.t -> bool -> float -> float -> unit =
    fun path use_align row_align col_align ->
      (Icon_view.scroll_to_path obj path use_align row_align col_align)

  method select_all : unit -> unit =
    fun () ->
      (Icon_view.select_all obj)

  method select_path : Tree_path.t -> unit =
    fun path ->
      (Icon_view.select_path obj path)

  method set_activate_on_single_click : bool -> unit =
    fun single ->
      (Icon_view.set_activate_on_single_click obj single)

  method set_column_spacing : int -> unit =
    fun column_spacing ->
      (Icon_view.set_column_spacing obj column_spacing)

  method set_columns : int -> unit =
    fun columns ->
      (Icon_view.set_columns obj columns)

  method set_drag_dest_item : Tree_path.t option -> Gtk_enums.iconviewdropposition -> unit =
    fun path pos ->
      (Icon_view.set_drag_dest_item obj path pos)

  method set_item_orientation : Gtk_enums.orientation -> unit =
    fun orientation ->
      (Icon_view.set_item_orientation obj orientation)

  method set_item_padding : int -> unit =
    fun item_padding ->
      (Icon_view.set_item_padding obj item_padding)

  method set_item_width : int -> unit =
    fun item_width ->
      (Icon_view.set_item_width obj item_width)

  method set_margin : int -> unit =
    fun margin ->
      (Icon_view.set_margin obj margin)

  method set_markup_column : int -> unit =
    fun column ->
      (Icon_view.set_markup_column obj column)

  method set_pixbuf_column : int -> unit =
    fun column ->
      (Icon_view.set_pixbuf_column obj column)

  method set_reorderable : bool -> unit =
    fun reorderable ->
      (Icon_view.set_reorderable obj reorderable)

  method set_row_spacing : int -> unit =
    fun row_spacing ->
      (Icon_view.set_row_spacing obj row_spacing)

  method set_selection_mode : Gtk_enums.selectionmode -> unit =
    fun mode ->
      (Icon_view.set_selection_mode obj mode)

  method set_spacing : int -> unit =
    fun spacing ->
      (Icon_view.set_spacing obj spacing)

  method set_text_column : int -> unit =
    fun column ->
      (Icon_view.set_text_column obj column)

  method set_tooltip_cell : GTooltip.tooltip_t -> Tree_path.t -> GCell_renderer.cell_renderer_t option -> unit =
    fun tooltip path cell ->
      let tooltip = tooltip#as_tooltip in
      let cell = Option.map (fun (c) -> c#as_cell_renderer) cell in
      (Icon_view.set_tooltip_cell obj tooltip path cell)

  method set_tooltip_column : int -> unit =
    fun column ->
      (Icon_view.set_tooltip_column obj column)

  method set_tooltip_item : GTooltip.tooltip_t -> Tree_path.t -> unit =
    fun tooltip path ->
      let tooltip = tooltip#as_tooltip in
      (Icon_view.set_tooltip_item obj tooltip path)

  method unselect_all : unit -> unit =
    fun () ->
      (Icon_view.unselect_all obj)

  method unselect_path : Tree_path.t -> unit =
    fun path ->
      (Icon_view.unselect_path obj path)

  method unset_model_drag_dest : unit -> unit =
    fun () ->
      (Icon_view.unset_model_drag_dest obj)

  method unset_model_drag_source : unit -> unit =
    fun () ->
      (Icon_view.unset_model_drag_source obj)

  method cell_area = new GCell_area_and__cell_area_context.cell_area (Icon_view.get_cell_area obj)

    method as_icon_view = obj
end

let new_ () : icon_view_t =
  new icon_view (Icon_view.new_ ())

let new_with_area (area : GCell_area_and__cell_area_context.cell_area_t) : icon_view_t =
  let area = area#as_cell_area in
  new icon_view (Icon_view.new_with_area area)

let new_with_model (model : GTree_model.tree_model_t) : icon_view_t =
  let model = model#as_tree_model in
  new icon_view (Icon_view.new_with_model model)

