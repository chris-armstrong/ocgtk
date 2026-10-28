(** Contains information that is useful to compute the size of a drag surface.

    Its methods, signals and properties are on
    {!class-type-drag_surface_size_t}. The functions it is built on are in
    {!Ocgdk.Raw.Drag_surface_size}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DragSurfaceSize].}

    Contains information that is useful to compute the size of a drag surface.
*)
class type drag_surface_size_t = object
  method set_size : int -> int -> unit
  (** Sets the size the drag surface prefers to be resized to. *)

  method as_drag_surface_size : Raw.Drag_surface_size.t
end

class drag_surface_size : Raw.Drag_surface_size.t -> drag_surface_size_t
(** Wraps a raw handle of {!Ocgdk.Raw.Drag_surface_size.t}. *)
