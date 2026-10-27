class type tree_view_column_t = object
  inherit Buildable.buildable_t
  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t

  method on_clicked :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method cell_is_visible : unit -> bool

  method cell_set_cell_data :
    Tree_model.tree_model_t -> Raw.Tree_iter.t -> bool -> bool -> unit

  method clicked : unit -> unit
  method focus_cell : Cell_renderer.cell_renderer_t -> unit
  method get_alignment : unit -> float

  method get_button :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_clickable : unit -> bool
  method get_expand : unit -> bool
  method get_fixed_width : unit -> int
  method get_max_width : unit -> int
  method get_min_width : unit -> int
  method get_reorderable : unit -> bool
  method get_resizable : unit -> bool
  method get_sizing : unit -> Enums.treeviewcolumnsizing
  method get_sort_column_id : unit -> int
  method get_sort_indicator : unit -> bool
  method get_sort_order : unit -> Enums.sorttype
  method get_spacing : unit -> int
  method get_title : unit -> string

  method get_tree_view :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_visible : unit -> bool

  method get_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_width : unit -> int
  method get_x_offset : unit -> int
  method queue_resize : unit -> unit
  method set_alignment : float -> unit
  method set_clickable : bool -> unit
  method set_expand : bool -> unit
  method set_fixed_width : int -> unit
  method set_max_width : int -> unit
  method set_min_width : int -> unit
  method set_reorderable : bool -> unit
  method set_resizable : bool -> unit
  method set_sizing : Enums.treeviewcolumnsizing -> unit
  method set_sort_column_id : int -> unit
  method set_sort_indicator : bool -> unit
  method set_sort_order : Enums.sorttype -> unit
  method set_spacing : int -> unit
  method set_title : string -> unit
  method set_visible : bool -> unit

  method set_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method cell_area :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method as_tree_view_column : Raw.Tree_view_column.t
end

(* High-level class for TreeViewColumn *)
class tree_view_column (obj : Raw.Tree_view_column.t) : tree_view_column_t =
  object (self)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    inherit
      Cell_area_and__cell_area_context_and__cell_layout.cell_layout
        (Raw.Cell_layout.from_gobject obj)

    method on_clicked ?(after = false) ~callback () =
      Raw.Tree_view_column.on_clicked ~after self#as_tree_view_column ~callback

    method cell_is_visible : unit -> bool =
      fun () -> Raw.Tree_view_column.cell_is_visible obj

    method cell_set_cell_data :
        Tree_model.tree_model_t -> Raw.Tree_iter.t -> bool -> bool -> unit =
      fun tree_model iter is_expander is_expanded ->
        let tree_model = tree_model#as_tree_model in
        Raw.Tree_view_column.cell_set_cell_data obj tree_model iter is_expander
          is_expanded

    method clicked : unit -> unit = fun () -> Raw.Tree_view_column.clicked obj

    method focus_cell : Cell_renderer.cell_renderer_t -> unit =
      fun cell ->
        let cell = cell#as_cell_renderer in
        Raw.Tree_view_column.focus_cell obj cell

    method get_alignment : unit -> float =
      fun () -> Raw.Tree_view_column.get_alignment obj

    method get_button :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Tree_view_column.get_button obj)

    method get_clickable : unit -> bool =
      fun () -> Raw.Tree_view_column.get_clickable obj

    method get_expand : unit -> bool =
      fun () -> Raw.Tree_view_column.get_expand obj

    method get_fixed_width : unit -> int =
      fun () -> Raw.Tree_view_column.get_fixed_width obj

    method get_max_width : unit -> int =
      fun () -> Raw.Tree_view_column.get_max_width obj

    method get_min_width : unit -> int =
      fun () -> Raw.Tree_view_column.get_min_width obj

    method get_reorderable : unit -> bool =
      fun () -> Raw.Tree_view_column.get_reorderable obj

    method get_resizable : unit -> bool =
      fun () -> Raw.Tree_view_column.get_resizable obj

    method get_sizing : unit -> Enums.treeviewcolumnsizing =
      fun () -> Raw.Tree_view_column.get_sizing obj

    method get_sort_column_id : unit -> int =
      fun () -> Raw.Tree_view_column.get_sort_column_id obj

    method get_sort_indicator : unit -> bool =
      fun () -> Raw.Tree_view_column.get_sort_indicator obj

    method get_sort_order : unit -> Enums.sorttype =
      fun () -> Raw.Tree_view_column.get_sort_order obj

    method get_spacing : unit -> int =
      fun () -> Raw.Tree_view_column.get_spacing obj

    method get_title : unit -> string =
      fun () -> Raw.Tree_view_column.get_title obj

    method get_tree_view :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Tree_view_column.get_tree_view obj)

    method get_visible : unit -> bool =
      fun () -> Raw.Tree_view_column.get_visible obj

    method get_widget :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Tree_view_column.get_widget obj)

    method get_width : unit -> int =
      fun () -> Raw.Tree_view_column.get_width obj

    method get_x_offset : unit -> int =
      fun () -> Raw.Tree_view_column.get_x_offset obj

    method queue_resize : unit -> unit =
      fun () -> Raw.Tree_view_column.queue_resize obj

    method set_alignment : float -> unit =
      fun xalign -> Raw.Tree_view_column.set_alignment obj xalign

    method set_clickable : bool -> unit =
      fun clickable -> Raw.Tree_view_column.set_clickable obj clickable

    method set_expand : bool -> unit =
      fun expand -> Raw.Tree_view_column.set_expand obj expand

    method set_fixed_width : int -> unit =
      fun fixed_width -> Raw.Tree_view_column.set_fixed_width obj fixed_width

    method set_max_width : int -> unit =
      fun max_width -> Raw.Tree_view_column.set_max_width obj max_width

    method set_min_width : int -> unit =
      fun min_width -> Raw.Tree_view_column.set_min_width obj min_width

    method set_reorderable : bool -> unit =
      fun reorderable -> Raw.Tree_view_column.set_reorderable obj reorderable

    method set_resizable : bool -> unit =
      fun resizable -> Raw.Tree_view_column.set_resizable obj resizable

    method set_sizing : Enums.treeviewcolumnsizing -> unit =
      fun type_ -> Raw.Tree_view_column.set_sizing obj type_

    method set_sort_column_id : int -> unit =
      fun sort_column_id ->
        Raw.Tree_view_column.set_sort_column_id obj sort_column_id

    method set_sort_indicator : bool -> unit =
      fun setting -> Raw.Tree_view_column.set_sort_indicator obj setting

    method set_sort_order : Enums.sorttype -> unit =
      fun order -> Raw.Tree_view_column.set_sort_order obj order

    method set_spacing : int -> unit =
      fun spacing -> Raw.Tree_view_column.set_spacing obj spacing

    method set_title : string -> unit =
      fun title -> Raw.Tree_view_column.set_title obj title

    method set_visible : bool -> unit =
      fun visible -> Raw.Tree_view_column.set_visible obj visible

    method set_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Tree_view_column.set_widget obj widget

    method cell_area =
      new Cell_area_and__cell_area_context_and__cell_layout.cell_area
        (Raw.Tree_view_column.get_cell_area obj)

    method as_tree_view_column = obj
  end

let new_ () : tree_view_column_t =
  new tree_view_column (Raw.Tree_view_column.new_ ())

let new_with_area
    (area : Cell_area_and__cell_area_context_and__cell_layout.cell_area_t) :
    tree_view_column_t =
  let area = area#as_cell_area in
  let obj_ = Raw.Tree_view_column.new_with_area area in
  new tree_view_column obj_
