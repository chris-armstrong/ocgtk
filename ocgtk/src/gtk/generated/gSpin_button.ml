(* Signal class defined in gspin_button_signals.ml *)

class type spin_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gspin_button_signals.spin_button_signals
    method configure : GAdjustment.adjustment_t option -> float -> int -> unit
    method get_activates_default : unit -> bool
    method get_adjustment : unit -> GAdjustment.adjustment_t
    method get_climb_rate : unit -> float
    method get_digits : unit -> int
    method get_numeric : unit -> bool
    method get_snap_to_ticks : unit -> bool
    method get_update_policy : unit -> Gtk_enums.spinbuttonupdatepolicy
    method get_value : unit -> float
    method get_value_as_int : unit -> int
    method get_wrap : unit -> bool
    method set_activates_default : bool -> unit
    method set_adjustment : GAdjustment.adjustment_t -> unit
    method set_climb_rate : float -> unit
    method set_digits : int -> unit
    method set_increments : float -> float -> unit
    method set_numeric : bool -> unit
    method set_range : float -> float -> unit
    method set_snap_to_ticks : bool -> unit
    method set_update_policy : Gtk_enums.spinbuttonupdatepolicy -> unit
    method set_value : float -> unit
    method set_wrap : bool -> unit
    method spin : Gtk_enums.spintype -> float -> unit
    method update : unit -> unit
    method as_spin_button : Spin_button.t
end

(* High-level class for SpinButton *)
class spin_button (obj : Spin_button.t) : spin_button_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gspin_button_signals.spin_button_signals obj

  method configure : GAdjustment.adjustment_t option -> float -> int -> unit =
    fun adjustment climb_rate digits ->
      let adjustment = Option.map (fun (c) -> c#as_adjustment) adjustment in
      (Spin_button.configure obj adjustment climb_rate digits)

  method get_activates_default : unit -> bool =
    fun () ->
      (Spin_button.get_activates_default obj)

  method get_adjustment : unit -> GAdjustment.adjustment_t =
    fun () ->
      new  GAdjustment.adjustment(Spin_button.get_adjustment obj)

  method get_climb_rate : unit -> float =
    fun () ->
      (Spin_button.get_climb_rate obj)

  method get_digits : unit -> int =
    fun () ->
      (Spin_button.get_digits obj)

  method get_numeric : unit -> bool =
    fun () ->
      (Spin_button.get_numeric obj)

  method get_snap_to_ticks : unit -> bool =
    fun () ->
      (Spin_button.get_snap_to_ticks obj)

  method get_update_policy : unit -> Gtk_enums.spinbuttonupdatepolicy =
    fun () ->
      (Spin_button.get_update_policy obj)

  method get_value : unit -> float =
    fun () ->
      (Spin_button.get_value obj)

  method get_value_as_int : unit -> int =
    fun () ->
      (Spin_button.get_value_as_int obj)

  method get_wrap : unit -> bool =
    fun () ->
      (Spin_button.get_wrap obj)

  method set_activates_default : bool -> unit =
    fun activates_default ->
      (Spin_button.set_activates_default obj activates_default)

  method set_adjustment : GAdjustment.adjustment_t -> unit =
    fun adjustment ->
      let adjustment = adjustment#as_adjustment in
      (Spin_button.set_adjustment obj adjustment)

  method set_climb_rate : float -> unit =
    fun climb_rate ->
      (Spin_button.set_climb_rate obj climb_rate)

  method set_digits : int -> unit =
    fun digits ->
      (Spin_button.set_digits obj digits)

  method set_increments : float -> float -> unit =
    fun step page ->
      (Spin_button.set_increments obj step page)

  method set_numeric : bool -> unit =
    fun numeric ->
      (Spin_button.set_numeric obj numeric)

  method set_range : float -> float -> unit =
    fun min max ->
      (Spin_button.set_range obj min max)

  method set_snap_to_ticks : bool -> unit =
    fun snap_to_ticks ->
      (Spin_button.set_snap_to_ticks obj snap_to_ticks)

  method set_update_policy : Gtk_enums.spinbuttonupdatepolicy -> unit =
    fun policy ->
      (Spin_button.set_update_policy obj policy)

  method set_value : float -> unit =
    fun value ->
      (Spin_button.set_value obj value)

  method set_wrap : bool -> unit =
    fun wrap ->
      (Spin_button.set_wrap obj wrap)

  method spin : Gtk_enums.spintype -> float -> unit =
    fun direction increment ->
      (Spin_button.spin obj direction increment)

  method update : unit -> unit =
    fun () ->
      (Spin_button.update obj)

    method as_spin_button = obj
end

