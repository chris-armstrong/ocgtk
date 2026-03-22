(* Signal class defined in gscale_button_signals.ml *)

class type scale_button_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gscale_button_signals.scale_button_signals
    method get_active : unit -> bool
    method get_adjustment : unit -> GAdjustment.adjustment_t
    method get_has_frame : unit -> bool
    method get_minus_button : unit -> GButton.button_t
    method get_plus_button : unit -> GButton.button_t
    method get_popup : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_value : unit -> float
    method set_adjustment : GAdjustment.adjustment_t -> unit
    method set_has_frame : bool -> unit
    method set_icons : string array -> unit
    method set_value : float -> unit
    method as_scale_button : Scale_button.t
end

(* High-level class for ScaleButton *)
class scale_button (obj : Scale_button.t) : scale_button_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gscale_button_signals.scale_button_signals obj

  method get_active : unit -> bool =
    fun () ->
      (Scale_button.get_active obj)

  method get_adjustment : unit -> GAdjustment.adjustment_t =
    fun () ->
      new  GAdjustment.adjustment(Scale_button.get_adjustment obj)

  method get_has_frame : unit -> bool =
    fun () ->
      (Scale_button.get_has_frame obj)

  method get_minus_button : unit -> GButton.button_t =
    fun () ->
      new  GButton.button(Scale_button.get_minus_button obj)

  method get_plus_button : unit -> GButton.button_t =
    fun () ->
      new  GButton.button(Scale_button.get_plus_button obj)

  method get_popup : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Scale_button.get_popup obj)

  method get_value : unit -> float =
    fun () ->
      (Scale_button.get_value obj)

  method set_adjustment : GAdjustment.adjustment_t -> unit =
    fun adjustment ->
      let adjustment = adjustment#as_adjustment in
      (Scale_button.set_adjustment obj adjustment)

  method set_has_frame : bool -> unit =
    fun has_frame ->
      (Scale_button.set_has_frame obj has_frame)

  method set_icons : string array -> unit =
    fun icons ->
      (Scale_button.set_icons obj icons)

  method set_value : float -> unit =
    fun value ->
      (Scale_button.set_value obj value)

    method as_scale_button = obj
end

