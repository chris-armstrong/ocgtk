class type d_bus_object_manager_t = object
  method on_interface_added :
    ?after:bool ->
    callback:
      (object_:GD_bus_interface_and__d_bus_object.d_bus_object_t option ->
      interface:GD_bus_interface_and__d_bus_object.d_bus_interface_t option ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_interface_removed :
    ?after:bool ->
    callback:
      (object_:GD_bus_interface_and__d_bus_object.d_bus_object_t option ->
      interface:GD_bus_interface_and__d_bus_object.d_bus_interface_t option ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_object_added :
    ?after:bool ->
    callback:
      (object_:GD_bus_interface_and__d_bus_object.d_bus_object_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_object_removed :
    ?after:bool ->
    callback:
      (object_:GD_bus_interface_and__d_bus_object.d_bus_object_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_interface :
    string ->
    string ->
    GD_bus_interface_and__d_bus_object.d_bus_interface_t option

  method get_object :
    string -> GD_bus_interface_and__d_bus_object.d_bus_object_t option

  method get_object_path : unit -> string

  method get_objects :
    unit -> GD_bus_interface_and__d_bus_object.d_bus_object_t list

  method as_d_bus_object_manager : D_bus_object_manager.t
end

class d_bus_object_manager : D_bus_object_manager.t -> d_bus_object_manager_t
