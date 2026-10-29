(** Allows drawing with OpenGL.

    Its methods, signals and properties are on {!class-type-gl_area_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gl_area}. *)

(** {1:class Class} *)

class type gl_area_t = object
  inherit Widget.widget_t

  (** {2:signals Signals} *)

  method on_create_context :
    ?after:bool ->
    callback:(unit -> Ocgdk.Gl_context.gl_context_t) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the widget is being realized.

      This allows you to override how the GL context is created. This is useful
      when you want to reuse an existing GL context, or if you want to try
      creating different kinds of GL options.

      If context creation fails then the signal handler can use
      [Gtk.GLArea.set_error] to register a more detailed error of how the
      construction failed. *)

  method on_render :
    ?after:bool ->
    callback:(context:Ocgdk.Gl_context.gl_context_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted every time the contents of the [GtkGLArea] should be redrawn.

      The [context] is bound to the [area] prior to emitting this function, and
      the buffers are painted to the window once the emission terminates. *)

  method on_resize :
    ?after:bool ->
    callback:(width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted once when the widget is realized, and then each time the widget is
      changed while realized.

      This is useful in order to keep GL state up to date with the widget size,
      like for instance camera properties which may depend on the width/height
      ratio.

      The GL context for the area is guaranteed to be current when this signal
      is emitted.

      The default handler sets up the GL viewport. *)

  (** {2:methods Methods} *)

  method attach_buffers : unit -> unit
  (** Binds buffers to the framebuffer.

      Ensures that the [area] framebuffer object is made the current draw and
      read target, and that all the required buffers for the [area] are created
      and bound to the framebuffer.

      This function is automatically called before emitting the
      [Gtk.GLArea::render] signal, and doesn't normally need to be called by
      application code. *)

  method get_allowed_apis : unit -> Ocgdk.Enums.glapi
  (** Gets the allowed APIs.

      See [Gtk.GLArea.set_allowed_apis]. *)

  method get_api : unit -> Ocgdk.Enums.glapi
  (** Gets the API that is currently in use.

      If the GL area has not been realized yet, 0 is returned. *)

  method get_auto_render : unit -> bool
  (** Returns whether the area is in auto render mode or not. *)

  method get_context : unit -> Ocgdk.Gl_context.gl_context_t option
  (** Retrieves the [GdkGLContext] used by [area]. *)

  method get_error : unit -> GError.t option
  (** Gets the current error set on the [area]. *)

  method get_has_depth_buffer : unit -> bool
  (** Returns whether the area has a depth buffer. *)

  method get_has_stencil_buffer : unit -> bool
  (** Returns whether the area has a stencil buffer. *)

  method get_use_es : unit -> bool
  (** Returns whether the [GtkGLArea] should use OpenGL ES.

      See [Gtk.GLArea.set_use_es]. *)

  method make_current : unit -> unit
  (** Ensures that the [GdkGLContext] used by [area] is associated with the
      [GtkGLArea].

      This function is automatically called before emitting the
      [Gtk.GLArea::render] signal, and doesn't normally need to be called by
      application code. *)

  method queue_render : unit -> unit
  (** Marks the currently rendered data (if any) as invalid, and queues a redraw
      of the widget.

      This ensures that the [Gtk.GLArea::render] signal is emitted during the
      draw.

      This is only needed when [Gtk.GLArea.set_auto_render] has been called with
      a [false] value. The default behaviour is to emit [Gtk.GLArea::render] on
      each draw. *)

  method set_allowed_apis : Ocgdk.Enums.glapi -> unit
  (** Sets the allowed APIs to create a context with.

      You should check [Gtk.GLArea:api] before drawing with either API.

      By default, all APIs are allowed. *)

  method set_auto_render : bool -> unit
  (** Sets whether the [GtkGLArea] is in auto render mode.

      If [auto_render] is [true] the [Gtk.GLArea::render] signal will be emitted
      every time the widget draws. This is the default and is useful if drawing
      the widget is faster.

      If [auto_render] is [false] the data from previous rendering is kept
      around and will be used for drawing the widget the next time, unless the
      window is resized. In order to force a rendering [Gtk.GLArea.queue_render]
      must be called. This mode is useful when the scene changes seldom, but
      takes a long time to redraw. *)

  method set_error : GError.t option -> unit
  (** Sets an error on the area which will be shown instead of the GL rendering.

      This is useful in the [Gtk.GLArea::create-context] signal if GL context
      creation fails. *)

  method set_has_depth_buffer : bool -> unit
  (** Sets whether the [GtkGLArea] should use a depth buffer.

      If [has_depth_buffer] is [true] the widget will allocate and enable a
      depth buffer for the target framebuffer. Otherwise there will be none. *)

  method set_has_stencil_buffer : bool -> unit
  (** Sets whether the [GtkGLArea] should use a stencil buffer.

      If [has_stencil_buffer] is [true] the widget will allocate and enable a
      stencil buffer for the target framebuffer. Otherwise there will be none.
  *)

  method set_required_version : int -> int -> unit
  (** Sets the required version of OpenGL to be used when creating the context
      for the widget.

      This function must be called before the area has been realized. *)

  method set_use_es : bool -> unit
  (** Sets whether the [area] should create an OpenGL or an OpenGL ES context.

      You should check the capabilities of the [GdkGLContext] before drawing
      with either API. *)

  (** {2:conversions Conversions} *)

  method as_gl_area : Raw.Gl_area.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [GLArea].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\n\
     Allows drawing with OpenGL.\n\n\
     An example GtkGLArea\n\n\
     [GtkGLArea] sets up its own [Gdk.GLContext], and creates a custom\n\
     GL framebuffer that the widget will do GL rendering onto. It also ensures\n\
     that this framebuffer is the default GL rendering target when rendering.\n\
     The completed rendering is integrated into the larger GTK scene graph as\n\
     a texture.\n\n\
     In order to draw, you have to connect to the [Gtk.GLArea::render]\n\
     signal, or subclass [GtkGLArea] and override the GtkGLAreaClass.render\n\
     virtual function.\n\n\
     The [GtkGLArea] widget ensures that the [GdkGLContext] is associated with\n\
     the widget's drawing area, and it is kept updated when the size and\n\
     position of the drawing area changes.\n\n\
     {b Drawing with GtkGLArea}\n\n\
     The simplest way to draw using OpenGL commands in a [GtkGLArea] is to\n\
     create a widget instance and connect to the [Gtk.GLArea::render] signal:\n\n\
     The [render()] function will be called when the [GtkGLArea] is ready\n\
     for you to draw its content:\n\n\
     The initial contents of the framebuffer are transparent.\n\n\
     {[\n\
     static gboolean\n\
     render (GtkGLArea *area, GdkGLContext *context)\n\
     {\n\
    \  // inside this function it's safe to use GL; the given\n\
    \  // GdkGLContext has been made current to the drawable\n\
    \  // surface used by the `GtkGLArea` and the viewport has\n\
    \  // already been set to be the size of the allocation\n\n\
    \  // we can start by clearing the buffer\n\
    \  glClearColor (0, 0, 0, 0);\n\
    \  glClear (GL_COLOR_BUFFER_BIT);\n\n\
    \  // record the active framebuffer ID, so we can return to it\n\
    \  // with `glBindFramebuffer (GL_FRAMEBUFFER, screen_fb)` should\n\
    \  // we, for instance, intend on utilizing the results of an\n\
    \  // intermediate render texture pass\n\
    \  GLuint screen_fb = 0;\n\
    \  glGetIntegerv (GL_FRAMEBUFFER_BINDING, &screen_fb);\n\n\
    \  // draw your object\n\
    \  // draw_an_object ();\n\n\
    \  // we completed our drawing; the draw commands will be\n\
    \  // flushed at the end of the signal emission chain, and\n\
    \  // the buffers will be drawn on the window\n\
    \  return TRUE;\n\
     }\n\n\
     void setup_glarea (void)\n\
     {\n\
    \  // create a GtkGLArea instance\n\
    \  GtkWidget *gl_area = gtk_gl_area_new ();\n\n\
    \  // connect to the \"render\" signal\n\
    \  g_signal_connect (gl_area, \"render\", G_CALLBACK (render), NULL);\n\
     }\n\
     ]}\n\n\
     If you need to initialize OpenGL state, e.g. buffer objects or\n\
     shaders, you should use the [Gtk.Widget::realize] signal;\n\
     you can use the [Gtk.Widget::unrealize] signal to clean up.\n\
     Since the [GdkGLContext] creation and initialization may fail, you\n\
     will need to check for errors, using [Gtk.GLArea.get_error].\n\n\
     An example of how to safely initialize the GL state is:\n\n\
     {[\n\
     static void\n\
     on_realize (GtkGLArea *area)\n\
     {\n\
    \  // We need to make the context current if we want to\n\
    \  // call GL API\n\
    \  gtk_gl_area_make_current (area);\n\n\
    \  // If there were errors during the initialization or\n\
    \  // when trying to make the context current, this\n\
    \  // function will return a GError for you to catch\n\
    \  if (gtk_gl_area_get_error (area) != NULL)\n\
    \    return;\n\n\
    \  // You can also use gtk_gl_area_set_error() in order\n\
    \  // to show eventual initialization errors on the\n\
    \  // GtkGLArea widget itself\n\
    \  GError *internal_error = NULL;\n\
    \  init_buffer_objects (&error);\n\
    \  if (error != NULL)\n\
    \    {\n\
    \      gtk_gl_area_set_error (area, error);\n\
    \      g_error_free (error);\n\
    \      return;\n\
    \    }\n\n\
    \  init_shaders (&error);\n\
    \  if (error != NULL)\n\
    \    {\n\
    \      gtk_gl_area_set_error (area, error);\n\
    \      g_error_free (error);\n\
    \      return;\n\
    \    }\n\
     }\n\
     ]}\n\n\
     If you need to change the options for creating the [GdkGLContext]\n\
     you should use the [Gtk.GLArea::create-context] signal."]

class gl_area : Raw.Gl_area.t -> gl_area_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gl_area.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Allows drawing with OpenGL.\n\n\
 An example GtkGLArea\n\n\
 [GtkGLArea] sets up its own [Gdk.GLContext], and creates a custom\n\
 GL framebuffer that the widget will do GL rendering onto. It also ensures\n\
 that this framebuffer is the default GL rendering target when rendering.\n\
 The completed rendering is integrated into the larger GTK scene graph as\n\
 a texture.\n\n\
 In order to draw, you have to connect to the [Gtk.GLArea::render]\n\
 signal, or subclass [GtkGLArea] and override the GtkGLAreaClass.render\n\
 virtual function.\n\n\
 The [GtkGLArea] widget ensures that the [GdkGLContext] is associated with\n\
 the widget's drawing area, and it is kept updated when the size and\n\
 position of the drawing area changes.\n\n\
 {b Drawing with GtkGLArea}\n\n\
 The simplest way to draw using OpenGL commands in a [GtkGLArea] is to\n\
 create a widget instance and connect to the [Gtk.GLArea::render] signal:\n\n\
 The [render()] function will be called when the [GtkGLArea] is ready\n\
 for you to draw its content:\n\n\
 The initial contents of the framebuffer are transparent.\n\n\
 {[\n\
 static gboolean\n\
 render (GtkGLArea *area, GdkGLContext *context)\n\
 {\n\
\  // inside this function it's safe to use GL; the given\n\
\  // GdkGLContext has been made current to the drawable\n\
\  // surface used by the `GtkGLArea` and the viewport has\n\
\  // already been set to be the size of the allocation\n\n\
\  // we can start by clearing the buffer\n\
\  glClearColor (0, 0, 0, 0);\n\
\  glClear (GL_COLOR_BUFFER_BIT);\n\n\
\  // record the active framebuffer ID, so we can return to it\n\
\  // with `glBindFramebuffer (GL_FRAMEBUFFER, screen_fb)` should\n\
\  // we, for instance, intend on utilizing the results of an\n\
\  // intermediate render texture pass\n\
\  GLuint screen_fb = 0;\n\
\  glGetIntegerv (GL_FRAMEBUFFER_BINDING, &screen_fb);\n\n\
\  // draw your object\n\
\  // draw_an_object ();\n\n\
\  // we completed our drawing; the draw commands will be\n\
\  // flushed at the end of the signal emission chain, and\n\
\  // the buffers will be drawn on the window\n\
\  return TRUE;\n\
 }\n\n\
 void setup_glarea (void)\n\
 {\n\
\  // create a GtkGLArea instance\n\
\  GtkWidget *gl_area = gtk_gl_area_new ();\n\n\
\  // connect to the \"render\" signal\n\
\  g_signal_connect (gl_area, \"render\", G_CALLBACK (render), NULL);\n\
 }\n\
 ]}\n\n\
 If you need to initialize OpenGL state, e.g. buffer objects or\n\
 shaders, you should use the [Gtk.Widget::realize] signal;\n\
 you can use the [Gtk.Widget::unrealize] signal to clean up.\n\
 Since the [GdkGLContext] creation and initialization may fail, you\n\
 will need to check for errors, using [Gtk.GLArea.get_error].\n\n\
 An example of how to safely initialize the GL state is:\n\n\
 {[\n\
 static void\n\
 on_realize (GtkGLArea *area)\n\
 {\n\
\  // We need to make the context current if we want to\n\
\  // call GL API\n\
\  gtk_gl_area_make_current (area);\n\n\
\  // If there were errors during the initialization or\n\
\  // when trying to make the context current, this\n\
\  // function will return a GError for you to catch\n\
\  if (gtk_gl_area_get_error (area) != NULL)\n\
\    return;\n\n\
\  // You can also use gtk_gl_area_set_error() in order\n\
\  // to show eventual initialization errors on the\n\
\  // GtkGLArea widget itself\n\
\  GError *internal_error = NULL;\n\
\  init_buffer_objects (&error);\n\
\  if (error != NULL)\n\
\    {\n\
\      gtk_gl_area_set_error (area, error);\n\
\      g_error_free (error);\n\
\      return;\n\
\    }\n\n\
\  init_shaders (&error);\n\
\  if (error != NULL)\n\
\    {\n\
\      gtk_gl_area_set_error (area, error);\n\
\      g_error_free (error);\n\
\      return;\n\
\    }\n\
 }\n\
 ]}\n\n\
 If you need to change the options for creating the [GdkGLContext]\n\
 you should use the [Gtk.GLArea::create-context] signal."]

(** {1:constructors Constructors} *)

val new_ : unit -> gl_area_t
(** Creates a new [GtkGLArea] widget. *)
