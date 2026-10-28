(** [GtkLayoutChild] subclass for children in a [GtkOverlayLayout].

    Its methods, signals and properties are on
    {!class-type-overlay_layout_child_t}. The functions it is built on are in
    {!Ocgtk.Raw.Overlay_layout_child}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [OverlayLayoutChild].}

    [GtkLayoutChild] subclass for children in a [GtkOverlayLayout]. *)
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

class overlay_layout_child :
  Raw.Overlay_layout_child.t ->
  overlay_layout_child_t
(** Wraps a raw handle of {!Ocgtk.Raw.Overlay_layout_child.t}. *)
