(* Signal class defined in gsorter_signals.ml *)

class type sorter_t = object
    inherit Gsorter_signals.sorter_signals
    method changed : Gtk_enums.sorterchange -> unit
    method get_order : unit -> Gtk_enums.sorterorder
    method as_sorter : Sorter.t
end

(* High-level class for Sorter *)
class sorter (obj : Sorter.t) : sorter_t = object (self)
  inherit Gsorter_signals.sorter_signals obj

  method changed : Gtk_enums.sorterchange -> unit =
    fun change ->
      (Sorter.changed obj change)

  method get_order : unit -> Gtk_enums.sorterorder =
    fun () ->
      (Sorter.get_order obj)

    method as_sorter = obj
end

