(** A surface that is used during DND.

    Its methods, signals and properties are on {!class-type-drag_surface_t}. The
    functions it is built on are in {!Ocgdk.Raw.Drag_surface}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DragSurface].}

    A surface that is used during DND. *)
class type drag_surface_t = object
  method present : int -> int -> bool
  (** Present [drag_surface]. *)

  method as_drag_surface : Raw.Drag_surface.t
end

class drag_surface : Raw.Drag_surface.t -> drag_surface_t
(** Wraps a raw handle of {!Ocgdk.Raw.Drag_surface.t}. *)
