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

(* High-level class for CairoNode *)
class cairo_node (obj : Raw.Cairo_node.t) : cairo_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_draw_context : unit -> Occairo.Context.context_t =
      fun () ->
        new Occairo.Context.context (Raw.Cairo_node.get_draw_context obj)

    method get_surface : unit -> Occairo.Surface.surface_t =
      fun () -> new Occairo.Surface.surface (Raw.Cairo_node.get_surface obj)

    method as_cairo_node = obj
  end

let new_ (bounds : Ocgraphene.Rect.rect_t) : cairo_node_t =
  let bounds = bounds#as_rect in
  let obj_ = Raw.Cairo_node.new_ bounds in
  new cairo_node obj_
