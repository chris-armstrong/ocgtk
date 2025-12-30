(* GENERATED CODE - DO NOT EDIT *)
(* Widget: GLArea *)

type t = [`gl_area | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new GLArea *)
external new_ : unit -> t = "ml_gtk_gl_area_new"

(* Methods *)
(** Sets whether the @area should create an OpenGL or an OpenGL ES context.

You should check the capabilities of the `GdkGLContext` before drawing
with either API. *)
external set_use_es : t -> bool -> unit = "ml_gtk_gl_area_set_use_es"

(** Sets the required version of OpenGL to be used when creating
the context for the widget.

This function must be called before the area has been realized. *)
external set_required_version : t -> int -> int -> unit = "ml_gtk_gl_area_set_required_version"

(** Sets whether the `GtkGLArea` should use a stencil buffer.

If @has_stencil_buffer is %TRUE the widget will allocate and
enable a stencil buffer for the target framebuffer. Otherwise
there will be none. *)
external set_has_stencil_buffer : t -> bool -> unit = "ml_gtk_gl_area_set_has_stencil_buffer"

(** Sets whether the `GtkGLArea` should use a depth buffer.

If @has_depth_buffer is %TRUE the widget will allocate and
enable a depth buffer for the target framebuffer. Otherwise
there will be none. *)
external set_has_depth_buffer : t -> bool -> unit = "ml_gtk_gl_area_set_has_depth_buffer"

(** Sets whether the `GtkGLArea` is in auto render mode.

If @auto_render is %TRUE the [signal@Gtk.GLArea::render] signal will
be emitted every time the widget draws. This is the default and is
useful if drawing the widget is faster.

If @auto_render is %FALSE the data from previous rendering is kept
around and will be used for drawing the widget the next time,
unless the window is resized. In order to force a rendering
[method@Gtk.GLArea.queue_render] must be called. This mode is
useful when the scene changes seldom, but takes a long time to redraw. *)
external set_auto_render : t -> bool -> unit = "ml_gtk_gl_area_set_auto_render"

(** Marks the currently rendered data (if any) as invalid, and queues
a redraw of the widget.

This ensures that the [signal@Gtk.GLArea::render] signal
is emitted during the draw.

This is only needed when [method@Gtk.GLArea.set_auto_render] has
been called with a %FALSE value. The default behaviour is to
emit [signal@Gtk.GLArea::render] on each draw. *)
external queue_render : t -> unit = "ml_gtk_gl_area_queue_render"

(** Ensures that the `GdkGLContext` used by @area is associated with
the `GtkGLArea`.

This function is automatically called before emitting the
[signal@Gtk.GLArea::render] signal, and doesn't normally need
to be called by application code. *)
external make_current : t -> unit = "ml_gtk_gl_area_make_current"

(** Returns whether the `GtkGLArea` should use OpenGL ES.

See [method@Gtk.GLArea.set_use_es]. *)
external get_use_es : t -> bool = "ml_gtk_gl_area_get_use_es"

(** Retrieves the required version of OpenGL.

See [method@Gtk.GLArea.set_required_version]. *)
external get_required_version : t -> int * int = "ml_gtk_gl_area_get_required_version"

(** Returns whether the area has a stencil buffer. *)
external get_has_stencil_buffer : t -> bool = "ml_gtk_gl_area_get_has_stencil_buffer"

(** Returns whether the area has a depth buffer. *)
external get_has_depth_buffer : t -> bool = "ml_gtk_gl_area_get_has_depth_buffer"

(** Returns whether the area is in auto render mode or not. *)
external get_auto_render : t -> bool = "ml_gtk_gl_area_get_auto_render"

(** Binds buffers to the framebuffer.

Ensures that the @area framebuffer object is made the current draw
and read target, and that all the required buffers for the @area
are created and bound to the framebuffer.

This function is automatically called before emitting the
[signal@Gtk.GLArea::render] signal, and doesn't normally need to be
called by application code. *)
external attach_buffers : t -> unit = "ml_gtk_gl_area_attach_buffers"

(* Properties *)

