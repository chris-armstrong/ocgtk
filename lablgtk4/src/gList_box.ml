(* Signal class defined in glist_box_signals.ml *)

(* High-level class for ListBox *)
class list_box (obj : List_box.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (List_box.as_widget obj)
  inherit Glist_box_signals.list_box_signals obj

  method append : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (List_box.append obj child)

  method drag_highlight_row : 'p1. (#GList_box_row.list_box_row as 'p1) -> unit =
    fun row ->
      let row = row#as_list_box_row in
      (List_box.drag_highlight_row obj row)

  method drag_unhighlight_row : unit -> unit = fun () -> (List_box.drag_unhighlight_row obj )

  method get_activate_on_single_click : unit -> bool = fun () -> (List_box.get_activate_on_single_click obj )

  method get_adjustment : unit -> GAdjustment.adjustment option = fun () -> Option.map (fun ret -> new GAdjustment.adjustment ret) (List_box.get_adjustment obj )

  method get_row_at_index : int -> GList_box_row.list_box_row option = fun index_ -> Option.map (fun ret -> new GList_box_row.list_box_row ret) (List_box.get_row_at_index obj index_)

  method get_row_at_y : int -> GList_box_row.list_box_row option = fun y -> Option.map (fun ret -> new GList_box_row.list_box_row ret) (List_box.get_row_at_y obj y)

  method get_selected_row : unit -> GList_box_row.list_box_row option = fun () -> Option.map (fun ret -> new GList_box_row.list_box_row ret) (List_box.get_selected_row obj )

  method get_selection_mode : unit -> Gtk_enums.selectionmode = fun () -> (List_box.get_selection_mode obj )

  method get_show_separators : unit -> bool = fun () -> (List_box.get_show_separators obj )

  method insert : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int -> unit =
    fun child position ->
      let child = child#as_widget in
      (List_box.insert obj child position)

  method invalidate_filter : unit -> unit = fun () -> (List_box.invalidate_filter obj )

  method invalidate_headers : unit -> unit = fun () -> (List_box.invalidate_headers obj )

  method invalidate_sort : unit -> unit = fun () -> (List_box.invalidate_sort obj )

  method prepend : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (List_box.prepend obj child)

  method remove : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (List_box.remove obj child)

  method remove_all : unit -> unit = fun () -> (List_box.remove_all obj )

  method select_all : unit -> unit = fun () -> (List_box.select_all obj )

  method select_row : 'p1. (#GList_box_row.list_box_row as 'p1) option -> unit =
    fun row ->
      let row = Option.map (fun (c) -> c#as_list_box_row) row in
      (List_box.select_row obj row)

  method set_activate_on_single_click : bool -> unit = fun single -> (List_box.set_activate_on_single_click obj single)

  method set_adjustment : 'p1. (#GAdjustment.adjustment as 'p1) option -> unit = fun adjustment -> (List_box.set_adjustment obj ( adjustment |> Option.map (fun x -> x#as_adjustment) ))

  method set_placeholder : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun placeholder ->
      let placeholder = Option.map (fun (c) -> c#as_widget) placeholder in
      (List_box.set_placeholder obj placeholder)

  method set_selection_mode : Gtk_enums.selectionmode -> unit = fun mode -> (List_box.set_selection_mode obj mode)

  method set_show_separators : bool -> unit = fun show_separators -> (List_box.set_show_separators obj show_separators)

  method unselect_all : unit -> unit = fun () -> (List_box.unselect_all obj )

  method unselect_row : 'p1. (#GList_box_row.list_box_row as 'p1) -> unit =
    fun row ->
      let row = row#as_list_box_row in
      (List_box.unselect_row obj row)

  method as_widget = (List_box.as_widget obj)
    method as_list_box = obj
end

