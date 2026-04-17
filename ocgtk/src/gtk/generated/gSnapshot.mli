class type snapshot_t = object
  inherit Ocgtk_gdk.Gdk.Snapshot.snapshot_t

  method append_border :
    Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t ->
    float array ->
    Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array ->
    unit

  method append_cairo :
    Ocgtk_graphene.Graphene.Rect.rect_t -> Ocgtk_cairo.Cairo.Context.context_t

  method append_color :
    Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> Ocgtk_graphene.Graphene.Rect.rect_t -> unit

  method append_conic_gradient :
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    Ocgtk_graphene.Graphene.Point.point_t ->
    float ->
    Ocgtk_gsk.Gsk.Wrappers.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_fill :
    Ocgtk_gsk.Gsk.Path.path_t ->
    Ocgtk_gsk.Gsk.fillrule ->
    Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t ->
    unit

  method append_inset_shadow :
    Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t ->
    Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t ->
    float ->
    float ->
    float ->
    float ->
    unit

  method append_layout :
    Ocgtk_pango.Pango.Layout.layout_t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> unit

  method append_linear_gradient :
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    Ocgtk_graphene.Graphene.Point.point_t ->
    Ocgtk_graphene.Graphene.Point.point_t ->
    Ocgtk_gsk.Gsk.Wrappers.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_node : Ocgtk_gsk.Gsk.Render_node.render_node_t -> unit

  method append_outset_shadow :
    Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t ->
    Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t ->
    float ->
    float ->
    float ->
    float ->
    unit

  method append_radial_gradient :
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    Ocgtk_graphene.Graphene.Point.point_t ->
    float ->
    float ->
    float ->
    float ->
    Ocgtk_gsk.Gsk.Wrappers.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_repeating_linear_gradient :
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    Ocgtk_graphene.Graphene.Point.point_t ->
    Ocgtk_graphene.Graphene.Point.point_t ->
    Ocgtk_gsk.Gsk.Wrappers.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_repeating_radial_gradient :
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    Ocgtk_graphene.Graphene.Point.point_t ->
    float ->
    float ->
    float ->
    float ->
    Ocgtk_gsk.Gsk.Wrappers.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_scaled_texture :
    Ocgtk_gdk.Gdk.Texture.texture_t ->
    Ocgtk_gsk.Gsk.scalingfilter ->
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    unit

  method append_stroke :
    Ocgtk_gsk.Gsk.Path.path_t ->
    Ocgtk_gsk.Gsk.Stroke.stroke_t ->
    Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t ->
    unit

  method append_texture :
    Ocgtk_gdk.Gdk.Texture.texture_t ->
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    unit

  method gl_shader_pop_texture : unit -> unit
  method perspective : float -> unit
  method pop : unit -> unit
  method push_blend : Ocgtk_gsk.Gsk.blendmode -> unit
  method push_blur : float -> unit
  method push_clip : Ocgtk_graphene.Graphene.Rect.rect_t -> unit

  method push_color_matrix :
    Ocgtk_graphene.Graphene.Matrix.matrix_t ->
    Ocgtk_graphene.Graphene.Vec4.vec4_t ->
    unit

  method push_cross_fade : float -> unit
  method push_fill : Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.fillrule -> unit

  method push_gl_shader :
    Ocgtk_gsk.Gsk.Gl_shader.gl_shader_t ->
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    Glib_bytes.t ->
    unit

  method push_mask : Ocgtk_gsk.Gsk.maskmode -> unit
  method push_opacity : float -> unit

  method push_repeat :
    Ocgtk_graphene.Graphene.Rect.rect_t ->
    Ocgtk_graphene.Graphene.Rect.rect_t option ->
    unit

  method push_rounded_clip : Ocgtk_gsk.Gsk.Rounded_rect.rounded_rect_t -> unit
  method push_shadow : Ocgtk_gsk.Gsk.Wrappers.Shadow.t array -> Gsize.t -> unit

  method push_stroke :
    Ocgtk_gsk.Gsk.Path.path_t -> Ocgtk_gsk.Gsk.Stroke.stroke_t -> unit

  method render_background :
    GStyle_context.style_context_t -> float -> float -> float -> float -> unit

  method render_focus :
    GStyle_context.style_context_t -> float -> float -> float -> float -> unit

  method render_frame :
    GStyle_context.style_context_t -> float -> float -> float -> float -> unit

  method render_insertion_cursor :
    GStyle_context.style_context_t ->
    float ->
    float ->
    Ocgtk_pango.Pango.Layout.layout_t ->
    int ->
    Ocgtk_pango.Pango.direction ->
    unit

  method render_layout :
    GStyle_context.style_context_t ->
    float ->
    float ->
    Ocgtk_pango.Pango.Layout.layout_t ->
    unit

  method restore : unit -> unit
  method rotate : float -> unit
  method rotate_3d : float -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> unit
  method save : unit -> unit
  method scale : float -> float -> unit
  method scale_3d : float -> float -> float -> unit
  method to_node : unit -> Ocgtk_gsk.Gsk.Render_node.render_node_t option

  method to_paintable :
    Ocgtk_graphene.Graphene.Size.size_t option ->
    Ocgtk_gdk.Gdk.Paintable.paintable_t option

  method transform : Ocgtk_gsk.Gsk.Transform.transform_t option -> unit
  method transform_matrix : Ocgtk_graphene.Graphene.Matrix.matrix_t -> unit
  method translate : Ocgtk_graphene.Graphene.Point.point_t -> unit
  method translate_3d : Ocgtk_graphene.Graphene.Point3_d.point3_d_t -> unit
end

class snapshot : Snapshot.t -> snapshot_t

val new_ : unit -> snapshot_t
