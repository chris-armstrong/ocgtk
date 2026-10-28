class type toplevel_layout_t = object
  method equal : Raw.Toplevel_layout.t -> bool
  (** Check whether [layout] and [other] has identical layout properties. *)

  method get_fullscreen_monitor :
    unit -> App_launch_context_cycle_de440b34.monitor_t option
  (** Returns the monitor that the layout is fullscreening the surface on. *)

  method get_resizable : unit -> bool
  (** Returns whether the layout should allow the user to resize the surface. *)

  method ref : unit -> Raw.Toplevel_layout.t
  (** Increases the reference count of [layout]. *)

  method set_fullscreen :
    bool -> App_launch_context_cycle_de440b34.monitor_t option -> unit
  (** Sets whether the layout should cause the surface to be fullscreen when
      presented. *)

  method set_maximized : bool -> unit
  (** Sets whether the layout should cause the surface to be maximized when
      presented. *)

  method set_resizable : bool -> unit
  (** Sets whether the layout should allow the user to resize the surface after
      it has been presented. *)

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
