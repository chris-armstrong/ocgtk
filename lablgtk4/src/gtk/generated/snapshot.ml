(* GENERATED CODE - DO NOT EDIT *)
(* Snapshot: Snapshot *)

type t = [`snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot | `snapshot] Gobject.obj

(** Create a new Snapshot *)
external new_ : unit -> t = "ml_gtk_snapshot_new"

(* Methods *)
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

(** Rotates @@snapshot's coordinate system by @angle degrees in 2D space -
or in 3D speak, rotates around the Z axis. The rotation happens around
the origin point of (0, 0) in the @snapshot's current coordinate system.

To rotate around axes other than the Z axis, use [method@Gsk.Transform.rotate_3d]. *)
external rotate : t -> float -> unit = "ml_gtk_snapshot_rotate"

(** Restores @snapshot to the state saved by a preceding call to
[method@Snapshot.save] and removes that state from the stack of
saved states. *)
external restore : t -> unit = "ml_gtk_snapshot_restore"

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

(** Modifies the opacity of an image.

The image is recorded until the next call to [method@Gtk.Snapshot.pop]. *)
external push_opacity : t -> float -> unit = "ml_gtk_snapshot_push_opacity"

(** Snapshots a cross-fade operation between two images with the
given @progress.

Until the first call to [method@Gtk.Snapshot.pop], the start image
will be snapshot. After that call, the end image will be recorded
until the second call to [method@Gtk.Snapshot.pop].

Calling this function requires two subsequent calls
to [method@Gtk.Snapshot.pop]. *)
external push_cross_fade : t -> float -> unit = "ml_gtk_snapshot_push_cross_fade"

(** Blurs an image.

The image is recorded until the next call to [method@Gtk.Snapshot.pop]. *)
external push_blur : t -> float -> unit = "ml_gtk_snapshot_push_blur"

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

