(* Signal class defined in gscale_button_signals.ml *)

(* High-level class for ScaleButton *)
class scale_button (obj : Scale_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Scale_button.as_widget obj)
  inherit Gscale_button_signals.scale_button_signals obj

  method get_active : unit -> bool =
    fun () ->
      (Scale_button.get_active obj)

  method get_adjustment : unit -> GAdjustment.adjustment =
    fun () ->
      new  GAdjustment.adjustment(Scale_button.get_adjustment obj)

  method get_has_frame : unit -> bool =
    fun () ->
      (Scale_button.get_has_frame obj)

  method get_minus_button : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Scale_button.get_minus_button obj)

  method get_plus_button : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Scale_button.get_plus_button obj)

  method get_popup : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Scale_button.get_popup obj)

  method get_value : unit -> float =
    fun () ->
      (Scale_button.get_value obj)

  method set_adjustment : 'p1. (#GAdjustment.adjustment as 'p1) -> unit =
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

  method as_widget = (Scale_button.as_widget obj)
    method as_scale_button = obj
end

