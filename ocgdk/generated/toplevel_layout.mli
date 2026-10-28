(** Contains information that is necessary to present a sovereign window on
    screen.

    The [GdkToplevelLayout] struct is necessary for using
    [Gdk.Toplevel.present].

    Toplevel surfaces are sovereign windows that can be presented to the user in
    various states (maximized, on all workspaces, etc).

    Its methods, signals and properties are on {!class-type-toplevel_layout_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgdk.Raw.Toplevel_layout}. *)

(** {b The methods, signals and properties of a [ToplevelLayout].}

    Contains information that is necessary to present a sovereign window on
    screen.

    The [GdkToplevelLayout] struct is necessary for using
    [Gdk.Toplevel.present].

    Toplevel surfaces are sovereign windows that can be presented to the user in
    various states (maximized, on all workspaces, etc). *)
class type toplevel_layout_t = object
  method equal : Raw.Toplevel_layout.t -> bool
  (** Check whether [layout] and [other] has identical layout properties. *)

  method get_fullscreen_monitor :
    unit -> App_launch_context_cycle_de440b34.monitor_t option
  (** Returns the monitor that the layout is fullscreening the surface on. *)

  method get_resizable : unit -> bool
  (** Returns whether the layout should allow the user to resize the surface. *)

  method ref : unit -> Raw.Toplevel_layout.t
  (** Increases the reference count of [layout]. *)

  method set_fullscreen :
    bool -> App_launch_context_cycle_de440b34.monitor_t option -> unit
  (** Sets whether the layout should cause the surface to be fullscreen when
      presented. *)

  method set_maximized : bool -> unit
  (** Sets whether the layout should cause the surface to be maximized when
      presented. *)

  method set_resizable : bool -> unit
  (** Sets whether the layout should allow the user to resize the surface after
      it has been presented. *)

  method as_toplevel_layout : Raw.Toplevel_layout.t
end

class toplevel_layout : Raw.Toplevel_layout.t -> toplevel_layout_t
(** Wraps a raw handle of {!Ocgdk.Raw.Toplevel_layout.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> toplevel_layout_t
(** Create a toplevel layout description.

    Used together with [Gdk.Toplevel.present] to describe how a toplevel surface
    should be placed and behave on-screen.

    The size is in ”application pixels”, not ”device pixels” (see
    [Gdk.Surface.get_scale]). *)
