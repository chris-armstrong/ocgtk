class type list_box_row_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method changed : unit -> unit
  method get_activatable : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_header :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_index : unit -> int
  method get_selectable : unit -> bool
  method is_selected : unit -> bool
  method set_activatable : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_header :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_selectable : bool -> unit
  method as_list_box_row : Raw.List_box_row.t
end

(* High-level class for ListBoxRow *)
class list_box_row (obj : Raw.List_box_row.t) : list_box_row_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Actionable.actionable (Raw.Actionable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.List_box_row.on_activate ~after self#as_list_box_row ~callback

    method changed : unit -> unit = fun () -> Raw.List_box_row.changed obj

    method get_activatable : unit -> bool =
      fun () -> Raw.List_box_row.get_activatable obj

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
          (Raw.List_box_row.get_child obj)

    method get_header :
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
          (Raw.List_box_row.get_header obj)

    method get_index : unit -> int = fun () -> Raw.List_box_row.get_index obj

    method get_selectable : unit -> bool =
      fun () -> Raw.List_box_row.get_selectable obj

    method is_selected : unit -> bool =
      fun () -> Raw.List_box_row.is_selected obj

    method set_activatable : bool -> unit =
      fun activatable -> Raw.List_box_row.set_activatable obj activatable

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.List_box_row.set_child obj child

    method set_header :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun header ->
        let header = Option.map (fun c -> c#as_widget) header in
        Raw.List_box_row.set_header obj header

    method set_selectable : bool -> unit =
      fun selectable -> Raw.List_box_row.set_selectable obj selectable

    method as_list_box_row = obj
  end

let new_ () : list_box_row_t = new list_box_row (Raw.List_box_row.new_ ())
