class type d_bus_object_manager_t = object
  method on_interface_added :
    callback:
      (object_:
         D_bus_interface_and__d_bus_object.D_bus_object.t Gobject.obj option ->
      interface:
        D_bus_interface_and__d_bus_object.D_bus_interface.t Gobject.obj option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_interface_removed :
    callback:
      (object_:
         D_bus_interface_and__d_bus_object.D_bus_object.t Gobject.obj option ->
      interface:
        D_bus_interface_and__d_bus_object.D_bus_interface.t Gobject.obj option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_object_added :
    callback:
      (object_:
         D_bus_interface_and__d_bus_object.D_bus_object.t Gobject.obj option ->
      unit) ->
    Gobject.Signal.handler_id

  method on_object_removed :
    callback:
      (object_:
         D_bus_interface_and__d_bus_object.D_bus_object.t Gobject.obj option ->
      unit) ->
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
