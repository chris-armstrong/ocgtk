(** A surface that is used during DND.

    Its methods, signals and properties are on {!class-type-drag_surface_t}. The
    functions it is built on are in {!Ocgdk.Raw.Drag_surface}. *)

(** The methods, signals and properties of a [GdkDragSurface]. *)
class type drag_surface_t = object
  method present : int -> int -> bool
  method as_drag_surface : Raw.Drag_surface.t
end

class drag_surface : Raw.Drag_surface.t -> drag_surface_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Drag_surface.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDragSurface], give one already wrapped. *)
