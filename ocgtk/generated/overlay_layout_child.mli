(** [GtkLayoutChild] subclass for children in a [GtkOverlayLayout].

    Its methods, signals and properties are on
    {!class-type-overlay_layout_child_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Overlay_layout_child}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [OverlayLayoutChild].}

    Inherits from:
    {{!Ocgtk.Layout_child.class-type-layout_child_t}Ocgtk.Layout_child}

    [GtkLayoutChild] subclass for children in a [GtkOverlayLayout]. *)
class type overlay_layout_child_t = object
  inherit Layout_child.layout_child_t

  (** {2:methods Methods} *)

  method get_clip_overlay : unit -> bool
  (** Retrieves whether the child is clipped. *)

  method get_measure : unit -> bool
  (** Retrieves whether the child is measured. *)

  method set_clip_overlay : bool -> unit
  (** Sets whether to clip this child. *)

  method set_measure : bool -> unit
  (** Sets whether to measure this child. *)

  (** {2:conversions Conversions} *)

  method as_overlay_layout_child : Raw.Overlay_layout_child.t
end

class overlay_layout_child :
  Raw.Overlay_layout_child.t ->
  overlay_layout_child_t
(** Wraps a raw handle of {!Ocgtk.Raw.Overlay_layout_child.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
