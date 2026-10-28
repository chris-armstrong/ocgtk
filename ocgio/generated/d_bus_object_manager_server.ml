class type d_bus_object_manager_server_t = object
  inherit D_bus_object_manager.d_bus_object_manager_t

  (** {2:methods Methods} *)

  method export : D_bus_object_skeleton.d_bus_object_skeleton_t -> unit
  (** Exports [object] on [manager].

      If there is already a [GDBusObject] exported at the object path, then the
      old object is removed.

      The object path for [object] must be in the hierarchy rooted by the object
      path for [manager].

      Note that [manager] will take a reference on [object] for as long as it is
      exported. *)

  method export_uniquely : D_bus_object_skeleton.d_bus_object_skeleton_t -> unit
  (** Like g_dbus_object_manager_server_export() but appends a string of the
      form _N (with N being a natural number) to [object]'s object path if an
      object with the given path already exists. As such, the
      [GDBusObjectProxy:g]-object-path property of [object] may be modified. *)

  method get_connection : unit -> D_bus_connection.d_bus_connection_t option
  (** Gets the [GDBusConnection] used by [manager]. *)

  method is_exported : D_bus_object_skeleton.d_bus_object_skeleton_t -> bool
  (** Returns whether [object] is currently exported on [manager]. *)

  method set_connection : D_bus_connection.d_bus_connection_t option -> unit
  (** Exports all objects managed by [manager] on [connection]. If [connection]
      is [None], stops exporting objects. *)

  method unexport : string -> bool
  (** If [manager] has an object at [path], removes the object. Otherwise does
      nothing.

      Note that [object_path] must be in the hierarchy rooted by the object path
      for [manager]. *)

  (** {2:properties Properties} *)

  method object_path : string
  (** The object path to register the manager object at. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_object_manager_server : Raw.D_bus_object_manager_server.t
end

(* High-level class for DBusObjectManagerServer *)
class d_bus_object_manager_server (obj : Raw.D_bus_object_manager_server.t) :
  d_bus_object_manager_server_t =
  object (self)
    inherit
      D_bus_object_manager.d_bus_object_manager
        (Raw.D_bus_object_manager.from_gobject obj)

    method export : D_bus_object_skeleton.d_bus_object_skeleton_t -> unit =
      fun object_ ->
        let object_ = object_#as_d_bus_object_skeleton in
        Raw.D_bus_object_manager_server.export obj object_

    method export_uniquely :
        D_bus_object_skeleton.d_bus_object_skeleton_t -> unit =
      fun object_ ->
        let object_ = object_#as_d_bus_object_skeleton in
        Raw.D_bus_object_manager_server.export_uniquely obj object_

    method get_connection : unit -> D_bus_connection.d_bus_connection_t option =
      fun () ->
        Option.map
          (fun ret -> new D_bus_connection.d_bus_connection ret)
          (Raw.D_bus_object_manager_server.get_connection obj)

    method is_exported : D_bus_object_skeleton.d_bus_object_skeleton_t -> bool =
      fun object_ ->
        let object_ = object_#as_d_bus_object_skeleton in
        Raw.D_bus_object_manager_server.is_exported obj object_

    method set_connection : D_bus_connection.d_bus_connection_t option -> unit =
      fun connection ->
        let connection =
          Option.map (fun c -> c#as_d_bus_connection) connection
        in
        Raw.D_bus_object_manager_server.set_connection obj connection

    method unexport : string -> bool =
      fun object_path ->
        Raw.D_bus_object_manager_server.unexport obj object_path

    method object_path = Raw.D_bus_object_manager_server.get_object_path obj
    method as_d_bus_object_manager_server = obj
  end

let new_ (object_path : string) : d_bus_object_manager_server_t =
  let obj_ = Raw.D_bus_object_manager_server.new_ object_path in
  new d_bus_object_manager_server obj_
