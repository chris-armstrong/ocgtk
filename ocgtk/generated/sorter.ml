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

(* High-level class for Sorter *)
class sorter (obj : Raw.Sorter.t) : sorter_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Sorter.on_changed ~after self#as_sorter ~callback

    method changed : Enums.sorterchange -> unit =
      fun change -> Raw.Sorter.changed obj change

    method compare :
        [ `object_ ] Gobject.obj -> [ `object_ ] Gobject.obj -> Enums.ordering =
      fun item1 item2 -> Raw.Sorter.compare obj item1 item2

    method get_order : unit -> Enums.sorterorder =
      fun () -> Raw.Sorter.get_order obj

    method as_sorter = obj
  end
