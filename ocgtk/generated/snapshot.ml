class type snapshot_t = object
  inherit Ocgdk.Snapshot.snapshot_t

  (** {2:methods Methods} *)

  method append_border :
    Ocgsk.Rounded_rect.rounded_rect_t ->
    float array ->
    Ocgdk.Raw.Rgb_a.t array ->
    unit
  (** Appends a stroked border rectangle inside the given [outline].

      The four sides of the border can have different widths and colors. *)

  method append_cairo : Ocgraphene.Rect.rect_t -> Occairo.Context.context_t
  (** Creates a new [Gsk.CairoNode] and appends it to the current render node of
      [snapshot], without changing the current node. *)

  method append_color : Ocgdk.Rgb_a.rgb_a_t -> Ocgraphene.Rect.rect_t -> unit
  (** Creates a new render node drawing the [color] into the given [bounds] and
      appends it to the current render node of [snapshot].

      You should try to avoid calling this function if [color] is transparent.
  *)

  method append_conic_gradient :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Point.point_t ->
    float ->
    Ocgsk.Raw.Color_stop.t array ->
    Gsize.t ->
    unit
  (** Appends a conic gradient node with the given stops to [snapshot]. *)

  method append_fill :
    Ocgsk.Path.path_t -> Ocgsk.Enums.fillrule -> Ocgdk.Rgb_a.rgb_a_t -> unit
  (** A convenience method to fill a path with a color.

      See [Gtk.Snapshot.push_fill] if you need to fill a path with more complex
      content than a color. *)

  method append_inset_shadow :
    Ocgsk.Rounded_rect.rounded_rect_t ->
    Ocgdk.Rgb_a.rgb_a_t ->
    float ->
    float ->
    float ->
    float ->
    unit
  (** Appends an inset shadow into the box given by [outline]. *)

  method append_layout : Ocpango.Layout.layout_t -> Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Creates render nodes for rendering [layout] in the given foregound [color]
      and appends them to the current node of [snapshot] without changing the
      current node. The current theme's foreground color for a widget can be
      obtained with [Gtk.Widget.get_color].

      Note that if the layout does not produce any visible output, then nodes
      may not be added to the [snapshot]. *)

  method append_linear_gradient :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Point.point_t ->
    Ocgraphene.Point.point_t ->
    Ocgsk.Raw.Color_stop.t array ->
    Gsize.t ->
    unit
  (** Appends a linear gradient node with the given stops to [snapshot]. *)

  method append_node : Ocgsk.Render_node.render_node_t -> unit
  (** Appends [node] to the current render node of [snapshot], without changing
      the current node.

      If [snapshot] does not have a current node yet, [node] will become the
      initial node. *)

  method append_outset_shadow :
    Ocgsk.Rounded_rect.rounded_rect_t ->
    Ocgdk.Rgb_a.rgb_a_t ->
    float ->
    float ->
    float ->
    float ->
    unit
  (** Appends an outset shadow node around the box given by [outline]. *)

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
  (** Appends a radial gradient node with the given stops to [snapshot]. *)

  method append_repeating_linear_gradient :
    Ocgraphene.Rect.rect_t ->
    Ocgraphene.Point.point_t ->
    Ocgraphene.Point.point_t ->
    Ocgsk.Raw.Color_stop.t array ->
    Gsize.t ->
    unit
  (** Appends a repeating linear gradient node with the given stops to
      [snapshot]. *)

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
  (** Appends a repeating radial gradient node with the given stops to
      [snapshot]. *)

  method append_scaled_texture :
    Ocgdk.Texture.texture_t ->
    Ocgsk.Enums.scalingfilter ->
    Ocgraphene.Rect.rect_t ->
    unit
  (** Creates a new render node drawing the [texture] into the given [bounds]
      and appends it to the current render node of [snapshot].

      In contrast to [Gtk.Snapshot.append_texture], this function provides
      control about how the filter that is used when scaling. *)

  method append_stroke :
    Ocgsk.Path.path_t -> Ocgsk.Stroke.stroke_t -> Ocgdk.Rgb_a.rgb_a_t -> unit
  (** A convenience method to stroke a path with a color.

      See [Gtk.Snapshot.push_stroke] if you need to stroke a path with more
      complex content than a color. *)

  method append_texture :
    Ocgdk.Texture.texture_t -> Ocgraphene.Rect.rect_t -> unit
  (** Creates a new render node drawing the [texture] into the given [bounds]
      and appends it to the current render node of [snapshot].

      If the texture needs to be scaled to fill [bounds], linear filtering is
      used. See [Gtk.Snapshot.append_scaled_texture] if you need other
      filtering, such as nearest-neighbour. *)

  method gl_shader_pop_texture : unit -> unit
  (** Removes the top element from the stack of render nodes and adds it to the
      nearest [Gsk.GLShaderNode] below it.

      This must be called the same number of times as the number of textures is
      needed for the shader in [Gtk.Snapshot.push_gl_shader]. *)

  method perspective : float -> unit
  (** Applies a perspective projection transform.

      See [Gsk.Transform.perspective] for a discussion on the details. *)

  method pop : unit -> unit
  (** Removes the top element from the stack of render nodes, and appends it to
      the node underneath it. *)

  method push_blend : Ocgsk.Enums.blendmode -> unit
  (** Blends together two images with the given blend mode.

      Until the first call to [Gtk.Snapshot.pop], the bottom image for the blend
      operation will be recorded. After that call, the top image to be blended
      will be recorded until the second call to [Gtk.Snapshot.pop].

      Calling this function requires two subsequent calls to [Gtk.Snapshot.pop].
  *)

  method push_blur : float -> unit
  (** Blurs an image.

      The image is recorded until the next call to [Gtk.Snapshot.pop]. *)

  method push_clip : Ocgraphene.Rect.rect_t -> unit
  (** Clips an image to a rectangle.

      The image is recorded until the next call to [Gtk.Snapshot.pop]. *)

  method push_color_matrix :
    Ocgraphene.Matrix.matrix_t -> Ocgraphene.Vec4.vec4_t -> unit
  (** Modifies the colors of an image by applying an affine transformation in
      RGB space.

      In particular, the colors will be transformed by applying

      pixel = transpose(color_matrix) * pixel + color_offset

      for every pixel. The transformation operates on unpremultiplied colors,
      with color components ordered R, G, B, A.

      The image is recorded until the next call to [Gtk.Snapshot.pop]. *)

  method push_component_transfer :
    Ocgsk.Component_transfer.component_transfer_t ->
    Ocgsk.Component_transfer.component_transfer_t ->
    Ocgsk.Component_transfer.component_transfer_t ->
    Ocgsk.Component_transfer.component_transfer_t ->
    unit
  (** Modifies the colors of an image by applying a transfer function for each
      component.

      The transfer functions operate on unpremultiplied colors.

      The image is recorded until the next call to [Gtk.Snapshot.pop]. *)

  method push_cross_fade : float -> unit
  (** Snapshots a cross-fade operation between two images with the given
      [progress].

      Until the first call to [Gtk.Snapshot.pop], the start image will be
      snapshot. After that call, the end image will be recorded until the second
      call to [Gtk.Snapshot.pop].

      Calling this function requires two subsequent calls to [Gtk.Snapshot.pop].
  *)

  method push_fill : Ocgsk.Path.path_t -> Ocgsk.Enums.fillrule -> unit
  (** Fills the area given by [path] and [fill_rule] with an image and discards
      everything outside of it.

      The image is recorded until the next call to [Gtk.Snapshot.pop].

      If you want to fill the path with a color, [Gtk.Snapshot.append_fill] than
      rendering new ones, use [Gtk.Snapshot.append_fill] may be more convenient.
  *)

  method push_gl_shader :
    Ocgsk.Gl_shader.gl_shader_t ->
    Ocgraphene.Rect.rect_t ->
    Glib_bytes.t ->
    unit
  (** Push a [Gsk.GLShaderNode].

      The node uses the given [Gsk.GLShader] and uniform values Additionally
      this takes a list of [n_children] other nodes which will be passed to the
      [Gsk.GLShaderNode].

      The [take_args] argument is a block of data to use for uniform arguments,
      as per types and offsets defined by the [shader]. Normally this is
      generated by [Gsk.GLShader.format_args] or [Gsk.ShaderArgsBuilder].

      The snapshotter takes ownership of [take_args], so the caller should not
      free it after this.

      If the renderer doesn't support GL shaders, or if there is any problem
      when compiling the shader, then the node will draw pink. You should use
      [Gsk.GLShader.compile] to ensure the [shader] will work for the renderer
      before using it.

      If the shader requires textures (see [Gsk.GLShader.get_n_textures]), then
      it is expected that you call [Gtk.Snapshot.gl_shader_pop_texture] the
      number of times that are required. Each of these calls will generate a
      node that is added as a child to the [GskGLShaderNode], which in turn will
      render these offscreen and pass as a texture to the shader.

      Once all textures (if any) are pop:ed, you must call the regular
      [Gtk.Snapshot.pop].

      If you want to use pre-existing textures as input to the shader rather
      than rendering new ones, use [Gtk.Snapshot.append_texture] to push a
      texture node. These will be used directly rather than being re-rendered.

      For details on how to write shaders, see [Gsk.GLShader]. *)

  method push_mask : Ocgsk.Enums.maskmode -> unit
  (** Until the first call to [Gtk.Snapshot.pop], the mask image for the mask
      operation will be recorded.

      After that call, the source image will be recorded until the second call
      to [Gtk.Snapshot.pop].

      Calling this function requires 2 subsequent calls to gtk_snapshot_pop().
  *)

  method push_opacity : float -> unit
  (** Modifies the opacity of an image.

      The image is recorded until the next call to [Gtk.Snapshot.pop]. *)

  method push_repeat :
    Ocgraphene.Rect.rect_t -> Ocgraphene.Rect.rect_t option -> unit
  (** Creates a node that repeats the child node.

      The child is recorded until the next call to [Gtk.Snapshot.pop]. *)

  method push_rounded_clip : Ocgsk.Rounded_rect.rounded_rect_t -> unit
  (** Clips an image to a rounded rectangle.

      The image is recorded until the next call to [Gtk.Snapshot.pop]. *)

  method push_shadow : Ocgsk.Raw.Shadow.t array -> Gsize.t -> unit
  (** Applies a shadow to an image.

      The image is recorded until the next call to [Gtk.Snapshot.pop]. *)

  method push_stroke : Ocgsk.Path.path_t -> Ocgsk.Stroke.stroke_t -> unit
  (** Strokes the given [path] with the attributes given by [stroke] and an
      image.

      The image is recorded until the next call to [Gtk.Snapshot.pop].

      Note that the strokes are subject to the same transformation as everything
      else, so uneven scaling will cause horizontal and vertical strokes to have
      different widths.

      If you want to stroke the path with a color, [Gtk.Snapshot.append_stroke]
      may be more convenient. *)

  method render_background :
    Style_context.style_context_t -> float -> float -> float -> float -> unit
  (** Creates a render node for the CSS background according to [context], and
      appends it to the current node of [snapshot], without changing the current
      node. *)

  method render_focus :
    Style_context.style_context_t -> float -> float -> float -> float -> unit
  (** Creates a render node for the focus outline according to [context], and
      appends it to the current node of [snapshot], without changing the current
      node. *)

  method render_frame :
    Style_context.style_context_t -> float -> float -> float -> float -> unit
  (** Creates a render node for the CSS border according to [context], and
      appends it to the current node of [snapshot], without changing the current
      node. *)

  method render_insertion_cursor :
    Style_context.style_context_t ->
    float ->
    float ->
    Ocpango.Layout.layout_t ->
    int ->
    Ocpango.Enums.direction ->
    unit
  (** Draws a text caret using [snapshot] at the specified index of [layout]. *)

  method render_layout :
    Style_context.style_context_t ->
    float ->
    float ->
    Ocpango.Layout.layout_t ->
    unit
  (** Creates a render node for rendering [layout] according to the style
      information in [context], and appends it to the current node of
      [snapshot], without changing the current node. *)

  method restore : unit -> unit
  (** Restores [snapshot] to the state saved by a preceding call to
      [Snapshot.save] and removes that state from the stack of saved states. *)

  method rotate : float -> unit
  (** Rotates \@[snapshot]'s coordinate system by [angle] degrees in 2D space -
      or in 3D speak, rotates around the Z axis. The rotation happens around the
      origin point of (0, 0) in the [snapshot]'s current coordinate system.

      To rotate around axes other than the Z axis, use
      [Gsk.Transform.rotate_3d]. *)

  method rotate_3d : float -> Ocgraphene.Vec3.vec3_t -> unit
  (** Rotates [snapshot]'s coordinate system by [angle] degrees around [axis].

      For a rotation in 2D space, use [Gsk.Transform.rotate]. *)

  method save : unit -> unit
  (** Makes a copy of the current state of [snapshot] and saves it on an
      internal stack.

      When [Gtk.Snapshot.restore] is called, [snapshot] will be restored to the
      saved state.

      Multiple calls to [Gtk.Snapshot.save] and [Gtk.Snapshot.restore] can be
      nested; each call to [gtk_snapshot_restore()] restores the state from the
      matching paired [gtk_snapshot_save()].

      It is necessary to clear all saved states with corresponding calls to
      [gtk_snapshot_restore()]. *)

  method scale : float -> float -> unit
  (** Scales [snapshot]'s coordinate system in 2-dimensional space by the given
      factors.

      Use [Gtk.Snapshot.scale_3d] to scale in all 3 dimensions. *)

  method scale_3d : float -> float -> float -> unit
  (** Scales [snapshot]'s coordinate system by the given factors. *)

  method to_node : unit -> Ocgsk.Render_node.render_node_t option
  (** Returns the render node that was constructed by [snapshot].

      Note that this function may return [NULL] if nothing has been added to the
      snapshot or if its content does not produce pixels to be rendered.

      After calling this function, it is no longer possible to add more nodes to
      [snapshot]. The only function that should be called after this is
      [GObject.Object.unref]. *)

  method to_paintable :
    Ocgraphene.Size.size_t option -> Ocgdk.Paintable.paintable_t option
  (** Returns a paintable encapsulating the render node that was constructed by
      [snapshot].

      After calling this function, it is no longer possible to add more nodes to
      [snapshot]. The only function that should be called after this is
      [GObject.Object.unref]. *)

  method transform : Ocgsk.Transform.transform_t option -> unit
  (** Transforms [snapshot]'s coordinate system with the given [transform]. *)

  method transform_matrix : Ocgraphene.Matrix.matrix_t -> unit
  (** Transforms [snapshot]'s coordinate system with the given [matrix]. *)

  method translate : Ocgraphene.Point.point_t -> unit
  (** Translates [snapshot]'s coordinate system by [point] in 2-dimensional
      space. *)

  method translate_3d : Ocgraphene.Point3_d.point3_d_t -> unit
  (** Translates [snapshot]'s coordinate system by [point]. *)
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
