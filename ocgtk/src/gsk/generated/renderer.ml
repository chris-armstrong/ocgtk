(* GENERATED CODE - DO NOT EDIT *)
(* Renderer: Renderer *)

type t = [`renderer | `object_] Gobject.obj

(** Create a new Renderer *)
external new_for_surface : Ocgtk_gdk.Gdk.Wrappers.Surface.t -> t = "ml_gsk_renderer_new_for_surface"

(* Methods *)
(** Releases all the resources created by gsk_renderer_realize(). *)
external unrealize : t -> unit = "ml_gsk_renderer_unrealize"

(** Renders the scene graph, described by a tree of `GskRenderNode` instances,
to a `GdkTexture`.

The @renderer will acquire a reference on the `GskRenderNode` tree while
the rendering is in progress.

If you want to apply any transformations to @root, you should put it into a
transform node and pass that node instead. *)
external render_texture : t -> Render_node.t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t option -> Ocgtk_gdk.Gdk.Wrappers.Texture.t = "ml_gsk_renderer_render_texture"

(** Renders the scene graph, described by a tree of `GskRenderNode` instances
to the renderer's surface,  ensuring that the given @region gets redrawn.

If the renderer has no associated surface, this function does nothing.

Renderers must ensure that changes of the contents given by the @root
node as well as the area given by @region are redrawn. They are however
free to not redraw any pixel outside of @region if they can guarantee that
it didn't change.

The @renderer will acquire a reference on the `GskRenderNode` tree while
the rendering is in progress. *)
external render : t -> Render_node.t -> Ocgtk_cairo.Cairo.Wrappers.Region.t option -> unit = "ml_gsk_renderer_render"

(** Creates the resources needed by the @renderer to render the scene
graph.

Note that it is mandatory to call [method@Gsk.Renderer.unrealize] before
destroying the renderer. *)
external realize_for_display : t -> Ocgtk_gdk.Gdk.Wrappers.Display.t -> (bool, GError.t) result = "ml_gsk_renderer_realize_for_display"

(** Creates the resources needed by the @renderer to render the scene
graph.

Since GTK 4.6, the surface may be `NULL`, which allows using
renderers without having to create a surface.
Since GTK 4.14, it is recommended to use [method@Gsk.Renderer.realize_for_display]
instead.

Note that it is mandatory to call [method@Gsk.Renderer.unrealize] before
destroying the renderer. *)
external realize : t -> Ocgtk_gdk.Gdk.Wrappers.Surface.t option -> (bool, GError.t) result = "ml_gsk_renderer_realize"

(** Checks whether the @renderer is realized or not. *)
external is_realized : t -> bool = "ml_gsk_renderer_is_realized"

(** Retrieves the `GdkSurface` set using gsk_enderer_realize().

If the renderer has not been realized yet, %NULL will be returned. *)
external get_surface : t -> Ocgtk_gdk.Gdk.Wrappers.Surface.t option = "ml_gsk_renderer_get_surface"

(* Properties *)

(** Get property: realized *)
external get_realized : t -> bool = "ml_gsk_renderer_get_realized"

