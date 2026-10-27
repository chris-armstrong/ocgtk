(** A render node for a Cairo surface.

    Its methods, signals and properties are on {!class-type-cairo_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Cairo_node}. *)

(** The methods, signals and properties of a [GskCairoNode]. *)
class type cairo_node_t = object
  inherit Render_node.render_node_t

  method get_draw_context : unit -> Occairo.Context.context_t
  (** Creates a Cairo context for drawing using the surface associated to the
      render node.

      If no surface exists yet, a surface will be created optimized for
      rendering to [renderer]. *)

  method get_surface : unit -> Occairo.Surface.surface_t
  (** Retrieves the Cairo surface used by the render node. *)

  method as_cairo_node : Raw.Cairo_node.t
end

class cairo_node : Raw.Cairo_node.t -> cairo_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Cairo_node.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskCairoNode], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Ocgraphene.Rect.rect_t -> cairo_node_t
(** Creates a [GskRenderNode] that will render a cairo surface into the area
    given by [bounds].

    You can draw to the cairo surface using [Gsk.CairoNode.get_draw_context]. *)
