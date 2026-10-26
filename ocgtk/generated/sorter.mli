class type sorter_t = object
  method on_changed :
    ?after:bool ->
    callback:(change:Enums.sorterchange -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method changed : Enums.sorterchange -> unit

  method compare :
    [ `object_ ] Gobject.obj -> [ `object_ ] Gobject.obj -> Enums.ordering

  method get_order : unit -> Enums.sorterorder
  method as_sorter : Raw.Sorter.t
end

class sorter : Raw.Sorter.t -> sorter_t
