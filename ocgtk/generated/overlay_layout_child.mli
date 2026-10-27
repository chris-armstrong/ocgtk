(** [GtkLayoutChild] subclass for children in a [GtkOverlayLayout].

    Its methods, signals and properties are on
    {!class-type-overlay_layout_child_t}. The functions it is built on are in
    {!Ocgtk.Raw.Overlay_layout_child}. *)

(** The methods, signals and properties of a [GtkOverlayLayoutChild]. *)
class type overlay_layout_child_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_child_t

  method get_clip_overlay : unit -> bool
  method get_measure : unit -> bool
  method set_clip_overlay : bool -> unit
  method set_measure : bool -> unit
  method as_overlay_layout_child : Raw.Overlay_layout_child.t
end

class overlay_layout_child :
  Raw.Overlay_layout_child.t ->
  overlay_layout_child_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Overlay_layout_child.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkOverlayLayoutChild], give one already wrapped. *)
