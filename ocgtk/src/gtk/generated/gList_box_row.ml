(* Signal class defined in glist_box_row_signals.ml *)

class type list_box_row_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Glist_box_row_signals.list_box_row_signals
    method changed : unit -> unit
    method get_activatable : unit -> bool
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_header : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_index : unit -> int
    method get_selectable : unit -> bool
    method is_selected : unit -> bool
    method set_activatable : bool -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_header : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_selectable : bool -> unit
    method as_list_box_row : List_box_row.t
end

(* High-level class for ListBoxRow *)
class list_box_row (obj : List_box_row.t) : list_box_row_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Glist_box_row_signals.list_box_row_signals obj

  method changed : unit -> unit =
    fun () ->
      (List_box_row.changed obj)

  method get_activatable : unit -> bool =
    fun () ->
      (List_box_row.get_activatable obj)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (List_box_row.get_child obj)

  method get_header : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
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

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (List_box_row.set_child obj child)

  method set_header : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun header ->
      let header = Option.map (fun (c) -> c#as_widget) header in
      (List_box_row.set_header obj header)

  method set_selectable : bool -> unit =
    fun selectable ->
      (List_box_row.set_selectable obj selectable)

    method as_list_box_row = obj
end

let new_ () : list_box_row_t =
  new list_box_row (List_box_row.new_ ())

