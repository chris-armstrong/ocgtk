(* High-level class for Snapshot *)
class snapshot (obj : Snapshot.t) = object (self)

  method append_border : 'p1. (#Ocgtk_gsk.Gsk.rounded_rect as 'p1) -> float array -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array -> unit =
    fun outline border_width border_color ->
      let outline = outline#as_rounded_rect in
      (Snapshot.append_border obj outline border_width border_color)

  method append_cairo : 'p1. (#Ocgtk_graphene.Graphene.rect as 'p1) -> Ocgtk_cairo.Cairo.context =
    fun bounds ->
      let bounds = bounds#as_rect in
      new  Ocgtk_cairo.Cairo.context(Snapshot.append_cairo obj bounds)

  method append_color : 'p1 'p2. (#Ocgtk_gdk.Gdk.rgb_a as 'p1) -> (#Ocgtk_graphene.Graphene.rect as 'p2) -> unit =
    fun color bounds ->
      let color = color#as_rgb_a in
      let bounds = bounds#as_rect in
      (Snapshot.append_color obj color bounds)

  method append_fill : 'p1 'p2. (#Ocgtk_gsk.Gsk.path as 'p1) -> Ocgtk_gsk.Gsk.fillrule -> (#Ocgtk_gdk.Gdk.rgb_a as 'p2) -> unit =
    fun path fill_rule color ->
      let path = path#as_path in
      let color = color#as_rgb_a in
      (Snapshot.append_fill obj path fill_rule color)

  method append_inset_shadow : 'p1 'p2. (#Ocgtk_gsk.Gsk.rounded_rect as 'p1) -> (#Ocgtk_gdk.Gdk.rgb_a as 'p2) -> float -> float -> float -> float -> unit =
    fun outline color dx dy spread blur_radius ->
      let outline = outline#as_rounded_rect in
      let color = color#as_rgb_a in
      (Snapshot.append_inset_shadow obj outline color dx dy spread blur_radius)

  method append_layout : 'p1 'p2. (#Ocgtk_pango.Pango.layout as 'p1) -> (#Ocgtk_gdk.Gdk.rgb_a as 'p2) -> unit =
    fun layout color ->
      let layout = layout#as_layout in
      let color = color#as_rgb_a in
      (Snapshot.append_layout obj layout color)

  method append_node : 'p1. (#Ocgtk_gsk.Gsk.render_node as 'p1) -> unit =
    fun node ->
      let node = node#as_render_node in
      (Snapshot.append_node obj node)

  method append_outset_shadow : 'p1 'p2. (#Ocgtk_gsk.Gsk.rounded_rect as 'p1) -> (#Ocgtk_gdk.Gdk.rgb_a as 'p2) -> float -> float -> float -> float -> unit =
    fun outline color dx dy spread blur_radius ->
      let outline = outline#as_rounded_rect in
      let color = color#as_rgb_a in
      (Snapshot.append_outset_shadow obj outline color dx dy spread blur_radius)

  method append_scaled_texture : 'p1 'p2. (#Ocgtk_gdk.Gdk.texture as 'p1) -> Ocgtk_gsk.Gsk.scalingfilter -> (#Ocgtk_graphene.Graphene.rect as 'p2) -> unit =
    fun texture filter bounds ->
      let texture = texture#as_texture in
      let bounds = bounds#as_rect in
      (Snapshot.append_scaled_texture obj texture filter bounds)

  method append_stroke : 'p1 'p2 'p3. (#Ocgtk_gsk.Gsk.path as 'p1) -> (#Ocgtk_gsk.Gsk.stroke as 'p2) -> (#Ocgtk_gdk.Gdk.rgb_a as 'p3) -> unit =
    fun path stroke color ->
      let path = path#as_path in
      let stroke = stroke#as_stroke in
      let color = color#as_rgb_a in
      (Snapshot.append_stroke obj path stroke color)

  method append_texture : 'p1 'p2. (#Ocgtk_gdk.Gdk.texture as 'p1) -> (#Ocgtk_graphene.Graphene.rect as 'p2) -> unit =
    fun texture bounds ->
      let texture = texture#as_texture in
      let bounds = bounds#as_rect in
      (Snapshot.append_texture obj texture bounds)

  method gl_shader_pop_texture : unit -> unit =
    fun () ->
      (Snapshot.gl_shader_pop_texture obj)

  method perspective : float -> unit =
    fun depth ->
      (Snapshot.perspective obj depth)

  method pop : unit -> unit =
    fun () ->
      (Snapshot.pop obj)

  method push_blend : Ocgtk_gsk.Gsk.blendmode -> unit =
    fun blend_mode ->
      (Snapshot.push_blend obj blend_mode)

  method push_blur : float -> unit =
    fun radius ->
      (Snapshot.push_blur obj radius)

  method push_clip : 'p1. (#Ocgtk_graphene.Graphene.rect as 'p1) -> unit =
    fun bounds ->
      let bounds = bounds#as_rect in
      (Snapshot.push_clip obj bounds)

  method push_color_matrix : 'p1 'p2. (#Ocgtk_graphene.Graphene.matrix as 'p1) -> (#Ocgtk_graphene.Graphene.vec4 as 'p2) -> unit =
    fun color_matrix color_offset ->
      let color_matrix = color_matrix#as_matrix in
      let color_offset = color_offset#as_vec4 in
      (Snapshot.push_color_matrix obj color_matrix color_offset)

  method push_cross_fade : float -> unit =
    fun progress ->
      (Snapshot.push_cross_fade obj progress)

  method push_fill : 'p1. (#Ocgtk_gsk.Gsk.path as 'p1) -> Ocgtk_gsk.Gsk.fillrule -> unit =
    fun path fill_rule ->
      let path = path#as_path in
      (Snapshot.push_fill obj path fill_rule)

  method push_mask : Ocgtk_gsk.Gsk.maskmode -> unit =
    fun mask_mode ->
      (Snapshot.push_mask obj mask_mode)

  method push_opacity : float -> unit =
    fun opacity ->
      (Snapshot.push_opacity obj opacity)

  method push_repeat : 'p1 'p2. (#Ocgtk_graphene.Graphene.rect as 'p1) -> (#Ocgtk_graphene.Graphene.rect as 'p2) option -> unit =
    fun bounds child_bounds ->
      let bounds = bounds#as_rect in
      let child_bounds = Option.map (fun (c) -> c#as_rect) child_bounds in
      (Snapshot.push_repeat obj bounds child_bounds)

  method push_rounded_clip : 'p1. (#Ocgtk_gsk.Gsk.rounded_rect as 'p1) -> unit =
    fun bounds ->
      let bounds = bounds#as_rounded_rect in
      (Snapshot.push_rounded_clip obj bounds)

  method push_stroke : 'p1 'p2. (#Ocgtk_gsk.Gsk.path as 'p1) -> (#Ocgtk_gsk.Gsk.stroke as 'p2) -> unit =
    fun path stroke ->
      let path = path#as_path in
      let stroke = stroke#as_stroke in
      (Snapshot.push_stroke obj path stroke)

  method render_background : 'p1. (#GStyle_context.style_context as 'p1) -> float -> float -> float -> float -> unit =
    fun context x y width height ->
      let context = context#as_style_context in
      (Snapshot.render_background obj context x y width height)

  method render_focus : 'p1. (#GStyle_context.style_context as 'p1) -> float -> float -> float -> float -> unit =
    fun context x y width height ->
      let context = context#as_style_context in
      (Snapshot.render_focus obj context x y width height)

  method render_frame : 'p1. (#GStyle_context.style_context as 'p1) -> float -> float -> float -> float -> unit =
    fun context x y width height ->
      let context = context#as_style_context in
      (Snapshot.render_frame obj context x y width height)

  method render_insertion_cursor : 'p1 'p2. (#GStyle_context.style_context as 'p1) -> float -> float -> (#Ocgtk_pango.Pango.layout as 'p2) -> int -> Ocgtk_pango.Pango.direction -> unit =
    fun context x y layout index direction ->
      let context = context#as_style_context in
      let layout = layout#as_layout in
      (Snapshot.render_insertion_cursor obj context x y layout index direction)

  method render_layout : 'p1 'p2. (#GStyle_context.style_context as 'p1) -> float -> float -> (#Ocgtk_pango.Pango.layout as 'p2) -> unit =
    fun context x y layout ->
      let context = context#as_style_context in
      let layout = layout#as_layout in
      (Snapshot.render_layout obj context x y layout)

  method restore : unit -> unit =
    fun () ->
      (Snapshot.restore obj)

  method rotate : float -> unit =
    fun angle ->
      (Snapshot.rotate obj angle)

  method rotate_3d : 'p1. float -> (#Ocgtk_graphene.Graphene.vec3 as 'p1) -> unit =
    fun angle axis ->
      let axis = axis#as_vec3 in
      (Snapshot.rotate_3d obj angle axis)

  method save : unit -> unit =
    fun () ->
      (Snapshot.save obj)

  method scale : float -> float -> unit =
    fun factor_x factor_y ->
      (Snapshot.scale obj factor_x factor_y)

  method scale_3d : float -> float -> float -> unit =
    fun factor_x factor_y factor_z ->
      (Snapshot.scale_3d obj factor_x factor_y factor_z)

  method to_node : unit -> Ocgtk_gsk.Gsk.render_node option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gsk.Gsk.render_node ret) (Snapshot.to_node obj)

  method to_paintable : 'p1. (#Ocgtk_graphene.Graphene.size as 'p1) option -> Ocgtk_gdk.Gdk.paintable option =
    fun size ->
      let size = Option.map (fun (c) -> c#as_size) size in
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.paintable ret) (Snapshot.to_paintable obj size)

  method transform : 'p1. (#Ocgtk_gsk.Gsk.transform as 'p1) option -> unit =
    fun transform ->
      let transform = Option.map (fun (c) -> c#as_transform) transform in
      (Snapshot.transform obj transform)

  method transform_matrix : 'p1. (#Ocgtk_graphene.Graphene.matrix as 'p1) -> unit =
    fun matrix ->
      let matrix = matrix#as_matrix in
      (Snapshot.transform_matrix obj matrix)

  method translate : 'p1. (#Ocgtk_graphene.Graphene.point as 'p1) -> unit =
    fun point ->
      let point = point#as_point in
      (Snapshot.translate obj point)

  method translate_3d : 'p1. (#Ocgtk_graphene.Graphene.point3_d as 'p1) -> unit =
    fun point ->
      let point = point#as_point3_d in
      (Snapshot.translate_3d obj point)

    method as_snapshot = obj
end

