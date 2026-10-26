class type d_bus_object_manager_t = object
  method on_interface_added :
    ?after:bool ->
    callback:
      (object_:D_bus_interface_and__d_bus_object.d_bus_object_t ->
      interface:D_bus_interface_and__d_bus_object.d_bus_interface_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_interface_removed :
    ?after:bool ->
    callback:
      (object_:D_bus_interface_and__d_bus_object.d_bus_object_t ->
      interface:D_bus_interface_and__d_bus_object.d_bus_interface_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_object_added :
    ?after:bool ->
    callback:(object_:D_bus_interface_and__d_bus_object.d_bus_object_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_object_removed :
    ?after:bool ->
    callback:(object_:D_bus_interface_and__d_bus_object.d_bus_object_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_interface :
    string ->
    string ->
    D_bus_interface_and__d_bus_object.d_bus_interface_t option

  method get_object :
    string -> D_bus_interface_and__d_bus_object.d_bus_object_t option

  method get_object_path : unit -> string

  method get_objects :
    unit -> D_bus_interface_and__d_bus_object.d_bus_object_t list

  method as_d_bus_object_manager : Raw.D_bus_object_manager.t
end

class d_bus_object_manager :
  Raw.D_bus_object_manager.t ->
  d_bus_object_manager_t
