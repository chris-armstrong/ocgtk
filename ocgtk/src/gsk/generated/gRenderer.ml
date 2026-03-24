class type renderer_t = object
    method get_surface : unit -> Ocgtk_gdk.Gdk.Surface.surface_t option
    method is_realized : unit -> bool
    method realize : Ocgtk_gdk.Gdk.Surface.surface_t option -> (bool, GError.t) result
    method realize_for_display : Ocgtk_gdk.Gdk.Display.display_t -> (bool, GError.t) result
    method render : GRender_node.render_node_t -> Ocgtk_cairo.Cairo.Region.region_t option -> unit
    method render_texture : GRender_node.render_node_t -> Ocgtk_graphene.Graphene.Rect.rect_t option -> Ocgtk_gdk.Gdk.Texture.texture_t
    method unrealize : unit -> unit
    method realized : bool
    method as_renderer : Renderer.t
end

(* High-level class for Renderer *)
class renderer (obj : Renderer.t) : renderer_t = object (self)

  method get_surface : unit -> Ocgtk_gdk.Gdk.Surface.surface_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Surface.surface ret) (Renderer.get_surface obj)

  method is_realized : unit -> bool =
    fun () ->
      (Renderer.is_realized obj)

  method realize : Ocgtk_gdk.Gdk.Surface.surface_t option -> (bool, GError.t) result =
    fun surface ->
      let surface = Option.map (fun (c) -> c#as_surface) surface in
      (Renderer.realize obj surface)

  method realize_for_display : Ocgtk_gdk.Gdk.Display.display_t -> (bool, GError.t) result =
    fun display ->
      let display = display#as_display in
      (Renderer.realize_for_display obj display)

  method render : GRender_node.render_node_t -> Ocgtk_cairo.Cairo.Region.region_t option -> unit =
    fun root region ->
      let root = root#as_render_node in
      let region = Option.map (fun (c) -> c#as_region) region in
      (Renderer.render obj root region)

  method render_texture : GRender_node.render_node_t -> Ocgtk_graphene.Graphene.Rect.rect_t option -> Ocgtk_gdk.Gdk.Texture.texture_t =
    fun root viewport ->
      let root = root#as_render_node in
      let viewport = Option.map (fun (c) -> c#as_rect) viewport in
      new  Ocgtk_gdk.Gdk.Texture.texture(Renderer.render_texture obj root viewport)

  method unrealize : unit -> unit =
    fun () ->
      (Renderer.unrealize obj)

  method realized = Renderer.get_realized obj

    method as_renderer = obj
end

let new_for_surface (surface : Ocgtk_gdk.Gdk.Surface.surface_t) : renderer_t =
  let surface = surface#as_surface in
  let obj_ = Renderer.new_for_surface surface in
  new renderer obj_

