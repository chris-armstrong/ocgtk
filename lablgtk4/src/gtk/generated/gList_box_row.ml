(* Signal class defined in glist_box_row_signals.ml *)

(* High-level class for ListBoxRow *)
class list_box_row (obj : List_box_row.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (List_box_row.as_widget obj)
  inherit Glist_box_row_signals.list_box_row_signals obj

  method changed : unit -> unit =
    fun () ->
      (List_box_row.changed obj)

  method get_activatable : unit -> bool =
    fun () ->
      (List_box_row.get_activatable obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (List_box_row.get_child obj)

  method get_header : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (List_box_row.get_header obj)

  method get_index : unit -> int =
    fun () ->
      (List_box_row.get_index obj)

  method get_selectable : unit -> bool =
    fun () ->
      (List_box_row.get_selectable obj)

  method is_selected : unit -> bool =
    fun () ->
      (List_box_row.is_selected obj)

  method set_activatable : bool -> unit =
    fun activatable ->
      (List_box_row.set_activatable obj activatable)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (List_box_row.set_child obj child)

  method set_header : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun header ->
      let header = Option.map (fun (c) -> c#as_widget) header in
      (List_box_row.set_header obj header)

  method set_selectable : bool -> unit =
    fun selectable ->
      (List_box_row.set_selectable obj selectable)

  method as_widget = (List_box_row.as_widget obj)
    method as_list_box_row = obj
end

