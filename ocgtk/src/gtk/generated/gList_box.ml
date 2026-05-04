class type list_box_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method on_activate_cursor_row :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_move_cursor :
    callback:
      (object_:Gtk_enums.movementstep -> p0:int -> p1:bool -> p2:bool -> unit) ->
    Gobject.Signal.handler_id

  method on_select_all : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_selected_rows_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_toggle_cursor_row :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_unselect_all : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method append :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method drag_highlight_row : GList_box_row.list_box_row_t -> unit
  method drag_unhighlight_row : unit -> unit
  method get_activate_on_single_click : unit -> bool
  method get_adjustment : unit -> GAdjustment.adjustment_t option
  method get_row_at_index : int -> GList_box_row.list_box_row_t option
  method get_row_at_y : int -> GList_box_row.list_box_row_t option
  method get_selected_row : unit -> GList_box_row.list_box_row_t option
  method get_selected_rows : unit -> GList_box_row.list_box_row_t list
  method get_selection_mode : unit -> Gtk_enums.selectionmode
  method get_show_separators : unit -> bool

  method insert :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    int ->
    unit

  method invalidate_filter : unit -> unit
  method invalidate_headers : unit -> unit
  method invalidate_sort : unit -> unit

  method prepend :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method remove :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

  method remove_all : unit -> unit
  method select_all : unit -> unit
  method select_row : GList_box_row.list_box_row_t option -> unit
  method set_activate_on_single_click : bool -> unit
  method set_adjustment : GAdjustment.adjustment_t option -> unit

  method set_placeholder :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_selection_mode : Gtk_enums.selectionmode -> unit
  method set_show_separators : bool -> unit
  method unselect_all : unit -> unit
  method unselect_row : GList_box_row.list_box_row_t -> unit
  method accept_unpaired_release : bool
  method set_accept_unpaired_release : bool -> unit
  method as_list_box : List_box.t
end

(* High-level class for ListBox *)
class list_box (obj : List_box.t) : list_box_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    method on_activate_cursor_row ~callback =
      List_box.on_activate_cursor_row self#as_list_box ~callback

    method on_move_cursor ~callback =
      List_box.on_move_cursor self#as_list_box ~callback

    method on_select_all ~callback =
      List_box.on_select_all self#as_list_box ~callback

    method on_selected_rows_changed ~callback =
      List_box.on_selected_rows_changed self#as_list_box ~callback

    method on_toggle_cursor_row ~callback =
      List_box.on_toggle_cursor_row self#as_list_box ~callback

    method on_unselect_all ~callback =
      List_box.on_unselect_all self#as_list_box ~callback

    method append :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        List_box.append obj child

    method drag_highlight_row : GList_box_row.list_box_row_t -> unit =
      fun row ->
        let row = row#as_list_box_row in
        List_box.drag_highlight_row obj row

    method drag_unhighlight_row : unit -> unit =
      fun () -> List_box.drag_unhighlight_row obj

    method get_activate_on_single_click : unit -> bool =
      fun () -> List_box.get_activate_on_single_click obj

    method get_adjustment : unit -> GAdjustment.adjustment_t option =
      fun () ->
        Option.map
          (fun ret -> new GAdjustment.adjustment ret)
          (List_box.get_adjustment obj)

    method get_row_at_index : int -> GList_box_row.list_box_row_t option =
      fun index_ ->
        Option.map
          (fun ret -> new GList_box_row.list_box_row ret)
          (List_box.get_row_at_index obj index_)

    method get_row_at_y : int -> GList_box_row.list_box_row_t option =
      fun y ->
        Option.map
          (fun ret -> new GList_box_row.list_box_row ret)
          (List_box.get_row_at_y obj y)

    method get_selected_row : unit -> GList_box_row.list_box_row_t option =
      fun () ->
        Option.map
          (fun ret -> new GList_box_row.list_box_row ret)
          (List_box.get_selected_row obj)

    method get_selected_rows : unit -> GList_box_row.list_box_row_t list =
      fun () ->
        (List.map (fun ret -> new GList_box_row.list_box_row ret))
          (List_box.get_selected_rows obj)

    method get_selection_mode : unit -> Gtk_enums.selectionmode =
      fun () -> List_box.get_selection_mode obj

    method get_show_separators : unit -> bool =
      fun () -> List_box.get_show_separators obj

    method insert :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        int ->
        unit =
      fun child position ->
        let child = child#as_widget in
        List_box.insert obj child position

    method invalidate_filter : unit -> unit =
      fun () -> List_box.invalidate_filter obj

    method invalidate_headers : unit -> unit =
      fun () -> List_box.invalidate_headers obj

    method invalidate_sort : unit -> unit =
      fun () -> List_box.invalidate_sort obj

    method prepend :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        List_box.prepend obj child

    method remove :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        List_box.remove obj child

    method remove_all : unit -> unit = fun () -> List_box.remove_all obj
    method select_all : unit -> unit = fun () -> List_box.select_all obj

    method select_row : GList_box_row.list_box_row_t option -> unit =
      fun row ->
        let row = Option.map (fun c -> c#as_list_box_row) row in
        List_box.select_row obj row

    method set_activate_on_single_click : bool -> unit =
      fun single -> List_box.set_activate_on_single_click obj single

    method set_adjustment : GAdjustment.adjustment_t option -> unit =
      fun adjustment ->
        let adjustment = Option.map (fun c -> c#as_adjustment) adjustment in
        List_box.set_adjustment obj adjustment

    method set_placeholder :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun placeholder ->
        let placeholder = Option.map (fun c -> c#as_widget) placeholder in
        List_box.set_placeholder obj placeholder

    method set_selection_mode : Gtk_enums.selectionmode -> unit =
      fun mode -> List_box.set_selection_mode obj mode

    method set_show_separators : bool -> unit =
      fun show_separators -> List_box.set_show_separators obj show_separators

    method unselect_all : unit -> unit = fun () -> List_box.unselect_all obj

    method unselect_row : GList_box_row.list_box_row_t -> unit =
      fun row ->
        let row = row#as_list_box_row in
        List_box.unselect_row obj row

    method accept_unpaired_release = List_box.get_accept_unpaired_release obj

    method set_accept_unpaired_release v =
      List_box.set_accept_unpaired_release obj v

    method as_list_box = obj
  end

let new_ () : list_box_t = new list_box (List_box.new_ ())
