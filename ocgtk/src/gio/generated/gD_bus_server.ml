(* Signal class defined in gd_bus_server_signals.ml *)

class type d_bus_server_t = object
    inherit Gd_bus_server_signals.d_bus_server_signals
    method get_client_address : unit -> string
    method get_flags : unit -> Gio_enums.dbusserverflags
    method get_guid : unit -> string
    method is_active : unit -> bool
    method start : unit -> unit
    method stop : unit -> unit
    method active : bool
    method address : string
    method authentication_observer : GD_bus_auth_observer.d_bus_auth_observer_t
    method as_d_bus_server : D_bus_server.t
end

(* High-level class for DBusServer *)
class d_bus_server (obj : D_bus_server.t) : d_bus_server_t = object (self)
  inherit Gd_bus_server_signals.d_bus_server_signals obj

  method get_client_address : unit -> string =
    fun () ->
      (D_bus_server.get_client_address obj)

  method get_flags : unit -> Gio_enums.dbusserverflags =
    fun () ->
      (D_bus_server.get_flags obj)

  method get_guid : unit -> string =
    fun () ->
      (D_bus_server.get_guid obj)

  method is_active : unit -> bool =
    fun () ->
      (D_bus_server.is_active obj)

  method start : unit -> unit =
    fun () ->
      (D_bus_server.start obj)

  method stop : unit -> unit =
    fun () ->
      (D_bus_server.stop obj)

  method active = D_bus_server.get_active obj

  method address = D_bus_server.get_address obj

  method authentication_observer = new GD_bus_auth_observer.d_bus_auth_observer (D_bus_server.get_authentication_observer obj)

    method as_d_bus_server = obj
end

let new_sync (address : string) (flags : Gio_enums.dbusserverflags) (guid : string) (observer : GD_bus_auth_observer.d_bus_auth_observer_t option) (cancellable : GCancellable.cancellable_t option) : (d_bus_server_t, GError.t) result =
  let observer = Option.map (fun c -> c#as_d_bus_auth_observer) observer in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = D_bus_server.new_sync address flags guid observer cancellable in
Result.map (fun obj_ ->  new d_bus_server obj_) obj_

