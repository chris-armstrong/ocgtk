(** Renders a scene graph defined via a tree of [Gsk.RenderNode] instances.

    Typically you will use a [GskRenderer] instance to repeatedly call
    [Gsk.Renderer.render] to update the contents of its associated
    [Gdk.Surface].

    It is necessary to realize a [GskRenderer] instance using
    [Gsk.Renderer.realize] before calling [Gsk.Renderer.render], in order to
    create the appropriate windowing system resources needed to render the
    scene.

    Its methods, signals and properties are on {!class-type-renderer_t}. The
    functions it is built on are in {!Ocgsk.Raw.Renderer}. *)

(** The methods, signals and properties of a [GskRenderer]. *)
class type renderer_t = object
  method get_surface : unit -> Ocgdk.Surface.surface_t option
  method is_realized : unit -> bool
  method realize : Ocgdk.Surface.surface_t option -> (bool, GError.t) result

  method realize_for_display :
    Ocgdk.Display.display_t -> (bool, GError.t) result

  method render :
    Render_node.render_node_t -> Occairo.Region.region_t option -> unit

  method render_texture :
    Render_node.render_node_t ->
    Ocgraphene.Rect.rect_t option ->
    Ocgdk.Texture.texture_t

  method unrealize : unit -> unit
  method as_renderer : Raw.Renderer.t
end

class renderer : Raw.Renderer.t -> renderer_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Renderer.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskRenderer], give one already wrapped. *)

val new_for_surface : Ocgdk.Surface.surface_t -> renderer_t
