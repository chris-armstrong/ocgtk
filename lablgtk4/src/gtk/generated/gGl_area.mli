class gl_area : Gl_area.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Ggl_area_signals.gl_area_signals
    method attach_buffers : unit -> unit
    method get_allowed_apis : unit -> Gdk.glapi
    method get_api : unit -> Gdk.glapi
    method get_auto_render : unit -> bool
    method get_has_depth_buffer : unit -> bool
    method get_has_stencil_buffer : unit -> bool
    method get_use_es : unit -> bool
    method make_current : unit -> unit
    method queue_render : unit -> unit
    method set_allowed_apis : Gdk.glapi -> unit
    method set_auto_render : bool -> unit
    method set_has_depth_buffer : bool -> unit
    method set_has_stencil_buffer : bool -> unit
    method set_required_version : int -> int -> unit
    method set_use_es : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_gl_area : Gl_area.t
  end

