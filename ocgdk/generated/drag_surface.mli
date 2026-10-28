(** A surface that is used during DND.

    Its methods, signals and properties are on {!class-type-drag_surface_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.Drag_surface}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DragSurface].}

    Requires:
    - {{!Ocgdk.Surface.class-type-surface_t}Ocgdk.Surface}

    A surface that is used during DND. *)
class type drag_surface_t = object
  (** {2:methods Methods} *)

  method present : int -> int -> bool
  (** Present [drag_surface]. *)

  (** {2:conversions Conversions} *)

  method as_drag_surface : Raw.Drag_surface.t
end

class drag_surface : Raw.Drag_surface.t -> drag_surface_t
(** Wraps a raw handle of {!Ocgdk.Raw.Drag_surface.t}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
