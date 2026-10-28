(** Renders a scene graph defined via a tree of [Gsk.RenderNode] instances.

    Its methods, signals and properties are on {!class-type-renderer_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Renderer}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Renderer].}

    Renders a scene graph defined via a tree of [Gsk.RenderNode] instances.

    Typically you will use a [GskRenderer] instance to repeatedly call
    [Gsk.Renderer.render] to update the contents of its associated
    [Gdk.Surface].

    It is necessary to realize a [GskRenderer] instance using
    [Gsk.Renderer.realize] before calling [Gsk.Renderer.render], in order to
    create the appropriate windowing system resources needed to render the
    scene. *)
class type renderer_t = object
  (** {2:methods Methods} *)

  method get_surface : unit -> Ocgdk.Surface.surface_t option
  (** Retrieves the surface that the renderer is associated with.

      If the renderer has not been realized yet, [None] will be returned. *)

  method is_realized : unit -> bool
  (** Checks whether the renderer is realized or not. *)

  method realize : Ocgdk.Surface.surface_t option -> (bool, GError.t) result
  (** Creates the resources needed by the renderer.

      Since GTK 4.6, the surface may be [None], which allows using renderers
      without having to create a surface. Since GTK 4.14, it is recommended to
      use [Gsk.Renderer.realize_for_display] for this case.

      Note that it is mandatory to call [Gsk.Renderer.unrealize] before
      destroying the renderer. *)

  method realize_for_display :
    Ocgdk.Display.display_t -> (bool, GError.t) result
  (** Creates the resources needed by the renderer.

      Note that it is mandatory to call [Gsk.Renderer.unrealize] before
      destroying the renderer. *)

  method render :
    Render_node.render_node_t -> Occairo.Region.region_t option -> unit
  (** Renders the scene graph, described by a tree of [GskRenderNode] instances
      to the renderer's surface, ensuring that the given region gets redrawn.

      If the renderer has no associated surface, this function does nothing.

      Renderers must ensure that changes of the contents given by the [root]
      node as well as the area given by [region] are redrawn. They are however
      free to not redraw any pixel outside of [region] if they can guarantee
      that it didn't change.

      The renderer will acquire a reference on the [GskRenderNode] tree while
      the rendering is in progress. *)

  method render_texture :
    Render_node.render_node_t ->
    Ocgraphene.Rect.rect_t option ->
    Ocgdk.Texture.texture_t
  (** Renders a scene graph, described by a tree of [GskRenderNode] instances,
      to a texture.

      The renderer will acquire a reference on the [GskRenderNode] tree while
      the rendering is in progress.

      If you want to apply any transformations to [root], you should put it into
      a transform node and pass that node instead. *)

  method unrealize : unit -> unit
  (** Releases all the resources created by [Gsk.Renderer.realize]. *)

  (** {2:conversions Conversions} *)

  method as_renderer : Raw.Renderer.t
end

class renderer : Raw.Renderer.t -> renderer_t
(** Wraps a raw handle of {!Ocgsk.Raw.Renderer.t}. *)

(** {1:description Description}

    Renders a scene graph defined via a tree of [Gsk.RenderNode] instances.

    Typically you will use a [GskRenderer] instance to repeatedly call
    [Gsk.Renderer.render] to update the contents of its associated
    [Gdk.Surface].

    It is necessary to realize a [GskRenderer] instance using
    [Gsk.Renderer.realize] before calling [Gsk.Renderer.render], in order to
    create the appropriate windowing system resources needed to render the
    scene. *)

(** {1:constructors Constructors} *)

val new_for_surface : Ocgdk.Surface.surface_t -> renderer_t
(** Creates an appropriate [GskRenderer] instance for the given surface.

    If the [GSK_RENDERER] environment variable is set, GSK will try that
    renderer first, before trying the backend-specific default. The ultimate
    fallback is the cairo renderer.

    The renderer will be realized before it is returned. *)
