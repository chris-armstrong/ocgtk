class type spin_button_t = object
  inherit Widget.widget_t
  inherit Accessible_range.accessible_range_t
  inherit Cell_editable.cell_editable_t
  inherit Editable.editable_t
  inherit Orientable.orientable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the spin button is activated.

      The keybindings for this signal are all forms of the <kbd>Enter</kbd> key.

      If the <kbd>Enter</kbd> key results in the value being committed to the
      spin button, then activation does not occur until <kbd>Enter</kbd> is
      pressed again. *)

  method on_change_value :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user initiates a value change.

      This is a keybinding signal.

      Applications should not connect to it, but may emit it with
      g_signal_emit_by_name() if they need to control the cursor
      programmatically.

      The default bindings for this signal are Up/Down and PageUp/PageDown. *)

  method on_output :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted to tweak the formatting of the value for display.\n\n\
     {[\n\
     // show leading zeros\n\
     static gboolean\n\
     on_output (GtkSpinButton *spin,\n\
    \           gpointer       data)\n\
     {\n\
    \   char *text;\n\
    \   int value;\n\n\
    \   value = gtk_spin_button_get_value_as_int (spin);\n\
    \   text = g_strdup_printf (\"%02d\", value);\n\
    \   gtk_editable_set_text (GTK_EDITABLE (spin), text):\n\
    \   g_free (text);\n\n\
    \   return TRUE;\n\
     }\n\
     ]}"]

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the value is changed.

      Also see the [Gtk.SpinButton::output] signal. *)

  method on_wrapped :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted right after the spinbutton wraps from its maximum to its minimum
      value or vice-versa. *)

  (** {2:methods Methods} *)

  method configure : Adjustment.adjustment_t option -> float -> int -> unit
  (** Changes the properties of an existing spin button.

      The adjustment, climb rate, and number of decimal places are updated
      accordingly. *)

  method get_activates_default : unit -> bool
  (** Retrieves the value set by [Gtk.SpinButton.set_activates_default]. *)

  method get_adjustment : unit -> Adjustment.adjustment_t
  (** Get the adjustment associated with a [GtkSpinButton]. *)

  method get_climb_rate : unit -> float
  (** Returns the acceleration rate for repeated changes. *)

  method get_digits : unit -> int
  (** Fetches the precision of [spin_button]. *)

  method get_numeric : unit -> bool
  (** Returns whether non-numeric text can be typed into the spin button. *)

  method get_snap_to_ticks : unit -> bool
  (** Returns whether the values are corrected to the nearest step. *)

  method get_update_policy : unit -> Enums.spinbuttonupdatepolicy
  (** Gets the update behavior of a spin button.

      See [Gtk.SpinButton.set_update_policy]. *)

  method get_value : unit -> float
  (** Get the value in the [spin_button]. *)

  method get_value_as_int : unit -> int
  (** Get the value [spin_button] represented as an integer. *)

  method get_wrap : unit -> bool
  (** Returns whether the spin button’s value wraps around to the opposite limit
      when the upper or lower limit of the range is exceeded. *)

  method set_activates_default : bool -> unit
  (** Sets whether activating the spin button will activate the default widget
      for the window containing the spin button.

      See [Gtk.SpinButton::activate] for what counts as activation. *)

  method set_adjustment : Adjustment.adjustment_t -> unit
  (** Replaces the [GtkAdjustment] associated with [spin_button]. *)

  method set_climb_rate : float -> unit
  (** Sets the acceleration rate for repeated changes when you hold down a
      button or key. *)

  method set_digits : int -> unit
  (** Set the precision to be displayed by [spin_button].

      Up to 20 digit precision is allowed. *)

  method set_increments : float -> float -> unit
  (** Sets the step and page increments for spin_button.

      This affects how quickly the value changes when the spin button’s arrows
      are activated. *)

  method set_numeric : bool -> unit
  (** Sets the flag that determines if non-numeric text can be typed into the
      spin button. *)

  method set_range : float -> float -> unit
  (** Sets the minimum and maximum allowable values for [spin_button].

      If the current value is outside this range, it will be adjusted to fit
      within the range, otherwise it will remain unchanged. *)

  method set_snap_to_ticks : bool -> unit
  (** Sets the policy as to whether values are corrected to the nearest step
      increment when a spin button is activated after providing an invalid
      value. *)

  method set_update_policy : Enums.spinbuttonupdatepolicy -> unit
  (** Sets the update behavior of a spin button.

      This determines whether the spin button is always updated or only when a
      valid value is set. *)

  method set_value : float -> unit
  (** Sets the value of [spin_button]. *)

  method set_wrap : bool -> unit
  (** Sets the flag that determines if a spin button value wraps around to the
      opposite limit when the upper or lower limit of the range is exceeded. *)

  method spin : Enums.spintype -> float -> unit
  (** Increment or decrement a spin button’s value in a specified direction by a
      specified amount. *)

  method update : unit -> unit
  (** Manually force an update of the spin button. *)

  (** {2:conversions Conversions} *)

  method as_spin_button : Raw.Spin_button.t
end

(* High-level class for SpinButton *)
class spin_button (obj : Raw.Spin_button.t) : spin_button_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

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
