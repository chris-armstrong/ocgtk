class type paned_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GAccessible_range.accessible_range_t
  inherit GOrientable.orientable_t

  method on_accept_position :
    callback:(unit -> bool) -> Gobject.Signal.handler_id

  method on_cancel_position :
    callback:(unit -> bool) -> Gobject.Signal.handler_id

  method on_cycle_child_focus :
    callback:(reversed:bool -> bool) -> Gobject.Signal.handler_id

  method on_cycle_handle_focus :
    callback:(reversed:bool -> bool) -> Gobject.Signal.handler_id

  method on_move_handle :
    callback:(scroll_type:Gtk_enums.scrolltype -> bool) ->
    Gobject.Signal.handler_id

  method on_toggle_handle_focus :
    callback:(unit -> bool) -> Gobject.Signal.handler_id

  method get_end_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_position : unit -> int
  method get_resize_end_child : unit -> bool
  method get_resize_start_child : unit -> bool
  method get_shrink_end_child : unit -> bool
  method get_shrink_start_child : unit -> bool

  method get_start_child :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_wide_handle : unit -> bool

  method set_end_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_position : int -> unit
  method set_resize_end_child : bool -> unit
  method set_resize_start_child : bool -> unit
  method set_shrink_end_child : bool -> unit
  method set_shrink_start_child : bool -> unit

  method set_start_child :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    unit

  method set_wide_handle : bool -> unit
  method max_position : int
  method min_position : int
  method position_set : bool
  method set_position_set : bool -> unit
  method as_paned : Paned.t
end

(* High-level class for Paned *)
class paned (obj : Paned.t) : paned_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    inherit
      GAccessible_range.accessible_range (Accessible_range.from_gobject obj)

    inherit GOrientable.orientable (Orientable.from_gobject obj)

    method on_accept_position ~callback =
      Paned.on_accept_position self#as_paned ~callback

    method on_cancel_position ~callback =
      Paned.on_cancel_position self#as_paned ~callback

    method on_cycle_child_focus ~callback =
      Paned.on_cycle_child_focus self#as_paned ~callback

    method on_cycle_handle_focus ~callback =
      Paned.on_cycle_handle_focus self#as_paned ~callback

    method on_move_handle ~callback =
      Paned.on_move_handle self#as_paned ~callback

    method on_toggle_handle_focus ~callback =
      Paned.on_toggle_handle_focus self#as_paned ~callback

    method get_end_child :
        unit ->
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
              .widget
              ret)
          (Paned.get_end_child obj)

    method get_position : unit -> int = fun () -> Paned.get_position obj

    method get_resize_end_child : unit -> bool =
      fun () -> Paned.get_resize_end_child obj

    method get_resize_start_child : unit -> bool =
      fun () -> Paned.get_resize_start_child obj

    method get_shrink_end_child : unit -> bool =
      fun () -> Paned.get_shrink_end_child obj

    method get_shrink_start_child : unit -> bool =
      fun () -> Paned.get_shrink_start_child obj

    method get_start_child :
        unit ->
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
              .widget
              ret)
          (Paned.get_start_child obj)

    method get_wide_handle : unit -> bool = fun () -> Paned.get_wide_handle obj

    method set_end_child :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Paned.set_end_child obj child

    method set_position : int -> unit =
      fun position -> Paned.set_position obj position

    method set_resize_end_child : bool -> unit =
      fun resize -> Paned.set_resize_end_child obj resize

    method set_resize_start_child : bool -> unit =
      fun resize -> Paned.set_resize_start_child obj resize

    method set_shrink_end_child : bool -> unit =
      fun resize -> Paned.set_shrink_end_child obj resize

    method set_shrink_start_child : bool -> unit =
      fun resize -> Paned.set_shrink_start_child obj resize

    method set_start_child :
        GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Paned.set_start_child obj child

    method set_wide_handle : bool -> unit =
      fun wide -> Paned.set_wide_handle obj wide

    method max_position = Paned.get_max_position obj
    method min_position = Paned.get_min_position obj
    method position_set = Paned.get_position_set obj
    method set_position_set v = Paned.set_position_set obj v
    method as_paned = obj
  end

let new_ (orientation : Gtk_enums.orientation) : paned_t =
  let obj_ = Paned.new_ orientation in
  new paned obj_
