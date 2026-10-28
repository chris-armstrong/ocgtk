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

(* High-level class for GLArea *)
class gl_area (obj : Raw.Gl_area.t) : gl_area_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method on_create_context ?(after = false) ~callback () =
      Raw.Gl_area.on_create_context ~after self#as_gl_area ~callback:(fun () ->
          (callback ())#as_gl_context)

    method on_render ?(after = false) ~callback () =
      Raw.Gl_area.on_render ~after self#as_gl_area ~callback:(fun ~context ->
          callback ~context:(new Ocgdk.Gl_context.gl_context context))

    method on_resize ?(after = false) ~callback () =
      Raw.Gl_area.on_resize ~after self#as_gl_area ~callback

    method attach_buffers : unit -> unit =
      fun () -> Raw.Gl_area.attach_buffers obj

    method get_allowed_apis : unit -> Ocgdk.Enums.glapi =
      fun () -> Raw.Gl_area.get_allowed_apis obj

    method get_api : unit -> Ocgdk.Enums.glapi =
      fun () -> Raw.Gl_area.get_api obj

    method get_auto_render : unit -> bool =
      fun () -> Raw.Gl_area.get_auto_render obj

    method get_context : unit -> Ocgdk.Gl_context.gl_context_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Gl_context.gl_context ret)
          (Raw.Gl_area.get_context obj)

    method get_error : unit -> GError.t option =
      fun () -> Raw.Gl_area.get_error obj

    method get_has_depth_buffer : unit -> bool =
      fun () -> Raw.Gl_area.get_has_depth_buffer obj

    method get_has_stencil_buffer : unit -> bool =
      fun () -> Raw.Gl_area.get_has_stencil_buffer obj

    method get_use_es : unit -> bool = fun () -> Raw.Gl_area.get_use_es obj
    method make_current : unit -> unit = fun () -> Raw.Gl_area.make_current obj
    method queue_render : unit -> unit = fun () -> Raw.Gl_area.queue_render obj

    method set_allowed_apis : Ocgdk.Enums.glapi -> unit =
      fun apis -> Raw.Gl_area.set_allowed_apis obj apis

    method set_auto_render : bool -> unit =
      fun auto_render -> Raw.Gl_area.set_auto_render obj auto_render

    method set_error : GError.t option -> unit =
      fun error -> Raw.Gl_area.set_error obj error

    method set_has_depth_buffer : bool -> unit =
      fun has_depth_buffer ->
        Raw.Gl_area.set_has_depth_buffer obj has_depth_buffer

    method set_has_stencil_buffer : bool -> unit =
      fun has_stencil_buffer ->
        Raw.Gl_area.set_has_stencil_buffer obj has_stencil_buffer

    method set_required_version : int -> int -> unit =
      fun major minor -> Raw.Gl_area.set_required_version obj major minor

    method set_use_es : bool -> unit =
      fun use_es -> Raw.Gl_area.set_use_es obj use_es

    method as_gl_area = obj
  end

let new_ () : gl_area_t = new gl_area (Raw.Gl_area.new_ ())
