(* GENERATED CODE - DO NOT EDIT *)
(* GLArea: GLArea *)

type t = [ `gl_area | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Allows drawing with OpenGL.

    An example GtkGLArea

    [GtkGLArea] sets up its own [Gdk.GLContext], and creates a custom GL
    framebuffer that the widget will do GL rendering onto. It also ensures that
    this framebuffer is the default GL rendering target when rendering. The
    completed rendering is integrated into the larger GTK scene graph as a
    texture.

    In order to draw, you have to connect to the [Gtk.GLArea::render] signal, or
    subclass [GtkGLArea] and override the GtkGLAreaClass.render virtual
    function.

    The [GtkGLArea] widget ensures that the [GdkGLContext] is associated with
    the widget's drawing area, and it is kept updated when the size and position
    of the drawing area changes.

    {b Drawing with GtkGLArea}

    The simplest way to draw using OpenGL commands in a [GtkGLArea] is to create
    a widget instance and connect to the [Gtk.GLArea::render] signal:

    The [render()] function will be called when the [GtkGLArea] is ready for you
    to draw its content:

    The initial contents of the framebuffer are transparent.

    {[
    static gboolean
    render (GtkGLArea *area, GdkGLContext *context)
    {
      // inside this function it's safe to use GL; the given
      // GdkGLContext has been made current to the drawable
      // surface used by the `GtkGLArea` and the viewport has
      // already been set to be the size of the allocation

      // we can start by clearing the buffer
      glClearColor (0, 0, 0, 0);
      glClear (GL_COLOR_BUFFER_BIT);

      // record the active framebuffer ID, so we can return to it
      // with `glBindFramebuffer (GL_FRAMEBUFFER, screen_fb)` should
      // we, for instance, intend on utilizing the results of an
      // intermediate render texture pass
      GLuint screen_fb = 0;
      glGetIntegerv (GL_FRAMEBUFFER_BINDING, &screen_fb);

      // draw your object
      // draw_an_object ();

      // we completed our drawing; the draw commands will be
      // flushed at the end of the signal emission chain, and
      // the buffers will be drawn on the window
      return TRUE;
    }

    void setup_glarea (void)
    {
      // create a GtkGLArea instance
      GtkWidget *gl_area = gtk_gl_area_new ();

      // connect to the “render” signal
      g_signal_connect (gl_area, “render”, G_CALLBACK (render), NULL);
    }
    ]}

    If you need to initialize OpenGL state, e.g. buffer objects or shaders, you
    should use the [Gtk.Widget::realize] signal; you can use the
    [Gtk.Widget::unrealize] signal to clean up. Since the [GdkGLContext]
    creation and initialization may fail, you will need to check for errors,
    using [Gtk.GLArea.get_error].

    An example of how to safely initialize the GL state is:

    {[
    static void
    on_realize (GtkGLArea *area)
    {
      // We need to make the context current if we want to
      // call GL API
      gtk_gl_area_make_current (area);

      // If there were errors during the initialization or
      // when trying to make the context current, this
      // function will return a GError for you to catch
      if (gtk_gl_area_get_error (area) != NULL)
        return;

      // You can also use gtk_gl_area_set_error() in order
      // to show eventual initialization errors on the
      // GtkGLArea widget itself
      GError *internal_error = NULL;
      init_buffer_objects (&error);
      if (error != NULL)
        {
          gtk_gl_area_set_error (area, error);
          g_error_free (error);
          return;
        }

      init_shaders (&error);
      if (error != NULL)
        {
          gtk_gl_area_set_error (area, error);
          g_error_free (error);
          return;
        }
    }
    ]}

    If you need to change the options for creating the [GdkGLContext] you should
    use the [Gtk.GLArea::create-context] signal. *)

external new_ : unit -> t = "ml_gtk_gl_area_new"
(** Create a new GLArea *)

(* Methods *)

external set_use_es : t -> bool -> unit = "ml_gtk_gl_area_set_use_es"
(** Sets whether the [area] should create an OpenGL or an OpenGL ES context.

    You should check the capabilities of the [GdkGLContext] before drawing with
    either API. *)

external set_required_version : t -> int -> int -> unit
  = "ml_gtk_gl_area_set_required_version"
(** Sets the required version of OpenGL to be used when creating the context for
    the widget.

    This function must be called before the area has been realized. *)

external set_has_stencil_buffer : t -> bool -> unit
  = "ml_gtk_gl_area_set_has_stencil_buffer"
(** Sets whether the [GtkGLArea] should use a stencil buffer.

    If [has_stencil_buffer] is [TRUE] the widget will allocate and enable a
    stencil buffer for the target framebuffer. Otherwise there will be none. *)

external set_has_depth_buffer : t -> bool -> unit
  = "ml_gtk_gl_area_set_has_depth_buffer"
(** Sets whether the [GtkGLArea] should use a depth buffer.

    If [has_depth_buffer] is [TRUE] the widget will allocate and enable a depth
    buffer for the target framebuffer. Otherwise there will be none. *)

external set_error : t -> GError.t option -> unit = "ml_gtk_gl_area_set_error"
(** Sets an error on the area which will be shown instead of the GL rendering.

    This is useful in the [Gtk.GLArea::create-context] signal if GL context
    creation fails. *)

external set_auto_render : t -> bool -> unit = "ml_gtk_gl_area_set_auto_render"
(** Sets whether the [GtkGLArea] is in auto render mode.

    If [auto_render] is [TRUE] the [Gtk.GLArea::render] signal will be emitted
    every time the widget draws. This is the default and is useful if drawing
    the widget is faster.

    If [auto_render] is [FALSE] the data from previous rendering is kept around
    and will be used for drawing the widget the next time, unless the window is
    resized. In order to force a rendering [Gtk.GLArea.queue_render] must be
    called. This mode is useful when the scene changes seldom, but takes a long
    time to redraw. *)

external set_allowed_apis : t -> Ocgtk_gdk.Gdk.glapi -> unit
  = "ml_gtk_gl_area_set_allowed_apis"
(** Sets the allowed APIs to create a context with.

    You should check [Gtk.GLArea:api] before drawing with either API.

    By default, all APIs are allowed. *)

external queue_render : t -> unit = "ml_gtk_gl_area_queue_render"
(** Marks the currently rendered data (if any) as invalid, and queues a redraw
    of the widget.

    This ensures that the [Gtk.GLArea::render] signal is emitted during the
    draw.

    This is only needed when [Gtk.GLArea.set_auto_render] has been called with a
    [FALSE] value. The default behaviour is to emit [Gtk.GLArea::render] on each
    draw. *)

external make_current : t -> unit = "ml_gtk_gl_area_make_current"
(** Ensures that the [GdkGLContext] used by [area] is associated with the
    [GtkGLArea].

    This function is automatically called before emitting the
    [Gtk.GLArea::render] signal, and doesn't normally need to be called by
    application code. *)

external get_use_es : t -> bool = "ml_gtk_gl_area_get_use_es"
(** Returns whether the [GtkGLArea] should use OpenGL ES.

    See [Gtk.GLArea.set_use_es]. *)

external get_required_version : t -> int * int
  = "ml_gtk_gl_area_get_required_version"
(** Retrieves the required version of OpenGL.

    See [Gtk.GLArea.set_required_version]. *)

external get_has_stencil_buffer : t -> bool
  = "ml_gtk_gl_area_get_has_stencil_buffer"
(** Returns whether the area has a stencil buffer. *)

external get_has_depth_buffer : t -> bool
  = "ml_gtk_gl_area_get_has_depth_buffer"
(** Returns whether the area has a depth buffer. *)

external get_error : t -> GError.t option = "ml_gtk_gl_area_get_error"
(** Gets the current error set on the [area]. *)

external get_context : t -> Ocgtk_gdk.Gdk.Wrappers.Gl_context.t option
  = "ml_gtk_gl_area_get_context"
(** Retrieves the [GdkGLContext] used by [area]. *)

external get_auto_render : t -> bool = "ml_gtk_gl_area_get_auto_render"
(** Returns whether the area is in auto render mode or not. *)

external get_api : t -> Ocgtk_gdk.Gdk.glapi = "ml_gtk_gl_area_get_api"
(** Gets the API that is currently in use.

    If the GL area has not been realized yet, 0 is returned. *)

external get_allowed_apis : t -> Ocgtk_gdk.Gdk.glapi
  = "ml_gtk_gl_area_get_allowed_apis"
(** Gets the allowed APIs.

    See [Gtk.GLArea.set_allowed_apis]. *)

external attach_buffers : t -> unit = "ml_gtk_gl_area_attach_buffers"
(** Binds buffers to the framebuffer.

    Ensures that the [area] framebuffer object is made the current draw and read
    target, and that all the required buffers for the [area] are created and
    bound to the framebuffer.

    This function is automatically called before emitting the
    [Gtk.GLArea::render] signal, and doesn't normally need to be called by
    application code. *)

(* Properties *)

let on_create_context ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let result = callback () in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_object_exn v x)
  in
  Gobject.Signal.connect obj ~name:"create-context" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_render ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let context =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_object_exn v
        in
        let result = callback ~context in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"render" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_resize ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let width =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_int v
        in
        let height =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_int v
        in
        callback ~width ~height)
  in
  Gobject.Signal.connect obj ~name:"resize" ~callback:closure
    ~after:(Option.value after ~default:false)
