class type sorter_t = object
  method on_changed :
    callback:(change:Gtk_enums.sorterchange -> unit) ->
    Gobject.Signal.handler_id

  method changed : Gtk_enums.sorterchange -> unit

  method compare :
    [ `object_ ] Gobject.obj -> [ `object_ ] Gobject.obj -> Gtk_enums.ordering

  method get_order : unit -> Gtk_enums.sorterorder
  method as_sorter : Sorter.t
end

class sorter : Sorter.t -> sorter_t
