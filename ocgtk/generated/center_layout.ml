class type center_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  method get_baseline_position : unit -> Enums.baselineposition
  (** Returns the baseline position of the layout. *)

  method get_center_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the center widget of the layout. *)

  method get_end_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the end widget of the layout. *)

  method get_orientation : unit -> Enums.orientation
  (** Gets the current orienration of the layout manager. *)

  method get_shrink_center_last : unit -> bool
  (** Gets whether [self] shrinks the center widget after other children. *)

  method get_start_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the start widget of the layout. *)

  method set_baseline_position : Enums.baselineposition -> unit
  (** Sets the new baseline position of [self] *)

  method set_center_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the new center widget of [self].

      To remove the existing center widget, pass [NULL]. *)

  method set_end_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the new end widget of [self].

      To remove the existing center widget, pass [NULL]. *)

  method set_orientation : Enums.orientation -> unit
  (** Sets the orientation of [self]. *)

  method set_shrink_center_last : bool -> unit
  (** Sets whether to shrink the center widget after other children.

      By default, when there's no space to give all three children their natural
      widths, the start and end widgets start shrinking and the center child
      keeps natural width until they reach minimum width.

      If set to [FALSE], start and end widgets keep natural width and the center
      widget starts shrinking instead. *)

  method set_start_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the new start widget of [self].

      To remove the existing start widget, pass [NULL]. *)

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
