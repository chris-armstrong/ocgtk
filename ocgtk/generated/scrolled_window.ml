class type scrolled_window_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_edge_overshot :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_edge_reached :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_focus_out :
    ?after:bool ->
    callback:(direction_type:Enums.directiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_scroll_child :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> horizontal:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_hadjustment : unit -> Adjustment.adjustment_t
  method get_has_frame : unit -> bool

  method get_hscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_kinetic_scrolling : unit -> bool
  method get_max_content_height : unit -> int
  method get_max_content_width : unit -> int
  method get_min_content_height : unit -> int
  method get_min_content_width : unit -> int
  method get_overlay_scrolling : unit -> bool
  method get_placement : unit -> Enums.cornertype
  method get_propagate_natural_height : unit -> bool
  method get_propagate_natural_width : unit -> bool
  method get_vadjustment : unit -> Adjustment.adjustment_t

  method get_vscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_hadjustment : Adjustment.adjustment_t option -> unit
  method set_has_frame : bool -> unit
  method set_kinetic_scrolling : bool -> unit
  method set_max_content_height : int -> unit
  method set_max_content_width : int -> unit
  method set_min_content_height : int -> unit
  method set_min_content_width : int -> unit
  method set_overlay_scrolling : bool -> unit
  method set_placement : Enums.cornertype -> unit
  method set_policy : Enums.policytype -> Enums.policytype -> unit
  method set_propagate_natural_height : bool -> unit
  method set_propagate_natural_width : bool -> unit
  method set_vadjustment : Adjustment.adjustment_t option -> unit
  method unset_placement : unit -> unit
  method hscrollbar_policy : Enums.policytype
  method set_hscrollbar_policy : Enums.policytype -> unit
  method vscrollbar_policy : Enums.policytype
  method set_vscrollbar_policy : Enums.policytype -> unit
  method as_scrolled_window : Raw.Scrolled_window.t
end

(* High-level class for ScrolledWindow *)
class scrolled_window (obj : Raw.Scrolled_window.t) : scrolled_window_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method on_edge_overshot ?(after = false) ~callback () =
      Raw.Scrolled_window.on_edge_overshot ~after self#as_scrolled_window
        ~callback

    method on_edge_reached ?(after = false) ~callback () =
      Raw.Scrolled_window.on_edge_reached ~after self#as_scrolled_window
        ~callback

    method on_move_focus_out ?(after = false) ~callback () =
      Raw.Scrolled_window.on_move_focus_out ~after self#as_scrolled_window
        ~callback

    method on_scroll_child ?(after = false) ~callback () =
      Raw.Scrolled_window.on_scroll_child ~after self#as_scrolled_window
        ~callback

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
          (Raw.Scrolled_window.get_child obj)

    method get_hadjustment : unit -> Adjustment.adjustment_t =
      fun () ->
        new Adjustment.adjustment (Raw.Scrolled_window.get_hadjustment obj)

    method get_has_frame : unit -> bool =
      fun () -> Raw.Scrolled_window.get_has_frame obj

    method get_hscrollbar :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Scrolled_window.get_hscrollbar obj)

    method get_kinetic_scrolling : unit -> bool =
      fun () -> Raw.Scrolled_window.get_kinetic_scrolling obj

    method get_max_content_height : unit -> int =
      fun () -> Raw.Scrolled_window.get_max_content_height obj

    method get_max_content_width : unit -> int =
      fun () -> Raw.Scrolled_window.get_max_content_width obj

    method get_min_content_height : unit -> int =
      fun () -> Raw.Scrolled_window.get_min_content_height obj

    method get_min_content_width : unit -> int =
      fun () -> Raw.Scrolled_window.get_min_content_width obj

    method get_overlay_scrolling : unit -> bool =
      fun () -> Raw.Scrolled_window.get_overlay_scrolling obj

    method get_placement : unit -> Enums.cornertype =
      fun () -> Raw.Scrolled_window.get_placement obj

    method get_propagate_natural_height : unit -> bool =
      fun () -> Raw.Scrolled_window.get_propagate_natural_height obj

    method get_propagate_natural_width : unit -> bool =
      fun () -> Raw.Scrolled_window.get_propagate_natural_width obj

    method get_vadjustment : unit -> Adjustment.adjustment_t =
      fun () ->
        new Adjustment.adjustment (Raw.Scrolled_window.get_vadjustment obj)

    method get_vscrollbar :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Scrolled_window.get_vscrollbar obj)

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Scrolled_window.set_child obj child

    method set_hadjustment : Adjustment.adjustment_t option -> unit =
      fun hadjustment ->
        let hadjustment = Option.map (fun c -> c#as_adjustment) hadjustment in
        Raw.Scrolled_window.set_hadjustment obj hadjustment

    method set_has_frame : bool -> unit =
      fun has_frame -> Raw.Scrolled_window.set_has_frame obj has_frame

    method set_kinetic_scrolling : bool -> unit =
      fun kinetic_scrolling ->
        Raw.Scrolled_window.set_kinetic_scrolling obj kinetic_scrolling

    method set_max_content_height : int -> unit =
      fun height -> Raw.Scrolled_window.set_max_content_height obj height

    method set_max_content_width : int -> unit =
      fun width -> Raw.Scrolled_window.set_max_content_width obj width

    method set_min_content_height : int -> unit =
      fun height -> Raw.Scrolled_window.set_min_content_height obj height

    method set_min_content_width : int -> unit =
      fun width -> Raw.Scrolled_window.set_min_content_width obj width

    method set_overlay_scrolling : bool -> unit =
      fun overlay_scrolling ->
        Raw.Scrolled_window.set_overlay_scrolling obj overlay_scrolling

    method set_placement : Enums.cornertype -> unit =
      fun window_placement ->
        Raw.Scrolled_window.set_placement obj window_placement

    method set_policy : Enums.policytype -> Enums.policytype -> unit =
      fun hscrollbar_policy vscrollbar_policy ->
        Raw.Scrolled_window.set_policy obj hscrollbar_policy vscrollbar_policy

    method set_propagate_natural_height : bool -> unit =
      fun propagate ->
        Raw.Scrolled_window.set_propagate_natural_height obj propagate

    method set_propagate_natural_width : bool -> unit =
      fun propagate ->
        Raw.Scrolled_window.set_propagate_natural_width obj propagate

    method set_vadjustment : Adjustment.adjustment_t option -> unit =
      fun vadjustment ->
        let vadjustment = Option.map (fun c -> c#as_adjustment) vadjustment in
        Raw.Scrolled_window.set_vadjustment obj vadjustment

    method unset_placement : unit -> unit =
      fun () -> Raw.Scrolled_window.unset_placement obj

    method hscrollbar_policy = Raw.Scrolled_window.get_hscrollbar_policy obj

    method set_hscrollbar_policy v =
      Raw.Scrolled_window.set_hscrollbar_policy obj v

    method vscrollbar_policy = Raw.Scrolled_window.get_vscrollbar_policy obj

    method set_vscrollbar_policy v =
      Raw.Scrolled_window.set_vscrollbar_policy obj v

    method as_scrolled_window = obj
  end

let new_ () : scrolled_window_t =
  new scrolled_window (Raw.Scrolled_window.new_ ())
