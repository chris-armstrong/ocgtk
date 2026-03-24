class type snapshot_t = object
    inherit Ocgtk_gdk.Gdk.Snapshot.snapshot_t
    method append_border : Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t -> float array -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array -> unit
    method append_cairo : Ocgtk_graphene.Graphene.Rect.rect_t -> Ocgtk_cairo.Cairo.Context.context_t
    method append_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> Ocgtk_graphene.Graphene.Rect.rect_t -> unit
    method append_fill : Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.fillrule -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
    method append_inset_shadow : Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> float -> float -> float -> float -> unit
    method append_layout : Ocgtk_pango.Pango.Layout.layout_t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
    method append_node : Ocgtk_gsk.Gsk.Render_node.render_node_t -> unit
    method append_outset_shadow : Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> float -> float -> float -> float -> unit
    method append_scaled_texture : Ocgtk_gdk.Gdk.Texture.texture_t -> Ocgtk_gsk.Gsk.scalingfilter -> Ocgtk_graphene.Graphene.Rect.rect_t -> unit
    method append_stroke : Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.Stroke.stroke_t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit
    method append_texture : Ocgtk_gdk.Gdk.Texture.texture_t -> Ocgtk_graphene.Graphene.Rect.rect_t -> unit
    method gl_shader_pop_texture : unit -> unit
    method perspective : float -> unit
    method pop : unit -> unit
    method push_blend : Ocgtk_gsk.Gsk.blendmode -> unit
    method push_blur : float -> unit
    method push_clip : Ocgtk_graphene.Graphene.Rect.rect_t -> unit
    method push_color_matrix : Ocgtk_graphene.Graphene.Matrix.matrix_t -> Ocgtk_graphene.Graphene.Vec4.vec4_t -> unit
    method push_cross_fade : float -> unit
    method push_fill : Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.fillrule -> unit
    method push_mask : Ocgtk_gsk.Gsk.maskmode -> unit
    method push_opacity : float -> unit
    method push_repeat : Ocgtk_graphene.Graphene.Rect.rect_t -> Ocgtk_graphene.Graphene.Rect.rect_t option -> unit
    method push_rounded_clip : Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t -> unit
    method push_stroke : Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.Stroke.stroke_t -> unit
    method render_background : GStyle_context.style_context_t -> float -> float -> float -> float -> unit
    method render_focus : GStyle_context.style_context_t -> float -> float -> float -> float -> unit
    method render_frame : GStyle_context.style_context_t -> float -> float -> float -> float -> unit
    method render_insertion_cursor : GStyle_context.style_context_t -> float -> float -> Ocgtk_pango.Pango.Layout.layout_t -> int -> Ocgtk_pango.Pango.direction -> unit
    method render_layout : GStyle_context.style_context_t -> float -> float -> Ocgtk_pango.Pango.Layout.layout_t -> unit
    method restore : unit -> unit
    method rotate : float -> unit
    method rotate_3d : float -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> unit
    method save : unit -> unit
    method scale : float -> float -> unit
    method scale_3d : float -> float -> float -> unit
    method to_node : unit -> Ocgtk_gsk.Gsk.Render_node.render_node_t option
    method to_paintable : Ocgtk_graphene.Graphene.Size.size_t option -> Ocgtk_gdk.Gdk.Paintable.paintable_t option
    method transform : Ocgtk_gsk.Gsk.Transform.transform_t option -> unit
    method transform_matrix : Ocgtk_graphene.Graphene.Matrix.matrix_t -> unit
    method translate : Ocgtk_graphene.Graphene.Point.point_t -> unit
    method translate_3d : Ocgtk_graphene.Graphene.Point3_d.point3_d_t -> unit
end

(* High-level class for Snapshot *)
class snapshot (obj : Snapshot.t) : snapshot_t = object (self)
  inherit Ocgtk_gdk.Gdk.Snapshot.snapshot (obj :> Ocgtk_gdk.Gdk.Wrappers.Snapshot.t)

  method append_border : Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t -> float array -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array -> unit =
    fun outline border_width border_color ->
      let outline = outline#as_rounded_rect in
      (Snapshot.append_border obj outline border_width border_color)

  method append_cairo : Ocgtk_graphene.Graphene.Rect.rect_t -> Ocgtk_cairo.Cairo.Context.context_t =
    fun bounds ->
      let bounds = bounds#as_rect in
      new  Ocgtk_cairo.Cairo.Context.context(Snapshot.append_cairo obj bounds)

  method append_color : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> Ocgtk_graphene.Graphene.Rect.rect_t -> unit =
    fun color bounds ->
      let color = color#as_rgb_a in
      let bounds = bounds#as_rect in
      (Snapshot.append_color obj color bounds)

  method append_fill : Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.fillrule -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
    fun path fill_rule color ->
      let path = path#as_path in
      let color = color#as_rgb_a in
      (Snapshot.append_fill obj path fill_rule color)

  method append_inset_shadow : Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> float -> float -> float -> float -> unit =
    fun outline color dx dy spread blur_radius ->
      let outline = outline#as_rounded_rect in
      let color = color#as_rgb_a in
      (Snapshot.append_inset_shadow obj outline color dx dy spread blur_radius)

  method append_layout : Ocgtk_pango.Pango.Layout.layout_t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
    fun layout color ->
      let layout = layout#as_layout in
      let color = color#as_rgb_a in
      (Snapshot.append_layout obj layout color)

  method append_node : Ocgtk_gsk.Gsk.Render_node.render_node_t -> unit =
    fun node ->
      let node = node#as_render_node in
      (Snapshot.append_node obj node)

  method append_outset_shadow : Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> float -> float -> float -> float -> unit =
    fun outline color dx dy spread blur_radius ->
      let outline = outline#as_rounded_rect in
      let color = color#as_rgb_a in
      (Snapshot.append_outset_shadow obj outline color dx dy spread blur_radius)

  method append_scaled_texture : Ocgtk_gdk.Gdk.Texture.texture_t -> Ocgtk_gsk.Gsk.scalingfilter -> Ocgtk_graphene.Graphene.Rect.rect_t -> unit =
    fun texture filter bounds ->
      let texture = texture#as_texture in
      let bounds = bounds#as_rect in
      (Snapshot.append_scaled_texture obj texture filter bounds)

  method append_stroke : Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.Stroke.stroke_t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit =
    fun path stroke color ->
      let path = path#as_path in
      let stroke = stroke#as_stroke in
      let color = color#as_rgb_a in
      (Snapshot.append_stroke obj path stroke color)

  method append_texture : Ocgtk_gdk.Gdk.Texture.texture_t -> Ocgtk_graphene.Graphene.Rect.rect_t -> unit =
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

  method push_clip : Ocgtk_graphene.Graphene.Rect.rect_t -> unit =
    fun bounds ->
      let bounds = bounds#as_rect in
      (Snapshot.push_clip obj bounds)

  method push_color_matrix : Ocgtk_graphene.Graphene.Matrix.matrix_t -> Ocgtk_graphene.Graphene.Vec4.vec4_t -> unit =
    fun color_matrix color_offset ->
      let color_matrix = color_matrix#as_matrix in
      let color_offset = color_offset#as_vec4 in
      (Snapshot.push_color_matrix obj color_matrix color_offset)

  method push_cross_fade : float -> unit =
    fun progress ->
      (Snapshot.push_cross_fade obj progress)

  method push_fill : Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.fillrule -> unit =
    fun path fill_rule ->
      let path = path#as_path in
      (Snapshot.push_fill obj path fill_rule)

  method push_mask : Ocgtk_gsk.Gsk.maskmode -> unit =
    fun mask_mode ->
      (Snapshot.push_mask obj mask_mode)

  method push_opacity : float -> unit =
    fun opacity ->
      (Snapshot.push_opacity obj opacity)

  method push_repeat : Ocgtk_graphene.Graphene.Rect.rect_t -> Ocgtk_graphene.Graphene.Rect.rect_t option -> unit =
    fun bounds child_bounds ->
      let bounds = bounds#as_rect in
      let child_bounds = Option.map (fun (c) -> c#as_rect) child_bounds in
      (Snapshot.push_repeat obj bounds child_bounds)

  method push_rounded_clip : Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t -> unit =
    fun bounds ->
      let bounds = bounds#as_rounded_rect in
      (Snapshot.push_rounded_clip obj bounds)

  method push_stroke : Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.Stroke.stroke_t -> unit =
    fun path stroke ->
      let path = path#as_path in
      let stroke = stroke#as_stroke in
      (Snapshot.push_stroke obj path stroke)

  method render_background : GStyle_context.style_context_t -> float -> float -> float -> float -> unit =
    fun context x y width height ->
      let context = context#as_style_context in
      (Snapshot.render_background obj context x y width height)

  method render_focus : GStyle_context.style_context_t -> float -> float -> float -> float -> unit =
    fun context x y width height ->
      let context = context#as_style_context in
      (Snapshot.render_focus obj context x y width height)

  method render_frame : GStyle_context.style_context_t -> float -> float -> float -> float -> unit =
    fun context x y width height ->
      let context = context#as_style_context in
      (Snapshot.render_frame obj context x y width height)

  method render_insertion_cursor : GStyle_context.style_context_t -> float -> float -> Ocgtk_pango.Pango.Layout.layout_t -> int -> Ocgtk_pango.Pango.direction -> unit =
    fun context x y layout index direction ->
      let context = context#as_style_context in
      let layout = layout#as_layout in
      (Snapshot.render_insertion_cursor obj context x y layout index direction)

  method render_layout : GStyle_context.style_context_t -> float -> float -> Ocgtk_pango.Pango.Layout.layout_t -> unit =
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

  method rotate_3d : float -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> unit =
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

  method to_node : unit -> Ocgtk_gsk.Gsk.Render_node.render_node_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gsk.Gsk.Render_node.render_node ret) (Snapshot.to_node obj)

  method to_paintable : Ocgtk_graphene.Graphene.Size.size_t option -> Ocgtk_gdk.Gdk.Paintable.paintable_t option =
    fun size ->
      let size = Option.map (fun (c) -> c#as_size) size in
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Paintable.paintable ret) (Snapshot.to_paintable obj size)

  method transform : Ocgtk_gsk.Gsk.Transform.transform_t option -> unit =
    fun transform ->
      let transform = Option.map (fun (c) -> c#as_transform) transform in
      (Snapshot.transform obj transform)

  method transform_matrix : Ocgtk_graphene.Graphene.Matrix.matrix_t -> unit =
    fun matrix ->
      let matrix = matrix#as_matrix in
      (Snapshot.transform_matrix obj matrix)

  method translate : Ocgtk_graphene.Graphene.Point.point_t -> unit =
    fun point ->
      let point = point#as_point in
      (Snapshot.translate obj point)

  method translate_3d : Ocgtk_graphene.Graphene.Point3_d.point3_d_t -> unit =
    fun point ->
      let point = point#as_point3_d in
      (Snapshot.translate_3d obj point)

end

let new_ () : snapshot_t =
  new snapshot (Snapshot.new_ ())

