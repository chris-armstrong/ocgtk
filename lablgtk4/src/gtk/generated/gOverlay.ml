(* Signal class defined in goverlay_signals.ml *)

(* High-level class for Overlay *)
class overlay (obj : Overlay.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Overlay.as_widget obj)
  inherit Goverlay_signals.overlay_signals obj

  method add_overlay : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Overlay.add_overlay obj widget)

  method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Overlay.get_child obj )

  method get_clip_overlay : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool =
    fun widget ->
      let widget = widget#as_widget in
      (Overlay.get_clip_overlay obj widget)

  method get_measure_overlay : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool =
    fun widget ->
      let widget = widget#as_widget in
      (Overlay.get_measure_overlay obj widget)

  method remove_overlay : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun widget ->
      let widget = widget#as_widget in
      (Overlay.remove_overlay obj widget)

  method set_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun child ->
      let child = Option.map (fun (c) -> c#as_widget) child in
      (Overlay.set_child obj child)

  method set_clip_overlay : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool -> unit =
    fun widget clip_overlay ->
      let widget = widget#as_widget in
      (Overlay.set_clip_overlay obj widget clip_overlay)

  method set_measure_overlay : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> bool -> unit =
    fun widget measure ->
      let widget = widget#as_widget in
      (Overlay.set_measure_overlay obj widget measure)

  method as_widget = (Overlay.as_widget obj)
    method as_overlay = obj
end

