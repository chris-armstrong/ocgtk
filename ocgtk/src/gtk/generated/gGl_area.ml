(* Signal class defined in ggl_area_signals.ml *)

class type gl_area_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Ggl_area_signals.gl_area_signals
    method attach_buffers : unit -> unit
    method get_allowed_apis : unit -> Ocgtk_gdk.Gdk.glapi
    method get_api : unit -> Ocgtk_gdk.Gdk.glapi
    method get_auto_render : unit -> bool
    method get_context : unit -> Ocgtk_gdk.Gdk.gl_context_t option
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

(* High-level class for GLArea *)
class gl_area (obj : Gl_area.t) : gl_area_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Ggl_area_signals.gl_area_signals obj

  method attach_buffers : unit -> unit =
    fun () ->
      (Gl_area.attach_buffers obj)

  method get_allowed_apis : unit -> Ocgtk_gdk.Gdk.glapi =
    fun () ->
      (Gl_area.get_allowed_apis obj)

  method get_api : unit -> Ocgtk_gdk.Gdk.glapi =
    fun () ->
      (Gl_area.get_api obj)

  method get_auto_render : unit -> bool =
    fun () ->
      (Gl_area.get_auto_render obj)

  method get_context : unit -> Ocgtk_gdk.Gdk.gl_context_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.gl_context ret) (Gl_area.get_context obj)

  method get_has_depth_buffer : unit -> bool =
    fun () ->
      (Gl_area.get_has_depth_buffer obj)

  method get_has_stencil_buffer : unit -> bool =
    fun () ->
      (Gl_area.get_has_stencil_buffer obj)

  method get_use_es : unit -> bool =
    fun () ->
      (Gl_area.get_use_es obj)

  method make_current : unit -> unit =
    fun () ->
      (Gl_area.make_current obj)

  method queue_render : unit -> unit =
    fun () ->
      (Gl_area.queue_render obj)

  method set_allowed_apis : Ocgtk_gdk.Gdk.glapi -> unit =
    fun apis ->
      (Gl_area.set_allowed_apis obj apis)

  method set_auto_render : bool -> unit =
    fun auto_render ->
      (Gl_area.set_auto_render obj auto_render)

  method set_has_depth_buffer : bool -> unit =
    fun has_depth_buffer ->
      (Gl_area.set_has_depth_buffer obj has_depth_buffer)

  method set_has_stencil_buffer : bool -> unit =
    fun has_stencil_buffer ->
      (Gl_area.set_has_stencil_buffer obj has_stencil_buffer)

  method set_required_version : int -> int -> unit =
    fun major minor ->
      (Gl_area.set_required_version obj major minor)

  method set_use_es : bool -> unit =
    fun use_es ->
      (Gl_area.set_use_es obj use_es)

    method as_gl_area = obj
end

