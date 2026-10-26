class type list_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep ->
      count:int ->
      extend:bool ->
      modify:bool ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_row_activated :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_row_selected :
    ?after:bool ->
    callback:(row:List_box_row.list_box_row_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_select_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_selected_rows_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggle_cursor_row :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_unselect_all :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method drag_highlight_row : List_box_row.list_box_row_t -> unit
  method drag_unhighlight_row : unit -> unit
  method get_activate_on_single_click : unit -> bool
  method get_adjustment : unit -> Adjustment.adjustment_t option
  method get_row_at_index : int -> List_box_row.list_box_row_t option
  method get_row_at_y : int -> List_box_row.list_box_row_t option
  method get_selected_row : unit -> List_box_row.list_box_row_t option
  method get_selected_rows : unit -> List_box_row.list_box_row_t list
  method get_selection_mode : unit -> Enums.selectionmode
  method get_show_separators : unit -> bool
  method get_tab_behavior : unit -> Enums.listtabbehavior

  method insert :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    unit

  method invalidate_filter : unit -> unit
  method invalidate_headers : unit -> unit
  method invalidate_sort : unit -> unit

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_all : unit -> unit
  method select_all : unit -> unit
  method select_row : List_box_row.list_box_row_t option -> unit
  method set_activate_on_single_click : bool -> unit
  method set_adjustment : Adjustment.adjustment_t option -> unit

  method set_placeholder :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_selection_mode : Enums.selectionmode -> unit
  method set_show_separators : bool -> unit
  method set_tab_behavior : Enums.listtabbehavior -> unit
  method unselect_all : unit -> unit
  method unselect_row : List_box_row.list_box_row_t -> unit
  method accept_unpaired_release : bool
  method set_accept_unpaired_release : bool -> unit
  method as_list_box : Raw.List_box.t
end

(* High-level class for ListBox *)
class list_box (obj : Raw.List_box.t) : list_box_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_activate_cursor_row ?(after = false) ~callback () =
      Raw.List_box.on_activate_cursor_row ~after self#as_list_box ~callback

    method on_move_cursor ?(after = false) ~callback () =
      Raw.List_box.on_move_cursor ~after self#as_list_box ~callback

    method on_row_activated ?(after = false) ~callback () =
      Raw.List_box.on_row_activated ~after self#as_list_box
        ~callback:(fun ~row ->
          callback ~row:(new List_box_row.list_box_row row))

    method on_row_selected ?(after = false) ~callback () =
      Raw.List_box.on_row_selected ~after self#as_list_box
        ~callback:(fun ~row ->
          callback
            ~row:(Option.map (fun w -> new List_box_row.list_box_row w) row))

    method on_select_all ?(after = false) ~callback () =
      Raw.List_box.on_select_all ~after self#as_list_box ~callback

    method on_selected_rows_changed ?(after = false) ~callback () =
      Raw.List_box.on_selected_rows_changed ~after self#as_list_box ~callback

    method on_toggle_cursor_row ?(after = false) ~callback () =
      Raw.List_box.on_toggle_cursor_row ~after self#as_list_box ~callback

    method on_unselect_all ?(after = false) ~callback () =
      Raw.List_box.on_unselect_all ~after self#as_list_box ~callback

    method append :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.List_box.append obj child

    method drag_highlight_row : List_box_row.list_box_row_t -> unit =
      fun row ->
        let row = row#as_list_box_row in
        Raw.List_box.drag_highlight_row obj row

    method drag_unhighlight_row : unit -> unit =
      fun () -> Raw.List_box.drag_unhighlight_row obj

    method get_activate_on_single_click : unit -> bool =
      fun () -> Raw.List_box.get_activate_on_single_click obj

    method get_adjustment : unit -> Adjustment.adjustment_t option =
      fun () ->
        Option.map
          (fun ret -> new Adjustment.adjustment ret)
          (Raw.List_box.get_adjustment obj)

    method get_row_at_index : int -> List_box_row.list_box_row_t option =
      fun index_ ->
        Option.map
          (fun ret -> new List_box_row.list_box_row ret)
          (Raw.List_box.get_row_at_index obj index_)

    method get_row_at_y : int -> List_box_row.list_box_row_t option =
      fun y ->
        Option.map
          (fun ret -> new List_box_row.list_box_row ret)
          (Raw.List_box.get_row_at_y obj y)

    method get_selected_row : unit -> List_box_row.list_box_row_t option =
      fun () ->
        Option.map
          (fun ret -> new List_box_row.list_box_row ret)
          (Raw.List_box.get_selected_row obj)

    method get_selected_rows : unit -> List_box_row.list_box_row_t list =
      fun () ->
        (List.map (fun ret -> new List_box_row.list_box_row ret))
          (Raw.List_box.get_selected_rows obj)

    method get_selection_mode : unit -> Enums.selectionmode =
      fun () -> Raw.List_box.get_selection_mode obj

    method get_show_separators : unit -> bool =
      fun () -> Raw.List_box.get_show_separators obj

    method get_tab_behavior : unit -> Enums.listtabbehavior =
      fun () -> Raw.List_box.get_tab_behavior obj

    method insert :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        unit =
      fun child position ->
        let child = child#as_widget in
        Raw.List_box.insert obj child position

    method invalidate_filter : unit -> unit =
      fun () -> Raw.List_box.invalidate_filter obj

    method invalidate_headers : unit -> unit =
      fun () -> Raw.List_box.invalidate_headers obj

    method invalidate_sort : unit -> unit =
      fun () -> Raw.List_box.invalidate_sort obj

    method prepend :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.List_box.prepend obj child

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.List_box.remove obj child

    method remove_all : unit -> unit = fun () -> Raw.List_box.remove_all obj
    method select_all : unit -> unit = fun () -> Raw.List_box.select_all obj

    method select_row : List_box_row.list_box_row_t option -> unit =
      fun row ->
        let row = Option.map (fun c -> c#as_list_box_row) row in
        Raw.List_box.select_row obj row

    method set_activate_on_single_click : bool -> unit =
      fun single -> Raw.List_box.set_activate_on_single_click obj single

    method set_adjustment : Adjustment.adjustment_t option -> unit =
      fun adjustment ->
        let adjustment = Option.map (fun c -> c#as_adjustment) adjustment in
        Raw.List_box.set_adjustment obj adjustment

    method set_placeholder :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun placeholder ->
        let placeholder = Option.map (fun c -> c#as_widget) placeholder in
        Raw.List_box.set_placeholder obj placeholder

    method set_selection_mode : Enums.selectionmode -> unit =
      fun mode -> Raw.List_box.set_selection_mode obj mode

    method set_show_separators : bool -> unit =
      fun show_separators ->
        Raw.List_box.set_show_separators obj show_separators

    method set_tab_behavior : Enums.listtabbehavior -> unit =
      fun behavior -> Raw.List_box.set_tab_behavior obj behavior

    method unselect_all : unit -> unit = fun () -> Raw.List_box.unselect_all obj

    method unselect_row : List_box_row.list_box_row_t -> unit =
      fun row ->
        let row = row#as_list_box_row in
        Raw.List_box.unselect_row obj row

    method accept_unpaired_release =
      Raw.List_box.get_accept_unpaired_release obj

    method set_accept_unpaired_release v =
      Raw.List_box.set_accept_unpaired_release obj v

    method as_list_box = obj
  end

let new_ () : list_box_t = new list_box (Raw.List_box.new_ ())
