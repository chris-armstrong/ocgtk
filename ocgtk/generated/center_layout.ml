class type center_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  method get_baseline_position : unit -> Enums.baselineposition

  method get_center_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_end_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_orientation : unit -> Enums.orientation
  method get_shrink_center_last : unit -> bool

  method get_start_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method set_baseline_position : Enums.baselineposition -> unit

  method set_center_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_end_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_orientation : Enums.orientation -> unit
  method set_shrink_center_last : bool -> unit

  method set_start_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method as_center_layout : Raw.Center_layout.t
end

(* High-level class for CenterLayout *)
class center_layout (obj : Raw.Center_layout.t) : center_layout_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .layout_manager
        (obj :> Raw.Layout_manager.t)

    method get_baseline_position : unit -> Enums.baselineposition =
      fun () -> Raw.Center_layout.get_baseline_position obj

    method get_center_widget :
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
          (Raw.Center_layout.get_center_widget obj)

    method get_end_widget :
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
          (Raw.Center_layout.get_end_widget obj)

    method get_orientation : unit -> Enums.orientation =
      fun () -> Raw.Center_layout.get_orientation obj

    method get_shrink_center_last : unit -> bool =
      fun () -> Raw.Center_layout.get_shrink_center_last obj

    method get_start_widget :
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
          (Raw.Center_layout.get_start_widget obj)

    method set_baseline_position : Enums.baselineposition -> unit =
      fun baseline_position ->
        Raw.Center_layout.set_baseline_position obj baseline_position

    method set_center_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Center_layout.set_center_widget obj widget

    method set_end_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Center_layout.set_end_widget obj widget

    method set_orientation : Enums.orientation -> unit =
      fun orientation -> Raw.Center_layout.set_orientation obj orientation

    method set_shrink_center_last : bool -> unit =
      fun shrink_center_last ->
        Raw.Center_layout.set_shrink_center_last obj shrink_center_last

    method set_start_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun widget ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Center_layout.set_start_widget obj widget

    method as_center_layout = obj
  end

let new_ () : center_layout_t = new center_layout (Raw.Center_layout.new_ ())
