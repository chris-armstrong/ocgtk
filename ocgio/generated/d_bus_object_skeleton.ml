class type d_bus_object_skeleton_t = object
  inherit D_bus_interface_and__d_bus_object.d_bus_object_t

  method on_authorize_method :
    ?after:bool ->
    callback:
      (interface:D_bus_interface_skeleton.d_bus_interface_skeleton_t ->
      invocation:D_bus_method_invocation.d_bus_method_invocation_t ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method add_interface :
    D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit
  (** Adds [interface_] to [object].

      If [object] already contains a [GDBusInterfaceSkeleton] with the same
      interface name, it is removed before [interface_] is added.

      Note that [object] takes its own reference on [interface_] and holds it
      until removed. *)

  method flush : unit -> unit
  (** This method simply calls g_dbus_interface_skeleton_flush() on all
      interfaces belonging to [object]. See that method for when flushing is
      useful. *)

  method remove_interface :
    D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit
  (** Removes [interface_] from [object]. *)

  method remove_interface_by_name : string -> unit
  (** Removes the [GDBusInterface] with [interface_name] from [object].

      If no D-Bus interface of the given interface exists, this function does
      nothing. *)

  method set_object_path : string -> unit
  (** Sets the object path for [object]. *)

  method g_object_path : string
  method set_g_object_path : string -> unit
  method as_d_bus_object_skeleton : Raw.D_bus_object_skeleton.t
end

(* High-level class for DBusObjectSkeleton *)
class d_bus_object_skeleton (obj : Raw.D_bus_object_skeleton.t) :
  d_bus_object_skeleton_t =
  object (self)
    inherit
      D_bus_interface_and__d_bus_object.d_bus_object
        (Raw.D_bus_object.from_gobject obj)

    method on_authorize_method ?(after = false) ~callback () =
      Raw.D_bus_object_skeleton.on_authorize_method ~after
        self#as_d_bus_object_skeleton ~callback:(fun ~interface ~invocation ->
          callback
            ~interface:
              (new D_bus_interface_skeleton.d_bus_interface_skeleton interface)
            ~invocation:
              (new D_bus_method_invocation.d_bus_method_invocation invocation))

    method add_interface :
        D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit =
      fun interface_ ->
        let interface_ = interface_#as_d_bus_interface_skeleton in
        Raw.D_bus_object_skeleton.add_interface obj interface_

    method flush : unit -> unit = fun () -> Raw.D_bus_object_skeleton.flush obj

    method remove_interface :
        D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit =
      fun interface_ ->
        let interface_ = interface_#as_d_bus_interface_skeleton in
        Raw.D_bus_object_skeleton.remove_interface obj interface_

    method remove_interface_by_name : string -> unit =
      fun interface_name ->
        Raw.D_bus_object_skeleton.remove_interface_by_name obj interface_name

    method set_object_path : string -> unit =
      fun object_path ->
        Raw.D_bus_object_skeleton.set_object_path obj object_path

    method g_object_path = Raw.D_bus_object_skeleton.get_g_object_path obj

    method set_g_object_path v =
      Raw.D_bus_object_skeleton.set_g_object_path obj v

    method as_d_bus_object_skeleton = obj
  end

let new_ (object_path : string) : d_bus_object_skeleton_t =
  let obj_ = Raw.D_bus_object_skeleton.new_ object_path in
  new d_bus_object_skeleton obj_
