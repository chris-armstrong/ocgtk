(* GENERATED CODE - DO NOT EDIT *)
(* Snapshot: Snapshot *)

type t = [`snapshot | `object_] Gobject.obj

(** Create a new Snapshot *)
external new_ : unit -> t = "ml_gtk_snapshot_new"

(* Methods *)
(** Translates @snapshot's coordinate system by @point. *)
external translate_3d : t -> Ocgtk_graphene.Graphene.Wrappers.Point3_d.t -> unit = "ml_gtk_snapshot_translate_3d"

(** Translates @snapshot's coordinate system by @point in 2-dimensional space. *)
external translate : t -> Ocgtk_graphene.Graphene.Wrappers.Point.t -> unit = "ml_gtk_snapshot_translate"

(** Transforms @snapshot's coordinate system with the given @matrix. *)
external transform_matrix : t -> Ocgtk_graphene.Graphene.Wrappers.Matrix.t -> unit = "ml_gtk_snapshot_transform_matrix"

(** Transforms @snapshot's coordinate system with the given @transform. *)
external transform : t -> Ocgtk_gsk.Gsk.Wrappers.Transform.t option -> unit = "ml_gtk_snapshot_transform"

(** Returns a paintable encapsulating the render node
that was constructed by @snapshot.

After calling this function, it is no longer possible to
add more nodes to @snapshot. The only function that should
be called after this is [method@GObject.Object.unref]. *)
external to_paintable : t -> Ocgtk_graphene.Graphene.Wrappers.Size.t option -> Ocgtk_gdk.Gdk.Wrappers.Paintable.t option = "ml_gtk_snapshot_to_paintable"

(** Returns the render node that was constructed
by @snapshot.

Note that this function may return %NULL if nothing has been
added to the snapshot or if its content does not produce pixels
to be rendered.

After calling this function, it is no longer possible to
add more nodes to @snapshot. The only function that should
be called after this is [method@GObject.Object.unref]. *)
external to_node : t -> Ocgtk_gsk.Gsk.Wrappers.Render_node.t option = "ml_gtk_snapshot_to_node"

(** Scales @snapshot's coordinate system by the given factors. *)
external scale_3d : t -> float -> float -> float -> unit = "ml_gtk_snapshot_scale_3d"

(** Scales @snapshot's coordinate system in 2-dimensional space by
the given factors.

Use [method@Gtk.Snapshot.scale_3d] to scale in all 3 dimensions. *)
external scale : t -> float -> float -> unit = "ml_gtk_snapshot_scale"

(** Makes a copy of the current state of @snapshot and saves it
on an internal stack.

When [method@Gtk.Snapshot.restore] is called, @snapshot will
be restored to the saved state.

Multiple calls to [method@Gtk.Snapshot.save] and [method@Gtk.Snapshot.restore]
can be nested; each call to `gtk_snapshot_restore()` restores the state from
the matching paired `gtk_snapshot_save()`.

It is necessary to clear all saved states with corresponding
calls to `gtk_snapshot_restore()`. *)
external save : t -> unit = "ml_gtk_snapshot_save"

(** Rotates @snapshot's coordinate system by @angle degrees around @axis.

For a rotation in 2D space, use [method@Gsk.Transform.rotate]. *)
external rotate_3d : t -> float -> Ocgtk_graphene.Graphene.Wrappers.Vec3.t -> unit = "ml_gtk_snapshot_rotate_3d"

(** Rotates @@snapshot's coordinate system by @angle degrees in 2D space -
or in 3D speak, rotates around the Z axis. The rotation happens around
the origin point of (0, 0) in the @snapshot's current coordinate system.

To rotate around axes other than the Z axis, use [method@Gsk.Transform.rotate_3d]. *)
external rotate : t -> float -> unit = "ml_gtk_snapshot_rotate"

(** Restores @snapshot to the state saved by a preceding call to
[method@Snapshot.save] and removes that state from the stack of
saved states. *)
external restore : t -> unit = "ml_gtk_snapshot_restore"

(** Creates a render node for rendering @layout according to the style
information in @context, and appends it to the current node of @snapshot,
without changing the current node. *)
external render_layout : t -> Style_context.t -> float -> float -> Ocgtk_pango.Pango.Wrappers.Layout.t -> unit = "ml_gtk_snapshot_render_layout"

(** Draws a text caret using @snapshot at the specified index of @layout. *)
external render_insertion_cursor : t -> Style_context.t -> float -> float -> Ocgtk_pango.Pango.Wrappers.Layout.t -> int -> Ocgtk_pango.Pango.direction -> unit = "ml_gtk_snapshot_render_insertion_cursor_bytecode" "ml_gtk_snapshot_render_insertion_cursor_native"

(** Creates a render node for the CSS border according to @context,
and appends it to the current node of @snapshot, without changing
the current node. *)
external render_frame : t -> Style_context.t -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_render_frame_bytecode" "ml_gtk_snapshot_render_frame_native"

(** Creates a render node for the focus outline according to @context,
and appends it to the current node of @snapshot, without changing
the current node. *)
external render_focus : t -> Style_context.t -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_render_focus_bytecode" "ml_gtk_snapshot_render_focus_native"

(** Creates a render node for the CSS background according to @context,
and appends it to the current node of @snapshot, without changing
the current node. *)
external render_background : t -> Style_context.t -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_render_background_bytecode" "ml_gtk_snapshot_render_background_native"

(** Strokes the given @path with the attributes given by @stroke and
an image.

The image is recorded until the next call to [method@Gtk.Snapshot.pop].

Note that the strokes are subject to the same transformation as
everything else, so uneven scaling will cause horizontal and vertical
strokes to have different widths.

If you want to stroke the path with a color, [method@Gtk.Snapshot.append_stroke]
may be more convenient. *)
external push_stroke : t -> Ocgtk_gsk.Gsk.Wrappers.Path.t -> Ocgtk_gsk.Gsk.Wrappers.Stroke.t -> unit = "ml_gtk_snapshot_push_stroke"

(** Clips an image to a rounded rectangle.

The image is recorded until the next call to [method@Gtk.Snapshot.pop]. *)
external push_rounded_clip : t -> Ocgtk_gsk.Gsk.Wrappers.Rounded_rect.t -> unit = "ml_gtk_snapshot_push_rounded_clip"

(** Creates a node that repeats the child node.

The child is recorded until the next call to [method@Gtk.Snapshot.pop]. *)
external push_repeat : t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t option -> unit = "ml_gtk_snapshot_push_repeat"

(** Modifies the opacity of an image.

The image is recorded until the next call to [method@Gtk.Snapshot.pop]. *)
external push_opacity : t -> float -> unit = "ml_gtk_snapshot_push_opacity"

(** Until the first call to [method@Gtk.Snapshot.pop], the
mask image for the mask operation will be recorded.

After that call, the source image will be recorded until
the second call to [method@Gtk.Snapshot.pop].

Calling this function requires 2 subsequent calls to gtk_snapshot_pop(). *)
external push_mask : t -> Ocgtk_gsk.Gsk.maskmode -> unit = "ml_gtk_snapshot_push_mask"

(** Fills the area given by @path and @fill_rule with an image and discards everything
outside of it.

The image is recorded until the next call to [method@Gtk.Snapshot.pop].

If you want to fill the path with a color, [method@Gtk.Snapshot.append_fill]
may be more convenient. *)
external push_fill : t -> Ocgtk_gsk.Gsk.Wrappers.Path.t -> Ocgtk_gsk.Gsk.fillrule -> unit = "ml_gtk_snapshot_push_fill"

(** Snapshots a cross-fade operation between two images with the
given @progress.

Until the first call to [method@Gtk.Snapshot.pop], the start image
will be snapshot. After that call, the end image will be recorded
until the second call to [method@Gtk.Snapshot.pop].

Calling this function requires two subsequent calls
to [method@Gtk.Snapshot.pop]. *)
external push_cross_fade : t -> float -> unit = "ml_gtk_snapshot_push_cross_fade"

(** Modifies the colors of an image by applying an affine transformation
in RGB space.

In particular, the colors will be transformed by applying

    pixel = transpose(color_matrix) * pixel + color_offset

for every pixel. The transformation operates on unpremultiplied
colors, with color components ordered R, G, B, A.

The image is recorded until the next call to [method@Gtk.Snapshot.pop]. *)
external push_color_matrix : t -> Ocgtk_graphene.Graphene.Wrappers.Matrix.t -> Ocgtk_graphene.Graphene.Wrappers.Vec4.t -> unit = "ml_gtk_snapshot_push_color_matrix"

(** Clips an image to a rectangle.

The image is recorded until the next call to [method@Gtk.Snapshot.pop]. *)
external push_clip : t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> unit = "ml_gtk_snapshot_push_clip"

(** Blurs an image.

The image is recorded until the next call to [method@Gtk.Snapshot.pop]. *)
external push_blur : t -> float -> unit = "ml_gtk_snapshot_push_blur"

(** Blends together two images with the given blend mode.

Until the first call to [method@Gtk.Snapshot.pop], the
bottom image for the blend operation will be recorded.
After that call, the top image to be blended will be
recorded until the second call to [method@Gtk.Snapshot.pop].

Calling this function requires two subsequent calls
to [method@Gtk.Snapshot.pop]. *)
external push_blend : t -> Ocgtk_gsk.Gsk.blendmode -> unit = "ml_gtk_snapshot_push_blend"

(** Removes the top element from the stack of render nodes,
and appends it to the node underneath it. *)
external pop : t -> unit = "ml_gtk_snapshot_pop"

(** Applies a perspective projection transform.

See [method@Gsk.Transform.perspective] for a discussion on the details. *)
external perspective : t -> float -> unit = "ml_gtk_snapshot_perspective"

(** Removes the top element from the stack of render nodes and
adds it to the nearest [class@Gsk.GLShaderNode] below it.

This must be called the same number of times as the number
of textures is needed for the shader in
[method@Gtk.Snapshot.push_gl_shader]. *)
external gl_shader_pop_texture : t -> unit = "ml_gtk_snapshot_gl_shader_pop_texture"

(** Creates a new render node drawing the @texture
into the given @bounds and appends it to the
current render node of @snapshot.

If the texture needs to be scaled to fill @bounds,
linear filtering is used. See [method@Gtk.Snapshot.append_scaled_texture]
if you need other filtering, such as nearest-neighbour. *)
external append_texture : t -> Ocgtk_gdk.Gdk.Wrappers.Texture.t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> unit = "ml_gtk_snapshot_append_texture"

(** A convenience method to stroke a path with a color.

See [method@Gtk.Snapshot.push_stroke] if you need
to stroke a path with more complex content than
a color. *)
external append_stroke : t -> Ocgtk_gsk.Gsk.Wrappers.Path.t -> Ocgtk_gsk.Gsk.Wrappers.Stroke.t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> unit = "ml_gtk_snapshot_append_stroke"

(** Creates a new render node drawing the @texture
into the given @bounds and appends it to the
current render node of @snapshot.

In contrast to [method@Gtk.Snapshot.append_texture],
this function provides control about how the filter
that is used when scaling. *)
external append_scaled_texture : t -> Ocgtk_gdk.Gdk.Wrappers.Texture.t -> Ocgtk_gsk.Gsk.scalingfilter -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> unit = "ml_gtk_snapshot_append_scaled_texture"

(** Appends an outset shadow node around the box given by @outline. *)
external append_outset_shadow : t -> Ocgtk_gsk.Gsk.Wrappers.Rounded_rect.t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_append_outset_shadow_bytecode" "ml_gtk_snapshot_append_outset_shadow_native"

(** Appends @node to the current render node of @snapshot,
without changing the current node.

If @snapshot does not have a current node yet, @node
will become the initial node. *)
external append_node : t -> Ocgtk_gsk.Gsk.Wrappers.Render_node.t -> unit = "ml_gtk_snapshot_append_node"

external append_layout : t -> Ocgtk_pango.Pango.Wrappers.Layout.t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> unit = "ml_gtk_snapshot_append_layout"

(** Appends an inset shadow into the box given by @outline. *)
external append_inset_shadow : t -> Ocgtk_gsk.Gsk.Wrappers.Rounded_rect.t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> float -> float -> float -> float -> unit = "ml_gtk_snapshot_append_inset_shadow_bytecode" "ml_gtk_snapshot_append_inset_shadow_native"

(** A convenience method to fill a path with a color.

See [method@Gtk.Snapshot.push_fill] if you need
to fill a path with more complex content than
a color. *)
external append_fill : t -> Ocgtk_gsk.Gsk.Wrappers.Path.t -> Ocgtk_gsk.Gsk.fillrule -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> unit = "ml_gtk_snapshot_append_fill"

(** Creates a new render node drawing the @color into the
given @bounds and appends it to the current render node
of @snapshot.

You should try to avoid calling this function if
@color is transparent. *)
external append_color : t -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> unit = "ml_gtk_snapshot_append_color"

(** Creates a new [class@Gsk.CairoNode] and appends it to the current
render node of @snapshot, without changing the current node. *)
external append_cairo : t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t -> Ocgtk_cairo.Cairo.Wrappers.Context.t = "ml_gtk_snapshot_append_cairo"

(** Appends a stroked border rectangle inside the given @outline.

The four sides of the border can have different widths and colors. *)
external append_border : t -> Ocgtk_gsk.Gsk.Wrappers.Rounded_rect.t -> float array -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array -> unit = "ml_gtk_snapshot_append_border"

