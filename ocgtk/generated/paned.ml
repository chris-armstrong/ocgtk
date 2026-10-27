class type paned_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method on_accept_position :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_cancel_position :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_cycle_child_focus :
    ?after:bool ->
    callback:(reversed:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_cycle_handle_focus :
    ?after:bool ->
    callback:(reversed:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_handle :
    ?after:bool ->
    callback:(scroll_type:Enums.scrolltype -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_toggle_handle_focus :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method get_end_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_position : unit -> int
  method get_resize_end_child : unit -> bool
  method get_resize_start_child : unit -> bool
  method get_shrink_end_child : unit -> bool
  method get_shrink_start_child : unit -> bool

  method get_start_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_wide_handle : unit -> bool

  method set_end_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_position : int -> unit
  method set_resize_end_child : bool -> unit
  method set_resize_start_child : bool -> unit
  method set_shrink_end_child : bool -> unit
  method set_shrink_start_child : bool -> unit

  method set_start_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_wide_handle : bool -> unit
  method max_position : int
  method min_position : int
  method position_set : bool
  method set_position_set : bool -> unit
  method as_paned : Raw.Paned.t
end

(* High-level class for Paned *)
class paned (obj : Raw.Paned.t) : paned_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_range.accessible_range (Raw.Accessible_range.from_gobject obj)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method on_accept_position ?(after = false) ~callback () =
      Raw.Paned.on_accept_position ~after self#as_paned ~callback

    method on_cancel_position ?(after = false) ~callback () =
      Raw.Paned.on_cancel_position ~after self#as_paned ~callback

    method on_cycle_child_focus ?(after = false) ~callback () =
      Raw.Paned.on_cycle_child_focus ~after self#as_paned ~callback

    method on_cycle_handle_focus ?(after = false) ~callback () =
      Raw.Paned.on_cycle_handle_focus ~after self#as_paned ~callback

    method on_move_handle ?(after = false) ~callback () =
      Raw.Paned.on_move_handle ~after self#as_paned ~callback

    method on_toggle_handle_focus ?(after = false) ~callback () =
      Raw.Paned.on_toggle_handle_focus ~after self#as_paned ~callback

    method get_end_child :
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
          (Raw.Paned.get_end_child obj)

    method get_position : unit -> int = fun () -> Raw.Paned.get_position obj

    method get_resize_end_child : unit -> bool =
      fun () -> Raw.Paned.get_resize_end_child obj

    method get_resize_start_child : unit -> bool =
      fun () -> Raw.Paned.get_resize_start_child obj

    method get_shrink_end_child : unit -> bool =
      fun () -> Raw.Paned.get_shrink_end_child obj

    method get_shrink_start_child : unit -> bool =
      fun () -> Raw.Paned.get_shrink_start_child obj

    method get_start_child :
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
          (Raw.Paned.get_start_child obj)

    method get_wide_handle : unit -> bool =
      fun () -> Raw.Paned.get_wide_handle obj

    method set_end_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Paned.set_end_child obj child

    method set_position : int -> unit =
      fun position -> Raw.Paned.set_position obj position

    method set_resize_end_child : bool -> unit =
      fun resize -> Raw.Paned.set_resize_end_child obj resize

    method set_resize_start_child : bool -> unit =
      fun resize -> Raw.Paned.set_resize_start_child obj resize

    method set_shrink_end_child : bool -> unit =
      fun resize -> Raw.Paned.set_shrink_end_child obj resize

    method set_shrink_start_child : bool -> unit =
      fun resize -> Raw.Paned.set_shrink_start_child obj resize

    method set_start_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Paned.set_start_child obj child

    method set_wide_handle : bool -> unit =
      fun wide -> Raw.Paned.set_wide_handle obj wide

    method max_position = Raw.Paned.get_max_position obj
    method min_position = Raw.Paned.get_min_position obj
    method position_set = Raw.Paned.get_position_set obj
    method set_position_set v = Raw.Paned.set_position_set obj v
    method as_paned = obj
  end

let new_ (orientation : Enums.orientation) : paned_t =
  let obj_ = Raw.Paned.new_ orientation in
  new paned obj_
