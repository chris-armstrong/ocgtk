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

(* High-level class for GLArea *)
class gl_area (obj : Raw.Gl_area.t) : gl_area_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

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
