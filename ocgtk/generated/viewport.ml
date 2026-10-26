class type viewport_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Scrollable.scrollable_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_scroll_to_focus : unit -> bool

  method scroll_to :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Raw.Scroll_info.t option ->
    unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_scroll_to_focus : bool -> unit
  method as_viewport : Raw.Viewport.t
end

(* High-level class for Viewport *)
class viewport (obj : Raw.Viewport.t) : viewport_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Scrollable.scrollable (Raw.Scrollable.from_gobject obj)

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
          (Raw.Viewport.get_child obj)

    method get_scroll_to_focus : unit -> bool =
      fun () -> Raw.Viewport.get_scroll_to_focus obj

    method scroll_to :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Raw.Scroll_info.t option ->
        unit =
      fun descendant scroll ->
        let descendant = descendant#as_widget in
        Raw.Viewport.scroll_to obj descendant scroll

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Viewport.set_child obj child

    method set_scroll_to_focus : bool -> unit =
      fun scroll_to_focus ->
        Raw.Viewport.set_scroll_to_focus obj scroll_to_focus

    method as_viewport = obj
  end

let new_ (hadjustment : Adjustment.adjustment_t option)
    (vadjustment : Adjustment.adjustment_t option) : viewport_t =
  let hadjustment = Option.map (fun c -> c#as_adjustment) hadjustment in
  let vadjustment = Option.map (fun c -> c#as_adjustment) vadjustment in
  let obj_ = Raw.Viewport.new_ hadjustment vadjustment in
  new viewport obj_
