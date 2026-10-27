(** Assists in creating [Gsk.RenderNode]s for widgets.

    It functions in a similar way to a cairo context, and maintains a stack of
    render nodes and their associated transformations.

    The node at the top of the stack is the one that [gtk_snapshot_append_…()]
    functions operate on. Use the [gtk_snapshot_push_…()] functions and
    [Snapshot.pop] to change the current node.

    The typical way to obtain a [GtkSnapshot] object is as an argument to the
    [Gtk.Widget.snapshot] vfunc. If you need to create your own [GtkSnapshot],
    use [Gtk.Snapshot.new].

    Its methods, signals and properties are on {!class-type-snapshot_t}. The
    functions it is built on are in {!Ocgtk.Raw.Snapshot}. *)

(** The methods, signals and properties of a [GtkSnapshot]. *)
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

class snapshot : Raw.Snapshot.t -> snapshot_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Snapshot.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSnapshot], give one already wrapped. *)

val new_ : unit -> snapshot_t
