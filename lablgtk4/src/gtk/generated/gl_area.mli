(* GENERATED CODE - DO NOT EDIT *)
(* Widget: GLArea *)

type t = [`gl_area | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new GLArea *)
external new_ : unit -> t = "ml_gtk_gl_area_new"

(* Properties *)

(** Get property: auto-render *)
external get_auto_render : t -> bool = "ml_gtk_gl_area_get_auto_render"

(** Set property: auto-render *)
external set_auto_render : t -> bool -> unit = "ml_gtk_gl_area_set_auto_render"

(** Get property: has-depth-buffer *)
external get_has_depth_buffer : t -> bool = "ml_gtk_gl_area_get_has_depth_buffer"

(** Set property: has-depth-buffer *)
external set_has_depth_buffer : t -> bool -> unit = "ml_gtk_gl_area_set_has_depth_buffer"

(** Get property: has-stencil-buffer *)
external get_has_stencil_buffer : t -> bool = "ml_gtk_gl_area_get_has_stencil_buffer"

(** Set property: has-stencil-buffer *)
external set_has_stencil_buffer : t -> bool -> unit = "ml_gtk_gl_area_set_has_stencil_buffer"

(** Get property: use-es *)
external get_use_es : t -> bool = "ml_gtk_gl_area_get_use_es"

(** Set property: use-es *)
external set_use_es : t -> bool -> unit = "ml_gtk_gl_area_set_use_es"

(** Sets the required version of OpenGL to be used when creating
the context for the widget.

This function must be called before the area has been realized. *)
external set_required_version : t -> int -> int -> unit = "ml_gtk_gl_area_set_required_version"

(** Sets the allowed APIs to create a context with.

You should check [property@Gtk.GLArea:api] before drawing
with either API.

By default, all APIs are allowed. *)
external set_allowed_apis : t -> Gdk.glapi -> unit = "ml_gtk_gl_area_set_allowed_apis"

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

(** Gets the API that is currently in use.

If the GL area has not been realized yet, 0 is returned. *)
external get_api : t -> Gdk.glapi = "ml_gtk_gl_area_get_api"

(** Gets the allowed APIs.

See [method@Gtk.GLArea.set_allowed_apis]. *)
external get_allowed_apis : t -> Gdk.glapi = "ml_gtk_gl_area_get_allowed_apis"

(** Binds buffers to the framebuffer.

Ensures that the @area framebuffer object is made the current draw
and read target, and that all the required buffers for the @area
are created and bound to the framebuffer.

This function is automatically called before emitting the
[signal@Gtk.GLArea::render] signal, and doesn't normally need to be
called by application code. *)
external attach_buffers : t -> unit = "ml_gtk_gl_area_attach_buffers"

