class type snapshot_t = object
  inherit Ocgdk.Snapshot.snapshot_t

  method append_border :
    Ocgsk.Rounded_rect.rounded_rect_t ->
    float array ->
    Ocgdk.Raw.Rgb_a.t array ->
    unit

  method append_cairo : Ocgraphene.Rect.rect_t -> Occairo.Context.context_t
  method append_color : Ocgdk.Rgb_a.rgb_a_t -> Ocgraphene.Rect.rect_t -> unit

  method append_conic_gradient :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Point.point_t ->
    float ->
    Ocgsk.Raw.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_fill :
    Ocgsk.Path.path_t -> Ocgsk.Enums.fillrule -> Ocgdk.Rgb_a.rgb_a_t -> unit

  method append_inset_shadow :
    Ocgsk.Rounded_rect.rounded_rect_t ->
    Ocgdk.Rgb_a.rgb_a_t ->
    float ->
    float ->
    float ->
    float ->
    unit

  method append_layout : Ocpango.Layout.layout_t -> Ocgdk.Rgb_a.rgb_a_t -> unit

  method append_linear_gradient :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Point.point_t ->
    Ocgraphene.Point.point_t ->
    Ocgsk.Raw.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_node : Ocgsk.Render_node.render_node_t -> unit

  method append_outset_shadow :
    Ocgsk.Rounded_rect.rounded_rect_t ->
    Ocgdk.Rgb_a.rgb_a_t ->
    float ->
    float ->
    float ->
    float ->
    unit

  method append_radial_gradient :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Point.point_t ->
    float ->
    float ->
    float ->
    float ->
    Ocgsk.Raw.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_repeating_linear_gradient :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Point.point_t ->
    Ocgraphene.Point.point_t ->
    Ocgsk.Raw.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_repeating_radial_gradient :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Point.point_t ->
    float ->
    float ->
    float ->
    float ->
    Ocgsk.Raw.Color_stop.t array ->
    Gsize.t ->
    unit

  method append_scaled_texture :
    Ocgdk.Texture.texture_t ->
    Ocgsk.Enums.scalingfilter ->
    Ocgraphene.Rect.rect_t ->
    unit

  method append_stroke :
    Ocgsk.Path.path_t -> Ocgsk.Stroke.stroke_t -> Ocgdk.Rgb_a.rgb_a_t -> unit

  method append_texture :
    Ocgdk.Texture.texture_t -> Ocgraphene.Rect.rect_t -> unit

  method gl_shader_pop_texture : unit -> unit
  method perspective : float -> unit
  method pop : unit -> unit
  method push_blend : Ocgsk.Enums.blendmode -> unit
  method push_blur : float -> unit
  method push_clip : Ocgraphene.Rect.rect_t -> unit

  method push_color_matrix :
    Ocgraphene.Matrix.matrix_t -> Ocgraphene.Vec4.vec4_t -> unit

  method push_component_transfer :
    Ocgsk.Component_transfer.component_transfer_t ->
    Ocgsk.Component_transfer.component_transfer_t ->
    Ocgsk.Component_transfer.component_transfer_t ->
    Ocgsk.Component_transfer.component_transfer_t ->
    unit

  method push_cross_fade : float -> unit
  method push_fill : Ocgsk.Path.path_t -> Ocgsk.Enums.fillrule -> unit

  method push_gl_shader :
    Ocgsk.Gl_shader.gl_shader_t ->
    Ocgraphene.Rect.rect_t ->
    Glib_bytes.t ->
    unit

  method push_mask : Ocgsk.Enums.maskmode -> unit
  method push_opacity : float -> unit

  method push_repeat :
    Ocgraphene.Rect.rect_t -> Ocgraphene.Rect.rect_t option -> unit

  method push_rounded_clip : Ocgsk.Rounded_rect.rounded_rect_t -> unit
  method push_shadow : Ocgsk.Raw.Shadow.t array -> Gsize.t -> unit
  method push_stroke : Ocgsk.Path.path_t -> Ocgsk.Stroke.stroke_t -> unit

  method render_background :
    Style_context.style_context_t -> float -> float -> float -> float -> unit

  method render_focus :
    Style_context.style_context_t -> float -> float -> float -> float -> unit

  method render_frame :
    Style_context.style_context_t -> float -> float -> float -> float -> unit

  method render_insertion_cursor :
    Style_context.style_context_t ->
    float ->
    float ->
    Ocpango.Layout.layout_t ->
    int ->
    Ocpango.Enums.direction ->
    unit

  method render_layout :
    Style_context.style_context_t ->
    float ->
    float ->
    Ocpango.Layout.layout_t ->
    unit

  method restore : unit -> unit
  method rotate : float -> unit
  method rotate_3d : float -> Ocgraphene.Vec3.vec3_t -> unit
  method save : unit -> unit
  method scale : float -> float -> unit
  method scale_3d : float -> float -> float -> unit
  method to_node : unit -> Ocgsk.Render_node.render_node_t option

  method to_paintable :
    Ocgraphene.Size.size_t option -> Ocgdk.Paintable.paintable_t option

  method transform : Ocgsk.Transform.transform_t option -> unit
  method transform_matrix : Ocgraphene.Matrix.matrix_t -> unit
  method translate : Ocgraphene.Point.point_t -> unit
  method translate_3d : Ocgraphene.Point3_d.point3_d_t -> unit
end

(* High-level class for Snapshot *)
class snapshot (obj : Raw.Snapshot.t) : snapshot_t =
  object (self)
    inherit Ocgdk.Snapshot.snapshot (obj :> Ocgdk.Raw.Snapshot.t)

    method append_border :
        Ocgsk.Rounded_rect.rounded_rect_t ->
        float array ->
        Ocgdk.Raw.Rgb_a.t array ->
        unit =
      fun outline border_width border_color ->
        let outline = outline#as_rounded_rect in
        Raw.Snapshot.append_border obj outline border_width border_color

    method append_cairo : Ocgraphene.Rect.rect_t -> Occairo.Context.context_t =
      fun bounds ->
        let bounds = bounds#as_rect in
        new Occairo.Context.context (Raw.Snapshot.append_cairo obj bounds)

    method append_color : Ocgdk.Rgb_a.rgb_a_t -> Ocgraphene.Rect.rect_t -> unit
        =
      fun color bounds ->
        let color = color#as_rgb_a in
        let bounds = bounds#as_rect in
        Raw.Snapshot.append_color obj color bounds

    method append_conic_gradient :
        Ocgraphene.Rect.rect_t ->
        Ocgraphene.Point.point_t ->
        float ->
        Ocgsk.Raw.Color_stop.t array ->
        Gsize.t ->
        unit =
      fun bounds center rotation stops n_stops ->
        let bounds = bounds#as_rect in
        let center = center#as_point in
        Raw.Snapshot.append_conic_gradient obj bounds center rotation stops
          n_stops

    method append_fill :
        Ocgsk.Path.path_t -> Ocgsk.Enums.fillrule -> Ocgdk.Rgb_a.rgb_a_t -> unit
        =
      fun path fill_rule color ->
        let path = path#as_path in
        let color = color#as_rgb_a in
        Raw.Snapshot.append_fill obj path fill_rule color

    method append_inset_shadow :
        Ocgsk.Rounded_rect.rounded_rect_t ->
        Ocgdk.Rgb_a.rgb_a_t ->
        float ->
        float ->
        float ->
        float ->
        unit =
      fun outline color dx dy spread blur_radius ->
        let outline = outline#as_rounded_rect in
        let color = color#as_rgb_a in
        Raw.Snapshot.append_inset_shadow obj outline color dx dy spread
          blur_radius

    method append_layout :
        Ocpango.Layout.layout_t -> Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun layout color ->
        let layout = layout#as_layout in
        let color = color#as_rgb_a in
        Raw.Snapshot.append_layout obj layout color

    method append_linear_gradient :
        Ocgraphene.Rect.rect_t ->
        Ocgraphene.Point.point_t ->
        Ocgraphene.Point.point_t ->
        Ocgsk.Raw.Color_stop.t array ->
        Gsize.t ->
        unit =
      fun bounds start_point end_point stops n_stops ->
        let bounds = bounds#as_rect in
        let start_point = start_point#as_point in
        let end_point = end_point#as_point in
        Raw.Snapshot.append_linear_gradient obj bounds start_point end_point
          stops n_stops

    method append_node : Ocgsk.Render_node.render_node_t -> unit =
      fun node ->
        let node = node#as_render_node in
        Raw.Snapshot.append_node obj node

    method append_outset_shadow :
        Ocgsk.Rounded_rect.rounded_rect_t ->
        Ocgdk.Rgb_a.rgb_a_t ->
        float ->
        float ->
        float ->
        float ->
        unit =
      fun outline color dx dy spread blur_radius ->
        let outline = outline#as_rounded_rect in
        let color = color#as_rgb_a in
        Raw.Snapshot.append_outset_shadow obj outline color dx dy spread
          blur_radius

    method append_radial_gradient :
        Ocgraphene.Rect.rect_t ->
        Ocgraphene.Point.point_t ->
        float ->
        float ->
        float ->
        float ->
        Ocgsk.Raw.Color_stop.t array ->
        Gsize.t ->
        unit =
      fun bounds center hradius vradius start end_ stops n_stops ->
        let bounds = bounds#as_rect in
        let center = center#as_point in
        Raw.Snapshot.append_radial_gradient obj bounds center hradius vradius
          start end_ stops n_stops

    method append_repeating_linear_gradient :
        Ocgraphene.Rect.rect_t ->
        Ocgraphene.Point.point_t ->
        Ocgraphene.Point.point_t ->
        Ocgsk.Raw.Color_stop.t array ->
        Gsize.t ->
        unit =
      fun bounds start_point end_point stops n_stops ->
        let bounds = bounds#as_rect in
        let start_point = start_point#as_point in
        let end_point = end_point#as_point in
        Raw.Snapshot.append_repeating_linear_gradient obj bounds start_point
          end_point stops n_stops

    method append_repeating_radial_gradient :
        Ocgraphene.Rect.rect_t ->
        Ocgraphene.Point.point_t ->
        float ->
        float ->
        float ->
        float ->
        Ocgsk.Raw.Color_stop.t array ->
        Gsize.t ->
        unit =
      fun bounds center hradius vradius start end_ stops n_stops ->
        let bounds = bounds#as_rect in
        let center = center#as_point in
        Raw.Snapshot.append_repeating_radial_gradient obj bounds center hradius
          vradius start end_ stops n_stops

    method append_scaled_texture :
        Ocgdk.Texture.texture_t ->
        Ocgsk.Enums.scalingfilter ->
        Ocgraphene.Rect.rect_t ->
        unit =
      fun texture filter bounds ->
        let texture = texture#as_texture in
        let bounds = bounds#as_rect in
        Raw.Snapshot.append_scaled_texture obj texture filter bounds

    method append_stroke :
        Ocgsk.Path.path_t ->
        Ocgsk.Stroke.stroke_t ->
        Ocgdk.Rgb_a.rgb_a_t ->
        unit =
      fun path stroke color ->
        let path = path#as_path in
        let stroke = stroke#as_stroke in
        let color = color#as_rgb_a in
        Raw.Snapshot.append_stroke obj path stroke color

    method append_texture :
        Ocgdk.Texture.texture_t -> Ocgraphene.Rect.rect_t -> unit =
      fun texture bounds ->
        let texture = texture#as_texture in
        let bounds = bounds#as_rect in
        Raw.Snapshot.append_texture obj texture bounds

    method gl_shader_pop_texture : unit -> unit =
      fun () -> Raw.Snapshot.gl_shader_pop_texture obj

    method perspective : float -> unit =
      fun depth -> Raw.Snapshot.perspective obj depth

    method pop : unit -> unit = fun () -> Raw.Snapshot.pop obj

    method push_blend : Ocgsk.Enums.blendmode -> unit =
      fun blend_mode -> Raw.Snapshot.push_blend obj blend_mode

    method push_blur : float -> unit =
      fun radius -> Raw.Snapshot.push_blur obj radius

    method push_clip : Ocgraphene.Rect.rect_t -> unit =
      fun bounds ->
        let bounds = bounds#as_rect in
        Raw.Snapshot.push_clip obj bounds

    method push_color_matrix :
        Ocgraphene.Matrix.matrix_t -> Ocgraphene.Vec4.vec4_t -> unit =
      fun color_matrix color_offset ->
        let color_matrix = color_matrix#as_matrix in
        let color_offset = color_offset#as_vec4 in
        Raw.Snapshot.push_color_matrix obj color_matrix color_offset

    method push_component_transfer :
        Ocgsk.Component_transfer.component_transfer_t ->
        Ocgsk.Component_transfer.component_transfer_t ->
        Ocgsk.Component_transfer.component_transfer_t ->
        Ocgsk.Component_transfer.component_transfer_t ->
        unit =
      fun red green blue alpha ->
        let red = red#as_component_transfer in
        let green = green#as_component_transfer in
        let blue = blue#as_component_transfer in
        let alpha = alpha#as_component_transfer in
        Raw.Snapshot.push_component_transfer obj red green blue alpha

    method push_cross_fade : float -> unit =
      fun progress -> Raw.Snapshot.push_cross_fade obj progress

    method push_fill : Ocgsk.Path.path_t -> Ocgsk.Enums.fillrule -> unit =
      fun path fill_rule ->
        let path = path#as_path in
        Raw.Snapshot.push_fill obj path fill_rule

    method push_gl_shader :
        Ocgsk.Gl_shader.gl_shader_t ->
        Ocgraphene.Rect.rect_t ->
        Glib_bytes.t ->
        unit =
      fun shader bounds take_args ->
        let shader = shader#as_gl_shader in
        let bounds = bounds#as_rect in
        Raw.Snapshot.push_gl_shader obj shader bounds take_args

    method push_mask : Ocgsk.Enums.maskmode -> unit =
      fun mask_mode -> Raw.Snapshot.push_mask obj mask_mode

    method push_opacity : float -> unit =
      fun opacity -> Raw.Snapshot.push_opacity obj opacity

    method push_repeat :
        Ocgraphene.Rect.rect_t -> Ocgraphene.Rect.rect_t option -> unit =
      fun bounds child_bounds ->
        let bounds = bounds#as_rect in
        let child_bounds = Option.map (fun c -> c#as_rect) child_bounds in
        Raw.Snapshot.push_repeat obj bounds child_bounds

    method push_rounded_clip : Ocgsk.Rounded_rect.rounded_rect_t -> unit =
      fun bounds ->
        let bounds = bounds#as_rounded_rect in
        Raw.Snapshot.push_rounded_clip obj bounds

    method push_shadow : Ocgsk.Raw.Shadow.t array -> Gsize.t -> unit =
      fun shadow n_shadows -> Raw.Snapshot.push_shadow obj shadow n_shadows

    method push_stroke : Ocgsk.Path.path_t -> Ocgsk.Stroke.stroke_t -> unit =
      fun path stroke ->
        let path = path#as_path in
        let stroke = stroke#as_stroke in
        Raw.Snapshot.push_stroke obj path stroke

    method render_background :
        Style_context.style_context_t ->
        float ->
        float ->
        float ->
        float ->
        unit =
      fun context x y width height ->
        let context = context#as_style_context in
        Raw.Snapshot.render_background obj context x y width height

    method render_focus :
        Style_context.style_context_t ->
        float ->
        float ->
        float ->
        float ->
        unit =
      fun context x y width height ->
        let context = context#as_style_context in
        Raw.Snapshot.render_focus obj context x y width height

    method render_frame :
        Style_context.style_context_t ->
        float ->
        float ->
        float ->
        float ->
        unit =
      fun context x y width height ->
        let context = context#as_style_context in
        Raw.Snapshot.render_frame obj context x y width height

    method render_insertion_cursor :
        Style_context.style_context_t ->
        float ->
        float ->
        Ocpango.Layout.layout_t ->
        int ->
        Ocpango.Enums.direction ->
        unit =
      fun context x y layout index direction ->
        let context = context#as_style_context in
        let layout = layout#as_layout in
        Raw.Snapshot.render_insertion_cursor obj context x y layout index
          direction

    method render_layout :
        Style_context.style_context_t ->
        float ->
        float ->
        Ocpango.Layout.layout_t ->
        unit =
      fun context x y layout ->
        let context = context#as_style_context in
        let layout = layout#as_layout in
        Raw.Snapshot.render_layout obj context x y layout

    method restore : unit -> unit = fun () -> Raw.Snapshot.restore obj
    method rotate : float -> unit = fun angle -> Raw.Snapshot.rotate obj angle

    method rotate_3d : float -> Ocgraphene.Vec3.vec3_t -> unit =
      fun angle axis ->
        let axis = axis#as_vec3 in
        Raw.Snapshot.rotate_3d obj angle axis

    method save : unit -> unit = fun () -> Raw.Snapshot.save obj

    method scale : float -> float -> unit =
      fun factor_x factor_y -> Raw.Snapshot.scale obj factor_x factor_y

    method scale_3d : float -> float -> float -> unit =
      fun factor_x factor_y factor_z ->
        Raw.Snapshot.scale_3d obj factor_x factor_y factor_z

    method to_node : unit -> Ocgsk.Render_node.render_node_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgsk.Render_node.render_node ret)
          (Raw.Snapshot.to_node obj)

    method to_paintable :
        Ocgraphene.Size.size_t option -> Ocgdk.Paintable.paintable_t option =
      fun size ->
        let size = Option.map (fun c -> c#as_size) size in
        Option.map
          (fun ret -> new Ocgdk.Paintable.paintable ret)
          (Raw.Snapshot.to_paintable obj size)

    method transform : Ocgsk.Transform.transform_t option -> unit =
      fun transform ->
        let transform = Option.map (fun c -> c#as_transform) transform in
        Raw.Snapshot.transform obj transform

    method transform_matrix : Ocgraphene.Matrix.matrix_t -> unit =
      fun matrix ->
        let matrix = matrix#as_matrix in
        Raw.Snapshot.transform_matrix obj matrix

    method translate : Ocgraphene.Point.point_t -> unit =
      fun point ->
        let point = point#as_point in
        Raw.Snapshot.translate obj point

    method translate_3d : Ocgraphene.Point3_d.point3_d_t -> unit =
      fun point ->
        let point = point#as_point3_d in
        Raw.Snapshot.translate_3d obj point
  end

let new_ () : snapshot_t = new snapshot (Raw.Snapshot.new_ ())
