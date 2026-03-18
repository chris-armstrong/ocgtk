(* High-level class for Renderer *)
class renderer (obj : Renderer.t) = object (self)

  method get_surface : unit -> Ocgtk_gdk.Gdk.surface option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.surface ret) (Renderer.get_surface obj)

  method is_realized : unit -> bool =
    fun () ->
      (Renderer.is_realized obj)

  method realize : 'p1. (#Ocgtk_gdk.Gdk.surface as 'p1) option -> (bool, GError.t) result =
    fun surface ->
      let surface = Option.map (fun (c) -> c#as_surface) surface in
      (Renderer.realize obj surface)

  method realize_for_display : 'p1. (#Ocgtk_gdk.Gdk.display as 'p1) -> (bool, GError.t) result =
    fun display ->
      let display = display#as_display in
      (Renderer.realize_for_display obj display)

  method render : 'p1 'p2. (#GRender_node.render_node as 'p1) -> (#Ocgtk_cairo.Cairo.region as 'p2) option -> unit =
    fun root region ->
      let root = root#as_render_node in
      let region = Option.map (fun (c) -> c#as_region) region in
      (Renderer.render obj root region)

  method render_texture : 'p1 'p2. (#GRender_node.render_node as 'p1) -> (#Ocgtk_graphene.Graphene.rect as 'p2) option -> Ocgtk_gdk.Gdk.texture =
    fun root viewport ->
      let root = root#as_render_node in
      let viewport = Option.map (fun (c) -> c#as_rect) viewport in
      new  Ocgtk_gdk.Gdk.texture(Renderer.render_texture obj root viewport)

  method unrealize : unit -> unit =
    fun () ->
      (Renderer.unrealize obj)

  method realized = Renderer.get_realized obj

    method as_renderer = obj
end

