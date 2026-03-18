class snapshot : Snapshot.t ->
  object
    method append_border : #Ocgtk_gsk.Gsk.rounded_rect -> float array -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array -> unit
    method append_cairo : #Ocgtk_graphene.Graphene.rect -> Ocgtk_cairo.Cairo.context
    method append_color : #Ocgtk_gdk.Gdk.rgb_a -> #Ocgtk_graphene.Graphene.rect -> unit
    method append_fill : #Ocgtk_gsk.Gsk.path -> Ocgtk_gsk.Gsk.fillrule -> #Ocgtk_gdk.Gdk.rgb_a -> unit
    method append_inset_shadow : #Ocgtk_gsk.Gsk.rounded_rect -> #Ocgtk_gdk.Gdk.rgb_a -> float -> float -> float -> float -> unit
    method append_layout : #Ocgtk_pango.Pango.layout -> #Ocgtk_gdk.Gdk.rgb_a -> unit
    method append_node : #Ocgtk_gsk.Gsk.render_node -> unit
    method append_outset_shadow : #Ocgtk_gsk.Gsk.rounded_rect -> #Ocgtk_gdk.Gdk.rgb_a -> float -> float -> float -> float -> unit
    method append_scaled_texture : #Ocgtk_gdk.Gdk.texture -> Ocgtk_gsk.Gsk.scalingfilter -> #Ocgtk_graphene.Graphene.rect -> unit
    method append_stroke : #Ocgtk_gsk.Gsk.path -> #Ocgtk_gsk.Gsk.stroke -> #Ocgtk_gdk.Gdk.rgb_a -> unit
    method append_texture : #Ocgtk_gdk.Gdk.texture -> #Ocgtk_graphene.Graphene.rect -> unit
    method gl_shader_pop_texture : unit -> unit
    method perspective : float -> unit
    method pop : unit -> unit
    method push_blend : Ocgtk_gsk.Gsk.blendmode -> unit
    method push_blur : float -> unit
    method push_clip : #Ocgtk_graphene.Graphene.rect -> unit
    method push_color_matrix : #Ocgtk_graphene.Graphene.matrix -> #Ocgtk_graphene.Graphene.vec4 -> unit
    method push_cross_fade : float -> unit
    method push_fill : #Ocgtk_gsk.Gsk.path -> Ocgtk_gsk.Gsk.fillrule -> unit
    method push_mask : Ocgtk_gsk.Gsk.maskmode -> unit
    method push_opacity : float -> unit
    method push_repeat : #Ocgtk_graphene.Graphene.rect -> #Ocgtk_graphene.Graphene.rect option -> unit
    method push_rounded_clip : #Ocgtk_gsk.Gsk.rounded_rect -> unit
    method push_stroke : #Ocgtk_gsk.Gsk.path -> #Ocgtk_gsk.Gsk.stroke -> unit
    method render_background : #GStyle_context.style_context -> float -> float -> float -> float -> unit
    method render_focus : #GStyle_context.style_context -> float -> float -> float -> float -> unit
    method render_frame : #GStyle_context.style_context -> float -> float -> float -> float -> unit
    method render_insertion_cursor : #GStyle_context.style_context -> float -> float -> #Ocgtk_pango.Pango.layout -> int -> Ocgtk_pango.Pango.direction -> unit
    method render_layout : #GStyle_context.style_context -> float -> float -> #Ocgtk_pango.Pango.layout -> unit
    method restore : unit -> unit
    method rotate : float -> unit
    method rotate_3d : float -> #Ocgtk_graphene.Graphene.vec3 -> unit
    method save : unit -> unit
    method scale : float -> float -> unit
    method scale_3d : float -> float -> float -> unit
    method to_node : unit -> Ocgtk_gsk.Gsk.render_node option
    method to_paintable : #Ocgtk_graphene.Graphene.size option -> Ocgtk_gdk.Gdk.paintable option
    method transform : #Ocgtk_gsk.Gsk.transform option -> unit
    method transform_matrix : #Ocgtk_graphene.Graphene.matrix -> unit
    method translate : #Ocgtk_graphene.Graphene.point -> unit
    method translate_3d : #Ocgtk_graphene.Graphene.point3_d -> unit
    method as_snapshot : Snapshot.t
  end

