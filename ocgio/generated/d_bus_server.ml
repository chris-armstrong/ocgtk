class type d_bus_server_t = object
  inherit Initable.initable_t

  method on_new_connection :
    ?after:bool ->
    callback:(connection:D_bus_connection.d_bus_connection_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_client_address : unit -> string
  method get_flags : unit -> Enums.dbusserverflags
  method get_guid : unit -> string
  method is_active : unit -> bool
  method start : unit -> unit
  method stop : unit -> unit
  method address : string
  method authentication_observer : D_bus_auth_observer.d_bus_auth_observer_t
  method as_d_bus_server : Raw.D_bus_server.t
end

(* High-level class for DBusServer *)
class d_bus_server (obj : Raw.D_bus_server.t) : d_bus_server_t =
  object (self)
    inherit Initable.initable (Raw.Initable.from_gobject obj)

    method on_new_connection ?(after = false) ~callback () =
      Raw.D_bus_server.on_new_connection ~after self#as_d_bus_server
        ~callback:(fun ~connection ->
          callback
            ~connection:(new D_bus_connection.d_bus_connection connection))

    method get_client_address : unit -> string =
      fun () -> Raw.D_bus_server.get_client_address obj

    method get_flags : unit -> Enums.dbusserverflags =
      fun () -> Raw.D_bus_server.get_flags obj

    method get_guid : unit -> string = fun () -> Raw.D_bus_server.get_guid obj
    method is_active : unit -> bool = fun () -> Raw.D_bus_server.is_active obj
    method start : unit -> unit = fun () -> Raw.D_bus_server.start obj
    method stop : unit -> unit = fun () -> Raw.D_bus_server.stop obj
    method address = Raw.D_bus_server.get_address obj

    method authentication_observer =
      new D_bus_auth_observer.d_bus_auth_observer
        (Raw.D_bus_server.get_authentication_observer obj)

    method as_d_bus_server = obj
  end

let new_sync (address : string) (flags : Enums.dbusserverflags) (guid : string)
    (observer : D_bus_auth_observer.d_bus_auth_observer_t option)
    (cancellable : Cancellable.cancellable_t option) :
    (d_bus_server_t, GError.t) result =
  let observer = Option.map (fun c -> c#as_d_bus_auth_observer) observer in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ =
    Raw.D_bus_server.new_sync address flags guid observer cancellable
  in
  Result.map (fun obj_ -> new d_bus_server obj_) obj_
