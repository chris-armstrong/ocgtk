class type overlay_layout_child_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .layout_child_t

  method get_clip_overlay : unit -> bool
  method get_measure : unit -> bool
  method set_clip_overlay : bool -> unit
  method set_measure : bool -> unit
  method as_overlay_layout_child : Overlay_layout_child.t
end

(* High-level class for OverlayLayoutChild *)
class overlay_layout_child (obj : Overlay_layout_child.t) :
  overlay_layout_child_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .layout_child
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Layout_child
             .t)

    method get_clip_overlay : unit -> bool =
      fun () -> Overlay_layout_child.get_clip_overlay obj

    method get_measure : unit -> bool =
      fun () -> Overlay_layout_child.get_measure obj

    method set_clip_overlay : bool -> unit =
      fun clip_overlay -> Overlay_layout_child.set_clip_overlay obj clip_overlay

    method set_measure : bool -> unit =
      fun measure -> Overlay_layout_child.set_measure obj measure

    method as_overlay_layout_child = obj
  end
