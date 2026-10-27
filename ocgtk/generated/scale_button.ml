class type scale_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method on_popdown :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to dismiss the popup.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Escape</kbd>. *)

  method on_popup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to popup the scale widget.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Space</kbd>,
      <kbd>Enter</kbd> and <kbd>Return</kbd>. *)

  method on_value_changed :
    ?after:bool ->
    callback:(value:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the value field has changed. *)

  method get_active : unit -> bool
  (** Queries a [GtkScaleButton] and returns its current state.

      Returns [TRUE] if the scale button is pressed in and [FALSE] if it is
      raised. *)

  method get_adjustment : unit -> Adjustment.adjustment_t
  (** Gets the [GtkAdjustment] associated with the [GtkScaleButton]’s scale.

      See [Gtk.Range.get_adjustment] for details. *)

  method get_has_frame : unit -> bool
  (** Returns whether the button has a frame. *)

  method get_minus_button : unit -> Button.button_t
  (** Retrieves the minus button of the [GtkScaleButton]. *)

  method get_plus_button : unit -> Button.button_t
  (** Retrieves the plus button of the [GtkScaleButton.] *)

  method get_popup :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Retrieves the popup of the [GtkScaleButton]. *)

  method get_value : unit -> float
  (** Gets the current value of the scale button. *)

  method set_adjustment : Adjustment.adjustment_t -> unit
  (** Sets the [GtkAdjustment] to be used as a model for the [GtkScaleButton]’s
      scale.

      See [Gtk.Range.set_adjustment] for details. *)

  method set_has_frame : bool -> unit
  (** Sets the style of the button. *)

  method set_icons : string array -> unit
  (** Sets the icons to be used by the scale button. *)

  method set_value : float -> unit
  (** Sets the current value of the scale.

      If the value is outside the minimum or maximum range values, it will be
      clamped to fit inside them.

      The scale button emits the [Gtk.ScaleButton::value-changed] signal if the
      value changes. *)

  method as_scale_button : Raw.Scale_button.t
end

(* High-level class for ScaleButton *)
class scale_button (obj : Raw.Scale_button.t) : scale_button_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit
      Accessible_range.accessible_range (Raw.Accessible_range.from_gobject obj)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method on_popdown ?(after = false) ~callback () =
      Raw.Scale_button.on_popdown ~after self#as_scale_button ~callback

    method on_popup ?(after = false) ~callback () =
      Raw.Scale_button.on_popup ~after self#as_scale_button ~callback

    method on_value_changed ?(after = false) ~callback () =
      Raw.Scale_button.on_value_changed ~after self#as_scale_button ~callback

    method get_active : unit -> bool = fun () -> Raw.Scale_button.get_active obj

    method get_adjustment : unit -> Adjustment.adjustment_t =
      fun () -> new Adjustment.adjustment (Raw.Scale_button.get_adjustment obj)

    method get_has_frame : unit -> bool =
      fun () -> Raw.Scale_button.get_has_frame obj

    method get_minus_button : unit -> Button.button_t =
      fun () -> new Button.button (Raw.Scale_button.get_minus_button obj)

    method get_plus_button : unit -> Button.button_t =
      fun () -> new Button.button (Raw.Scale_button.get_plus_button obj)

    method get_popup :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Scale_button.get_popup obj)

    method get_value : unit -> float = fun () -> Raw.Scale_button.get_value obj

    method set_adjustment : Adjustment.adjustment_t -> unit =
      fun adjustment ->
        let adjustment = adjustment#as_adjustment in
        Raw.Scale_button.set_adjustment obj adjustment

    method set_has_frame : bool -> unit =
      fun has_frame -> Raw.Scale_button.set_has_frame obj has_frame

    method set_icons : string array -> unit =
      fun icons -> Raw.Scale_button.set_icons obj icons

    method set_value : float -> unit =
      fun value -> Raw.Scale_button.set_value obj value

    method as_scale_button = obj
  end

let new_ (min : float) (max : float) (step : float)
    (icons : string array option) : scale_button_t =
  let obj_ = Raw.Scale_button.new_ min max step icons in
  new scale_button obj_
