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

(* High-level class for Sorter *)
class sorter (obj : Sorter.t) : sorter_t =
  object (self)
    method on_changed ~callback = Sorter.on_changed self#as_sorter ~callback

    method changed : Gtk_enums.sorterchange -> unit =
      fun change -> Sorter.changed obj change

    method compare :
        [ `object_ ] Gobject.obj ->
        [ `object_ ] Gobject.obj ->
        Gtk_enums.ordering =
      fun item1 item2 -> Sorter.compare obj item1 item2

    method get_order : unit -> Gtk_enums.sorterorder =
      fun () -> Sorter.get_order obj

    method as_sorter = obj
  end
