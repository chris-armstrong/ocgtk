(** Contains information that is necessary to present a sovereign window on
    screen.

    Its methods, signals and properties are on {!class-type-toplevel_layout_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Toplevel_layout}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ToplevelLayout].}

    Contains information that is necessary to present a sovereign window on
    screen.

    The [GdkToplevelLayout] struct is necessary for using
    [Gdk.Toplevel.present].

    Toplevel surfaces are sovereign windows that can be presented to the user in
    various states (maximized, on all workspaces, etc). *)
class type toplevel_layout_t = object
  (** {2:methods Methods} *)

  method equal : Raw.Toplevel_layout.t -> bool
  (** Check whether [layout] and [other] has identical layout properties. *)

  method get_fullscreen_monitor : unit -> Monitor.monitor_t option
  (** Returns the monitor that the layout is fullscreening the surface on. *)

  method get_resizable : unit -> bool
  (** Returns whether the layout should allow the user to resize the surface. *)

  method ref : unit -> Raw.Toplevel_layout.t
  (** Increases the reference count of [layout]. *)

  method set_fullscreen : bool -> Monitor.monitor_t option -> unit
  (** Sets whether the layout should cause the surface to be fullscreen when
      presented. *)

  method set_maximized : bool -> unit
  (** Sets whether the layout should cause the surface to be maximized when
      presented. *)

  method set_resizable : bool -> unit
  (** Sets whether the layout should allow the user to resize the surface after
      it has been presented. *)

  (** {2:conversions Conversions} *)

  method as_toplevel_layout : Raw.Toplevel_layout.t
end

class toplevel_layout : Raw.Toplevel_layout.t -> toplevel_layout_t
(** Wraps a raw handle of {!Ocgdk.Raw.Toplevel_layout.t}. *)

(** {1:description Description}

    Contains information that is necessary to present a sovereign window on
    screen.

    The [GdkToplevelLayout] struct is necessary for using
    [Gdk.Toplevel.present].

    Toplevel surfaces are sovereign windows that can be presented to the user in
    various states (maximized, on all workspaces, etc). *)

(** {1:constructors Constructors} *)

val new_ : unit -> toplevel_layout_t
(** Create a toplevel layout description.

    Used together with [Gdk.Toplevel.present] to describe how a toplevel surface
    should be placed and behave on-screen.

    The size is in ”application pixels”, not ”device pixels” (see
    [Gdk.Surface.get_scale]). *)
