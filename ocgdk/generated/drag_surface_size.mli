(** Contains information that is useful to compute the size of a drag surface.

    Its methods, signals and properties are on
    {!class-type-drag_surface_size_t}. The functions it is built on are in
    {!Ocgdk.Raw.Drag_surface_size}. *)

(** The methods, signals and properties of a [GdkDragSurfaceSize]. *)
class type drag_surface_size_t = object
  method set_size : int -> int -> unit
  (** Sets the size the drag surface prefers to be resized to. *)

  method as_drag_surface_size : Raw.Drag_surface_size.t
end

class drag_surface_size : Raw.Drag_surface_size.t -> drag_surface_size_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Drag_surface_size.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkDragSurfaceSize], give one already wrapped. *)
