class type toplevel_layout_t = object
  method copy : unit -> Toplevel_layout.t
  method equal : Toplevel_layout.t -> bool

  method get_fullscreen_monitor :
    unit -> GApp_launch_context_cycle_de440b34.monitor_t option

  method get_resizable : unit -> bool
  method ref : unit -> Toplevel_layout.t

  method set_fullscreen :
    bool -> GApp_launch_context_cycle_de440b34.monitor_t option -> unit

  method set_maximized : bool -> unit
  method set_resizable : bool -> unit
  method unref : unit -> unit
  method as_toplevel_layout : Toplevel_layout.t
end

class toplevel_layout : Toplevel_layout.t -> toplevel_layout_t

val new_ : unit -> toplevel_layout_t
