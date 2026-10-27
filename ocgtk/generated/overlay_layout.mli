(** The layout manager used by [Gtk.Overlay].

    It places widgets as overlays on top of the main child.

    This is not a reusable layout manager, since it expects its widget to be a
    [GtkOverlay]. It is only listed here so that its layout properties get
    documented.

    Its methods, signals and properties are on {!class-type-overlay_layout_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Overlay_layout}. *)

(** The methods, signals and properties of a [GtkOverlayLayout]. *)
class type overlay_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  method as_overlay_layout : Raw.Overlay_layout.t
end

class overlay_layout : Raw.Overlay_layout.t -> overlay_layout_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Overlay_layout.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkOverlayLayout], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> overlay_layout_t
(** Creates a new [GtkOverlayLayout] instance. *)
