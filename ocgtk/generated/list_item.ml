class type list_item_t = object
  method get_accessible_description : unit -> string
  method get_accessible_label : unit -> string
  method get_activatable : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_focusable : unit -> bool
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_position : unit -> int
  method get_selectable : unit -> bool
  method get_selected : unit -> bool
  method set_accessible_description : string -> unit
  method set_accessible_label : string -> unit
  method set_activatable : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_focusable : bool -> unit
  method set_selectable : bool -> unit
  method as_list_item : Raw.List_item.t
end

(* High-level class for ListItem *)
class list_item (obj : Raw.List_item.t) : list_item_t =
  object (self)
    method get_accessible_description : unit -> string =
      fun () -> Raw.List_item.get_accessible_description obj

    method get_accessible_label : unit -> string =
      fun () -> Raw.List_item.get_accessible_label obj

    method get_activatable : unit -> bool =
      fun () -> Raw.List_item.get_activatable obj

    method get_child :
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
          (Raw.List_item.get_child obj)

    method get_focusable : unit -> bool =
      fun () -> Raw.List_item.get_focusable obj

    method get_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.List_item.get_item obj

    method get_position : unit -> int = fun () -> Raw.List_item.get_position obj

    method get_selectable : unit -> bool =
      fun () -> Raw.List_item.get_selectable obj

    method get_selected : unit -> bool =
      fun () -> Raw.List_item.get_selected obj

    method set_accessible_description : string -> unit =
      fun description ->
        Raw.List_item.set_accessible_description obj description

    method set_accessible_label : string -> unit =
      fun label -> Raw.List_item.set_accessible_label obj label

    method set_activatable : bool -> unit =
      fun activatable -> Raw.List_item.set_activatable obj activatable

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.List_item.set_child obj child

    method set_focusable : bool -> unit =
      fun focusable -> Raw.List_item.set_focusable obj focusable

    method set_selectable : bool -> unit =
      fun selectable -> Raw.List_item.set_selectable obj selectable

    method as_list_item = obj
  end
