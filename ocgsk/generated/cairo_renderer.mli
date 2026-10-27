(** Renders a GSK rendernode tree with cairo.

    Since it is using cairo, this renderer cannot support 3D transformations.

    Its methods, signals and properties are on {!class-type-cairo_renderer_t}.
    The functions it is built on are in {!Ocgsk.Raw.Cairo_renderer}. *)

(** The methods, signals and properties of a [GskCairoRenderer]. *)
class type cairo_renderer_t = object
  inherit Renderer.renderer_t
  method as_cairo_renderer : Raw.Cairo_renderer.t
end

class cairo_renderer : Raw.Cairo_renderer.t -> cairo_renderer_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Cairo_renderer.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskCairoRenderer], give one already wrapped. *)

val new_ : unit -> cairo_renderer_t
