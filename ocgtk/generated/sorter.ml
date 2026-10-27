class type sorter_t = object
  method on_changed :
    ?after:bool ->
    callback:(change:Enums.sorterchange -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method changed : Enums.sorterchange -> unit
  (** Notifies all users of the sorter that it has changed.

      This emits the [Gtk.Sorter::changed] signal. Users of the sorter should
      then update the sort order via [Gtk.Sorter.compare].

      Depending on the [change] parameter, it may be possible to update the sort
      order without a full resorting. Refer to the [Gtk.SorterChange]
      documentation for details.

      This function is intended for implementers of [GtkSorter] subclasses and
      should not be called from other functions. *)

  method compare :
    [ `object_ ] Gobject.obj -> [ `object_ ] Gobject.obj -> Enums.ordering
  (** Compares two given items according to the sort order implemented by the
      sorter.

      Sorters implement a partial order:

      - It is reflexive, ie a = a
      - It is antisymmetric, ie if a < b and b < a, then a = b
      - It is transitive, ie given any 3 items with a ≤ b and b ≤ c, then a ≤ c

      The sorter may signal it conforms to additional constraints via the return
      value of [Gtk.Sorter.get_order]. *)

  method get_order : unit -> Enums.sorterorder
  (** Gets the order that [self] conforms to.

      See [Gtk.SorterOrder] for details of the possible return values.

      This function is intended to allow optimizations. *)

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
