class type debug_controller_d_bus_t = object
  inherit Debug_controller.debug_controller_t
  inherit Initable.initable_t

  method on_authorize :
    ?after:bool ->
    callback:
      (invocation:D_bus_method_invocation.d_bus_method_invocation_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method stop : unit -> unit
  method connection : D_bus_connection.d_bus_connection_t
  method as_debug_controller_d_bus : Raw.Debug_controller_d_bus.t
end

(* High-level class for DebugControllerDBus *)
class debug_controller_d_bus (obj : Raw.Debug_controller_d_bus.t) :
  debug_controller_d_bus_t =
  object (self)
    inherit
      Debug_controller.debug_controller (Raw.Debug_controller.from_gobject obj)

    inherit Initable.initable (Raw.Initable.from_gobject obj)

    method on_authorize ?(after = false) ~callback () =
      Raw.Debug_controller_d_bus.on_authorize ~after
        self#as_debug_controller_d_bus ~callback:(fun ~invocation ->
          callback
            ~invocation:
              (new D_bus_method_invocation.d_bus_method_invocation invocation))

    method stop : unit -> unit = fun () -> Raw.Debug_controller_d_bus.stop obj

    method connection =
      new D_bus_connection.d_bus_connection
        (Raw.Debug_controller_d_bus.get_connection obj)

    method as_debug_controller_d_bus = obj
  end

let new_ (connection : D_bus_connection.d_bus_connection_t)
    (cancellable : Cancellable.cancellable_t option) :
    (debug_controller_d_bus_t, GError.t) result =
  let connection = connection#as_d_bus_connection in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = Raw.Debug_controller_d_bus.new_ connection cancellable in
  Result.map (fun obj_ -> new debug_controller_d_bus obj_) obj_
