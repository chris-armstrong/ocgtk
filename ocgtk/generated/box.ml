class type box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_baseline_child : unit -> int
  method get_baseline_position : unit -> Enums.baselineposition
  method get_homogeneous : unit -> bool
  method get_spacing : unit -> int

  method insert_child_after :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method reorder_child_after :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_baseline_child : int -> unit
  method set_baseline_position : Enums.baselineposition -> unit
  method set_homogeneous : bool -> unit
  method set_spacing : int -> unit
  method as_box : Raw.Box.t
end

(* High-level class for Box *)
class box (obj : Raw.Box.t) : box_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method append :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Box.append obj child

    method get_baseline_child : unit -> int =
      fun () -> Raw.Box.get_baseline_child obj

    method get_baseline_position : unit -> Enums.baselineposition =
      fun () -> Raw.Box.get_baseline_position obj

    method get_homogeneous : unit -> bool =
      fun () -> Raw.Box.get_homogeneous obj

    method get_spacing : unit -> int = fun () -> Raw.Box.get_spacing obj

    method insert_child_after :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child sibling ->
        let child = child#as_widget in
        let sibling = Option.map (fun c -> c#as_widget) sibling in
        Raw.Box.insert_child_after obj child sibling

    method prepend :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Box.prepend obj child

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
      fun child ->
        let child = child#as_widget in
        Raw.Box.remove obj child

    method reorder_child_after :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child sibling ->
        let child = child#as_widget in
        let sibling = Option.map (fun c -> c#as_widget) sibling in
        Raw.Box.reorder_child_after obj child sibling

    method set_baseline_child : int -> unit =
      fun child -> Raw.Box.set_baseline_child obj child

    method set_baseline_position : Enums.baselineposition -> unit =
      fun position -> Raw.Box.set_baseline_position obj position

    method set_homogeneous : bool -> unit =
      fun homogeneous -> Raw.Box.set_homogeneous obj homogeneous

    method set_spacing : int -> unit =
      fun spacing -> Raw.Box.set_spacing obj spacing

    method as_box = obj
  end

let new_ (orientation : Enums.orientation) (spacing : int) : box_t =
  let obj_ = Raw.Box.new_ orientation spacing in
  new box obj_
