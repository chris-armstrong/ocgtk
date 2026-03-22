(* Signal class defined in goverlay_signals.ml *)

class type overlay_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Goverlay_signals.overlay_signals
    method add_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_clip_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method get_measure_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool
    method remove_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method set_clip_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit
    method set_measure_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit
    method as_overlay : Overlay.t
end

(* High-level class for Overlay *)
class overlay (obj : Overlay.t) : overlay_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Goverlay_signals.overlay_signals obj

  method add_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Overlay.add_overlay obj widget)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Overlay.get_child obj)

  method get_clip_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool =
    fun widget ->
      let widget = widget#as_widget in
      (Overlay.get_clip_overlay obj widget)

  method get_measure_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool =
    fun widget ->
      let widget = widget#as_widget in
      (Overlay.get_measure_overlay obj widget)

  method remove_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Overlay.remove_overlay obj widget)

  method set_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Overlay.set_child obj child)

  method set_clip_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit =
    fun widget clip_overlay ->
      let widget = widget#as_widget in
      (Overlay.set_clip_overlay obj widget clip_overlay)

  method set_measure_overlay : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> bool -> unit =
    fun widget measure ->
      let widget = widget#as_widget in
      (Overlay.set_measure_overlay obj widget measure)

    method as_overlay = obj
end

