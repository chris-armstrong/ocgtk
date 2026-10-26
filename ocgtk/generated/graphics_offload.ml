class type graphics_offload_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_black_background : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_enabled : unit -> Enums.graphicsoffloadenabled
  method set_black_background : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_enabled : Enums.graphicsoffloadenabled -> unit
  method as_graphics_offload : Raw.Graphics_offload.t
end

(* High-level class for GraphicsOffload *)
class graphics_offload (obj : Raw.Graphics_offload.t) : graphics_offload_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_black_background : unit -> bool =
      fun () -> Raw.Graphics_offload.get_black_background obj

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
          (Raw.Graphics_offload.get_child obj)

    method get_enabled : unit -> Enums.graphicsoffloadenabled =
      fun () -> Raw.Graphics_offload.get_enabled obj

    method set_black_background : bool -> unit =
      fun value -> Raw.Graphics_offload.set_black_background obj value

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Graphics_offload.set_child obj child

    method set_enabled : Enums.graphicsoffloadenabled -> unit =
      fun enabled -> Raw.Graphics_offload.set_enabled obj enabled

    method as_graphics_offload = obj
  end

let new_
    (child :
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget_t
      option) : graphics_offload_t =
  let child = Option.map (fun c -> c#as_widget) child in
  let obj_ = Raw.Graphics_offload.new_ child in
  new graphics_offload obj_
