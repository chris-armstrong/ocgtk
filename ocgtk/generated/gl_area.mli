[@@@ocaml.text
"Allows drawing with OpenGL.\n\n\
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
 you should use the [Gtk.GLArea::create-context] signal.\n\n\
 Its methods, signals and properties are on {!class-type-gl_area_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Gl_area}."]

(** The methods, signals and properties of a [GtkGLArea]. *)
class type gl_area_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_create_context :
    ?after:bool ->
    callback:(unit -> Ocgdk.Gl_context.gl_context_t) ->
    unit ->
    Gobject.Signal.handler_id

  method on_render :
    ?after:bool ->
    callback:(context:Ocgdk.Gl_context.gl_context_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_resize :
    ?after:bool ->
    callback:(width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method attach_buffers : unit -> unit
  method get_allowed_apis : unit -> Ocgdk.Enums.glapi
  method get_api : unit -> Ocgdk.Enums.glapi
  method get_auto_render : unit -> bool
  method get_context : unit -> Ocgdk.Gl_context.gl_context_t option
  method get_error : unit -> GError.t option
  method get_has_depth_buffer : unit -> bool
  method get_has_stencil_buffer : unit -> bool
  method get_use_es : unit -> bool
  method make_current : unit -> unit
  method queue_render : unit -> unit
  method set_allowed_apis : Ocgdk.Enums.glapi -> unit
  method set_auto_render : bool -> unit
  method set_error : GError.t option -> unit
  method set_has_depth_buffer : bool -> unit
  method set_has_stencil_buffer : bool -> unit
  method set_required_version : int -> int -> unit
  method set_use_es : bool -> unit
  method as_gl_area : Raw.Gl_area.t
end

class gl_area : Raw.Gl_area.t -> gl_area_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Gl_area.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkGLArea], give one already wrapped. *)

val new_ : unit -> gl_area_t
