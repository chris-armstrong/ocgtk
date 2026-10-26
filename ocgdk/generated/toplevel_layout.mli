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

class toplevel_layout : Raw.Toplevel_layout.t -> toplevel_layout_t

val new_ : unit -> toplevel_layout_t
