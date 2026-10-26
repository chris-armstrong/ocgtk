class type icon_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t
  inherit Scrollable.scrollable_t

  method on_activate_cursor_item :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep ->
      count:int ->
      extend:bool ->
      modify:bool ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_select_cursor_item :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_selection_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggle_cursor_item :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method create_drag_icon :
    Raw.Tree_path.t -> Ocgdk.Paintable.paintable_t option

  method enable_model_drag_dest :
    Ocgdk.Content_formats.content_formats_t -> Ocgdk.Enums.dragaction -> unit

  method enable_model_drag_source :
    Ocgdk.Enums.modifiertype ->
    Ocgdk.Content_formats.content_formats_t ->
    Ocgdk.Enums.dragaction ->
    unit

  method get_activate_on_single_click : unit -> bool
  method get_column_spacing : unit -> int
  method get_columns : unit -> int
  method get_item_column : Raw.Tree_path.t -> int
  method get_item_orientation : unit -> Enums.orientation
  method get_item_padding : unit -> int
  method get_item_row : Raw.Tree_path.t -> int
  method get_item_width : unit -> int
  method get_margin : unit -> int
  method get_markup_column : unit -> int
  method get_model : unit -> Tree_model.tree_model_t option
  method get_path_at_pos : int -> int -> Raw.Tree_path.t option
  method get_pixbuf_column : unit -> int
  method get_reorderable : unit -> bool
  method get_row_spacing : unit -> int
  method get_selected_items : unit -> Raw.Tree_path.t list
  method get_selection_mode : unit -> Enums.selectionmode
  method get_spacing : unit -> int
  method get_text_column : unit -> int
  method get_tooltip_column : unit -> int
  method item_activated : Raw.Tree_path.t -> unit
  method path_is_selected : Raw.Tree_path.t -> bool
  method scroll_to_path : Raw.Tree_path.t -> bool -> float -> float -> unit
  method select_all : unit -> unit
  method select_path : Raw.Tree_path.t -> unit
  method set_activate_on_single_click : bool -> unit
  method set_column_spacing : int -> unit
  method set_columns : int -> unit

  method set_drag_dest_item :
    Raw.Tree_path.t option -> Enums.iconviewdropposition -> unit

  method set_item_orientation : Enums.orientation -> unit
  method set_item_padding : int -> unit
  method set_item_width : int -> unit
  method set_margin : int -> unit
  method set_markup_column : int -> unit
  method set_model : Tree_model.tree_model_t option -> unit
  method set_pixbuf_column : int -> unit
  method set_reorderable : bool -> unit
  method set_row_spacing : int -> unit
  method set_selection_mode : Enums.selectionmode -> unit
  method set_spacing : int -> unit
  method set_text_column : int -> unit

  method set_tooltip_cell :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t ->
    Cell_renderer.cell_renderer_t option ->
    unit

  method set_tooltip_column : int -> unit

  method set_tooltip_item :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t ->
    unit

  method unselect_all : unit -> unit
  method unselect_path : Raw.Tree_path.t -> unit
  method unset_model_drag_dest : unit -> unit
  method unset_model_drag_source : unit -> unit

  method cell_area :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method as_icon_view : Raw.Icon_view.t
end

(* High-level class for IconView *)
class icon_view (obj : Raw.Icon_view.t) : icon_view_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Cell_area_and__cell_area_context_and__cell_layout.cell_layout
        (Raw.Cell_layout.from_gobject obj)

    inherit Scrollable.scrollable (Raw.Scrollable.from_gobject obj)

    method on_activate_cursor_item ?(after = false) ~callback () =
      Raw.Icon_view.on_activate_cursor_item ~after self#as_icon_view ~callback

    method on_move_cursor ?(after = false) ~callback () =
      Raw.Icon_view.on_move_cursor ~after self#as_icon_view ~callback

    method on_select_all ?(after = false) ~callback () =
      Raw.Icon_view.on_select_all ~after self#as_icon_view ~callback

    method on_select_cursor_item ?(after = false) ~callback () =
      Raw.Icon_view.on_select_cursor_item ~after self#as_icon_view ~callback

    method on_selection_changed ?(after = false) ~callback () =
      Raw.Icon_view.on_selection_changed ~after self#as_icon_view ~callback

    method on_toggle_cursor_item ?(after = false) ~callback () =
      Raw.Icon_view.on_toggle_cursor_item ~after self#as_icon_view ~callback

    method on_unselect_all ?(after = false) ~callback () =
      Raw.Icon_view.on_unselect_all ~after self#as_icon_view ~callback

    method create_drag_icon :
        Raw.Tree_path.t -> Ocgdk.Paintable.paintable_t option =
      fun path ->
        Option.map
          (fun ret -> new Ocgdk.Paintable.paintable ret)
          (Raw.Icon_view.create_drag_icon obj path)

    method enable_model_drag_dest :
        Ocgdk.Content_formats.content_formats_t ->
        Ocgdk.Enums.dragaction ->
        unit =
      fun formats actions ->
        let formats = formats#as_content_formats in
        Raw.Icon_view.enable_model_drag_dest obj formats actions

    method enable_model_drag_source :
        Ocgdk.Enums.modifiertype ->
        Ocgdk.Content_formats.content_formats_t ->
        Ocgdk.Enums.dragaction ->
        unit =
      fun start_button_mask formats actions ->
        let formats = formats#as_content_formats in
        Raw.Icon_view.enable_model_drag_source obj start_button_mask formats
          actions

    method get_activate_on_single_click : unit -> bool =
      fun () -> Raw.Icon_view.get_activate_on_single_click obj

    method get_column_spacing : unit -> int =
      fun () -> Raw.Icon_view.get_column_spacing obj

    method get_columns : unit -> int = fun () -> Raw.Icon_view.get_columns obj

    method get_item_column : Raw.Tree_path.t -> int =
      fun path -> Raw.Icon_view.get_item_column obj path

    method get_item_orientation : unit -> Enums.orientation =
      fun () -> Raw.Icon_view.get_item_orientation obj

    method get_item_padding : unit -> int =
      fun () -> Raw.Icon_view.get_item_padding obj

    method get_item_row : Raw.Tree_path.t -> int =
      fun path -> Raw.Icon_view.get_item_row obj path

    method get_item_width : unit -> int =
      fun () -> Raw.Icon_view.get_item_width obj

    method get_margin : unit -> int = fun () -> Raw.Icon_view.get_margin obj

    method get_markup_column : unit -> int =
      fun () -> Raw.Icon_view.get_markup_column obj

    method get_model : unit -> Tree_model.tree_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Tree_model.tree_model ret)
          (Raw.Icon_view.get_model obj)

    method get_path_at_pos : int -> int -> Raw.Tree_path.t option =
      fun x y -> Raw.Icon_view.get_path_at_pos obj x y

    method get_pixbuf_column : unit -> int =
      fun () -> Raw.Icon_view.get_pixbuf_column obj

    method get_reorderable : unit -> bool =
      fun () -> Raw.Icon_view.get_reorderable obj

    method get_row_spacing : unit -> int =
      fun () -> Raw.Icon_view.get_row_spacing obj

    method get_selected_items : unit -> Raw.Tree_path.t list =
      fun () -> Raw.Icon_view.get_selected_items obj

    method get_selection_mode : unit -> Enums.selectionmode =
      fun () -> Raw.Icon_view.get_selection_mode obj

    method get_spacing : unit -> int = fun () -> Raw.Icon_view.get_spacing obj

    method get_text_column : unit -> int =
      fun () -> Raw.Icon_view.get_text_column obj

    method get_tooltip_column : unit -> int =
      fun () -> Raw.Icon_view.get_tooltip_column obj

    method item_activated : Raw.Tree_path.t -> unit =
      fun path -> Raw.Icon_view.item_activated obj path

    method path_is_selected : Raw.Tree_path.t -> bool =
      fun path -> Raw.Icon_view.path_is_selected obj path

    method scroll_to_path : Raw.Tree_path.t -> bool -> float -> float -> unit =
      fun path use_align row_align col_align ->
        Raw.Icon_view.scroll_to_path obj path use_align row_align col_align

    method select_all : unit -> unit = fun () -> Raw.Icon_view.select_all obj

    method select_path : Raw.Tree_path.t -> unit =
      fun path -> Raw.Icon_view.select_path obj path

    method set_activate_on_single_click : bool -> unit =
      fun single -> Raw.Icon_view.set_activate_on_single_click obj single

    method set_column_spacing : int -> unit =
      fun column_spacing -> Raw.Icon_view.set_column_spacing obj column_spacing

    method set_columns : int -> unit =
      fun columns -> Raw.Icon_view.set_columns obj columns

    method set_drag_dest_item :
        Raw.Tree_path.t option -> Enums.iconviewdropposition -> unit =
      fun path pos -> Raw.Icon_view.set_drag_dest_item obj path pos

    method set_item_orientation : Enums.orientation -> unit =
      fun orientation -> Raw.Icon_view.set_item_orientation obj orientation

    method set_item_padding : int -> unit =
      fun item_padding -> Raw.Icon_view.set_item_padding obj item_padding

    method set_item_width : int -> unit =
      fun item_width -> Raw.Icon_view.set_item_width obj item_width

    method set_margin : int -> unit =
      fun margin -> Raw.Icon_view.set_margin obj margin

    method set_markup_column : int -> unit =
      fun column -> Raw.Icon_view.set_markup_column obj column

    method set_model : Tree_model.tree_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_tree_model) model in
        Raw.Icon_view.set_model obj model

    method set_pixbuf_column : int -> unit =
      fun column -> Raw.Icon_view.set_pixbuf_column obj column

    method set_reorderable : bool -> unit =
      fun reorderable -> Raw.Icon_view.set_reorderable obj reorderable

    method set_row_spacing : int -> unit =
      fun row_spacing -> Raw.Icon_view.set_row_spacing obj row_spacing

    method set_selection_mode : Enums.selectionmode -> unit =
      fun mode -> Raw.Icon_view.set_selection_mode obj mode

    method set_spacing : int -> unit =
      fun spacing -> Raw.Icon_view.set_spacing obj spacing

    method set_text_column : int -> unit =
      fun column -> Raw.Icon_view.set_text_column obj column

    method set_tooltip_cell :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .tooltip_t ->
        Raw.Tree_path.t ->
        Cell_renderer.cell_renderer_t option ->
        unit =
      fun tooltip path cell ->
        let tooltip = tooltip#as_tooltip in
        let cell = Option.map (fun c -> c#as_cell_renderer) cell in
        Raw.Icon_view.set_tooltip_cell obj tooltip path cell

    method set_tooltip_column : int -> unit =
      fun column -> Raw.Icon_view.set_tooltip_column obj column

    method set_tooltip_item :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .tooltip_t ->
        Raw.Tree_path.t ->
        unit =
      fun tooltip path ->
        let tooltip = tooltip#as_tooltip in
        Raw.Icon_view.set_tooltip_item obj tooltip path

    method unselect_all : unit -> unit =
      fun () -> Raw.Icon_view.unselect_all obj

    method unselect_path : Raw.Tree_path.t -> unit =
      fun path -> Raw.Icon_view.unselect_path obj path

    method unset_model_drag_dest : unit -> unit =
      fun () -> Raw.Icon_view.unset_model_drag_dest obj

    method unset_model_drag_source : unit -> unit =
      fun () -> Raw.Icon_view.unset_model_drag_source obj

    method cell_area =
      new Cell_area_and__cell_area_context_and__cell_layout.cell_area
        (Raw.Icon_view.get_cell_area obj)

    method as_icon_view = obj
  end

let new_ () : icon_view_t = new icon_view (Raw.Icon_view.new_ ())

let new_with_area
    (area : Cell_area_and__cell_area_context_and__cell_layout.cell_area_t) :
    icon_view_t =
  let area = area#as_cell_area in
  let obj_ = Raw.Icon_view.new_with_area area in
  new icon_view obj_

let new_with_model (model : Tree_model.tree_model_t) : icon_view_t =
  let model = model#as_tree_model in
  let obj_ = Raw.Icon_view.new_with_model model in
  new icon_view obj_
