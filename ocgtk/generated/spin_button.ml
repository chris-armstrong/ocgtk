class type spin_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Cell_editable.cell_editable_t
  inherit Editable.editable_t
  inherit Orientable.orientable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_change_value :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_output :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_wrapped :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method configure : Adjustment.adjustment_t option -> float -> int -> unit
  method get_activates_default : unit -> bool
  method get_adjustment : unit -> Adjustment.adjustment_t
  method get_climb_rate : unit -> float
  method get_digits : unit -> int
  method get_numeric : unit -> bool
  method get_snap_to_ticks : unit -> bool
  method get_update_policy : unit -> Enums.spinbuttonupdatepolicy
  method get_value : unit -> float
  method get_value_as_int : unit -> int
  method get_wrap : unit -> bool
  method set_activates_default : bool -> unit
  method set_adjustment : Adjustment.adjustment_t -> unit
  method set_climb_rate : float -> unit
  method set_digits : int -> unit
  method set_increments : float -> float -> unit
  method set_numeric : bool -> unit
  method set_range : float -> float -> unit
  method set_snap_to_ticks : bool -> unit
  method set_update_policy : Enums.spinbuttonupdatepolicy -> unit
  method set_value : float -> unit
  method set_wrap : bool -> unit
  method spin : Enums.spintype -> float -> unit
  method update : unit -> unit
  method as_spin_button : Raw.Spin_button.t
end

(* High-level class for SpinButton *)
class spin_button (obj : Raw.Spin_button.t) : spin_button_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_range.accessible_range (Raw.Accessible_range.from_gobject obj)

    inherit Cell_editable.cell_editable (Raw.Cell_editable.from_gobject obj)
    inherit Editable.editable (Raw.Editable.from_gobject obj)
    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Spin_button.on_activate ~after self#as_spin_button ~callback

    method on_change_value ?(after = false) ~callback () =
      Raw.Spin_button.on_change_value ~after self#as_spin_button ~callback

    method on_output ?(after = false) ~callback () =
      Raw.Spin_button.on_output ~after self#as_spin_button ~callback

    method on_value_changed ?(after = false) ~callback () =
      Raw.Spin_button.on_value_changed ~after self#as_spin_button ~callback

    method on_wrapped ?(after = false) ~callback () =
      Raw.Spin_button.on_wrapped ~after self#as_spin_button ~callback

    method configure : Adjustment.adjustment_t option -> float -> int -> unit =
      fun adjustment climb_rate digits ->
        let adjustment = Option.map (fun c -> c#as_adjustment) adjustment in
        Raw.Spin_button.configure obj adjustment climb_rate digits

    method get_activates_default : unit -> bool =
      fun () -> Raw.Spin_button.get_activates_default obj

    method get_adjustment : unit -> Adjustment.adjustment_t =
      fun () -> new Adjustment.adjustment (Raw.Spin_button.get_adjustment obj)

    method get_climb_rate : unit -> float =
      fun () -> Raw.Spin_button.get_climb_rate obj

    method get_digits : unit -> int = fun () -> Raw.Spin_button.get_digits obj

    method get_numeric : unit -> bool =
      fun () -> Raw.Spin_button.get_numeric obj

    method get_snap_to_ticks : unit -> bool =
      fun () -> Raw.Spin_button.get_snap_to_ticks obj

    method get_update_policy : unit -> Enums.spinbuttonupdatepolicy =
      fun () -> Raw.Spin_button.get_update_policy obj

    method get_value : unit -> float = fun () -> Raw.Spin_button.get_value obj

    method get_value_as_int : unit -> int =
      fun () -> Raw.Spin_button.get_value_as_int obj

    method get_wrap : unit -> bool = fun () -> Raw.Spin_button.get_wrap obj

    method set_activates_default : bool -> unit =
      fun activates_default ->
        Raw.Spin_button.set_activates_default obj activates_default

    method set_adjustment : Adjustment.adjustment_t -> unit =
      fun adjustment ->
        let adjustment = adjustment#as_adjustment in
        Raw.Spin_button.set_adjustment obj adjustment

    method set_climb_rate : float -> unit =
      fun climb_rate -> Raw.Spin_button.set_climb_rate obj climb_rate

    method set_digits : int -> unit =
      fun digits -> Raw.Spin_button.set_digits obj digits

    method set_increments : float -> float -> unit =
      fun step page -> Raw.Spin_button.set_increments obj step page

    method set_numeric : bool -> unit =
      fun numeric -> Raw.Spin_button.set_numeric obj numeric

    method set_range : float -> float -> unit =
      fun min max -> Raw.Spin_button.set_range obj min max

    method set_snap_to_ticks : bool -> unit =
      fun snap_to_ticks -> Raw.Spin_button.set_snap_to_ticks obj snap_to_ticks

    method set_update_policy : Enums.spinbuttonupdatepolicy -> unit =
      fun policy -> Raw.Spin_button.set_update_policy obj policy

    method set_value : float -> unit =
      fun value -> Raw.Spin_button.set_value obj value

    method set_wrap : bool -> unit =
      fun wrap -> Raw.Spin_button.set_wrap obj wrap

    method spin : Enums.spintype -> float -> unit =
      fun direction increment -> Raw.Spin_button.spin obj direction increment

    method update : unit -> unit = fun () -> Raw.Spin_button.update obj
    method as_spin_button = obj
  end

let new_ (adjustment : Adjustment.adjustment_t option) (climb_rate : float)
    (digits : int) : spin_button_t =
  let adjustment = Option.map (fun c -> c#as_adjustment) adjustment in
  let obj_ = Raw.Spin_button.new_ adjustment climb_rate digits in
  new spin_button obj_

let new_with_range (min : float) (max : float) (step : float) : spin_button_t =
  let obj_ = Raw.Spin_button.new_with_range min max step in
  new spin_button obj_
