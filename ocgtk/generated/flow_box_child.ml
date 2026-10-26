class type flow_box_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method changed : unit -> unit

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_index : unit -> int
  method is_selected : unit -> bool

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method as_flow_box_child : Raw.Flow_box_child.t
end

(* High-level class for FlowBoxChild *)
class flow_box_child (obj : Raw.Flow_box_child.t) : flow_box_child_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_activate ?(after = false) ~callback () =
      Raw.Flow_box_child.on_activate ~after self#as_flow_box_child ~callback

    method changed : unit -> unit = fun () -> Raw.Flow_box_child.changed obj

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
          (Raw.Flow_box_child.get_child obj)

    method get_index : unit -> int = fun () -> Raw.Flow_box_child.get_index obj

    method is_selected : unit -> bool =
      fun () -> Raw.Flow_box_child.is_selected obj

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Flow_box_child.set_child obj child

    method as_flow_box_child = obj
  end

let new_ () : flow_box_child_t = new flow_box_child (Raw.Flow_box_child.new_ ())
