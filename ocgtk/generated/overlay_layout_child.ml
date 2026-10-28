class type overlay_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  method get_clip_overlay : unit -> bool
  (** Retrieves whether the child is clipped. *)

  method get_measure : unit -> bool
  (** Retrieves whether the child is measured. *)

  method set_clip_overlay : bool -> unit
  (** Sets whether to clip this child. *)

  method set_measure : bool -> unit
  (** Sets whether to measure this child. *)

  method as_overlay_layout_child : Raw.Overlay_layout_child.t
end

(* High-level class for OverlayLayoutChild *)
class overlay_layout_child (obj : Raw.Overlay_layout_child.t) :
  overlay_layout_child_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .layout_child
        (obj :> Raw.Layout_child.t)

    method get_clip_overlay : unit -> bool =
      fun () -> Raw.Overlay_layout_child.get_clip_overlay obj

    method get_measure : unit -> bool =
      fun () -> Raw.Overlay_layout_child.get_measure obj

    method set_clip_overlay : bool -> unit =
      fun clip_overlay ->
        Raw.Overlay_layout_child.set_clip_overlay obj clip_overlay

    method set_measure : bool -> unit =
      fun measure -> Raw.Overlay_layout_child.set_measure obj measure

    method as_overlay_layout_child = obj
  end
