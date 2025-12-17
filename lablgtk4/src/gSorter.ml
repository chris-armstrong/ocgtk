(* Signal class defined in gsorter_signals.ml *)

(* High-level class for Sorter *)
class sorter (obj : Sorter.t) = object (self)
  inherit Gsorter_signals.sorter_signals obj

  method changed : Gtk_enums.sorterchange -> unit = fun change -> (Sorter.changed obj change)

  method get_order : unit -> Gtk_enums.sorterorder = fun () -> (Sorter.get_order obj )

    method as_sorter = obj
end

