(* Signal class defined in gspin_button_signals.ml *)

(* High-level class for SpinButton *)
class spin_button (obj : Spin_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Spin_button.as_widget obj)
  inherit Gspin_button_signals.spin_button_signals obj

  method activates_default = Spin_button.get_activates_default obj
  method set_activates_default v = Spin_button.set_activates_default obj v

  method climb_rate = Spin_button.get_climb_rate obj
  method set_climb_rate v = Spin_button.set_climb_rate obj v

  method digits = Spin_button.get_digits obj
  method set_digits v = Spin_button.set_digits obj v

  method numeric = Spin_button.get_numeric obj
  method set_numeric v = Spin_button.set_numeric obj v

  method snap_to_ticks = Spin_button.get_snap_to_ticks obj
  method set_snap_to_ticks v = Spin_button.set_snap_to_ticks obj v

  method value = Spin_button.get_value obj
  method set_value v = Spin_button.set_value obj v

  method wrap = Spin_button.get_wrap obj
  method set_wrap v = Spin_button.set_wrap obj v

  method configure : 'p1. (#GAdjustment.adjustment as 'p1) option -> float -> int -> unit = fun adjustment climb_rate digits -> (Spin_button.configure obj ( adjustment |> Option.map (fun x -> x#as_adjustment) ) climb_rate digits)

  method get_adjustment : unit -> GAdjustment.adjustment = fun () -> new  GAdjustment.adjustment(Spin_button.get_adjustment obj )

  method get_update_policy : unit -> Gtk_enums.spinbuttonupdatepolicy = fun () -> (Spin_button.get_update_policy obj )

  method get_value_as_int : unit -> int = fun () -> (Spin_button.get_value_as_int obj )

  method set_adjustment : 'p1. (#GAdjustment.adjustment as 'p1) -> unit = fun adjustment -> (Spin_button.set_adjustment obj ( adjustment#as_adjustment ))

  method set_increments : float -> float -> unit = fun step page -> (Spin_button.set_increments obj step page)

  method set_range : float -> float -> unit = fun min max -> (Spin_button.set_range obj min max)

  method set_update_policy : Gtk_enums.spinbuttonupdatepolicy -> unit = fun policy -> (Spin_button.set_update_policy obj policy)

  method spin : Gtk_enums.spintype -> float -> unit = fun direction increment -> (Spin_button.spin obj direction increment)

  method update : unit -> unit = fun () -> (Spin_button.update obj )

  method as_widget = (Spin_button.as_widget obj)
    method as_spin_button = obj
end

