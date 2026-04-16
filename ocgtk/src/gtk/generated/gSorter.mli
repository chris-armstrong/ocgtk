class type sorter_t = object
  inherit Gsorter_signals.sorter_signals
  method changed : Gtk_enums.sorterchange -> unit

  method compare :
    [ `object_ ] Gobject.obj -> [ `object_ ] Gobject.obj -> Gtk_enums.ordering

  method get_order : unit -> Gtk_enums.sorterorder
  method as_sorter : Sorter.t
end

class sorter : Sorter.t -> sorter_t
