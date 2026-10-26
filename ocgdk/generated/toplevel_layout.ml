class type toplevel_layout_t = object
  method equal : Raw.Toplevel_layout.t -> bool

  method get_fullscreen_monitor :
    unit -> App_launch_context_cycle_de440b34.monitor_t option

  method get_resizable : unit -> bool
  method ref : unit -> Raw.Toplevel_layout.t

  method set_fullscreen :
    bool -> App_launch_context_cycle_de440b34.monitor_t option -> unit

  method set_maximized : bool -> unit
  method set_resizable : bool -> unit
  method as_toplevel_layout : Raw.Toplevel_layout.t
end

(* High-level class for ToplevelLayout *)
class toplevel_layout (obj : Raw.Toplevel_layout.t) : toplevel_layout_t =
  object (self)
    method equal : Raw.Toplevel_layout.t -> bool =
      fun other -> Raw.Toplevel_layout.equal obj other

    method get_fullscreen_monitor :
        unit -> App_launch_context_cycle_de440b34.monitor_t option =
      fun () ->
        Option.map
          (fun ret -> new App_launch_context_cycle_de440b34.monitor ret)
          (Raw.Toplevel_layout.get_fullscreen_monitor obj)

    method get_resizable : unit -> bool =
      fun () -> Raw.Toplevel_layout.get_resizable obj

    method ref : unit -> Raw.Toplevel_layout.t =
      fun () -> Raw.Toplevel_layout.ref obj

    method set_fullscreen :
        bool -> App_launch_context_cycle_de440b34.monitor_t option -> unit =
      fun fullscreen monitor ->
        let monitor = Option.map (fun c -> c#as_monitor) monitor in
        Raw.Toplevel_layout.set_fullscreen obj fullscreen monitor

    method set_maximized : bool -> unit =
      fun maximized -> Raw.Toplevel_layout.set_maximized obj maximized

    method set_resizable : bool -> unit =
      fun resizable -> Raw.Toplevel_layout.set_resizable obj resizable

    method as_toplevel_layout = obj
  end

let new_ () : toplevel_layout_t =
  new toplevel_layout (Raw.Toplevel_layout.new_ ())
