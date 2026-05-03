class type gl_area_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method on_resize :
    callback:(width:int -> height:int -> unit) -> Gobject.Signal.handler_id

  method attach_buffers : unit -> unit
  method get_allowed_apis : unit -> Ocgtk_gdk.Gdk.glapi
  method get_api : unit -> Ocgtk_gdk.Gdk.glapi
  method get_auto_render : unit -> bool
  method get_context : unit -> Ocgtk_gdk.Gdk.Gl_context.gl_context_t option
  method get_has_depth_buffer : unit -> bool
  method get_has_stencil_buffer : unit -> bool
  method get_use_es : unit -> bool
  method make_current : unit -> unit
  method queue_render : unit -> unit
  method set_allowed_apis : Ocgtk_gdk.Gdk.glapi -> unit
  method set_auto_render : bool -> unit
  method set_has_depth_buffer : bool -> unit
  method set_has_stencil_buffer : bool -> unit
  method set_required_version : int -> int -> unit
  method set_use_es : bool -> unit
  method as_gl_area : Gl_area.t
end

class gl_area : Gl_area.t -> gl_area_t

val new_ : unit -> gl_area_t
