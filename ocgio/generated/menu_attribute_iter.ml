class type menu_attribute_iter_t = object
  (** {2:methods Methods} *)

  method get_name : unit -> string
  (** Gets the name of the attribute at the current iterator position, as a
      string.

      The iterator is not advanced. *)

  method get_value : unit -> Gvariant.t
  (** Gets the value of the attribute at the current iterator position.

      The iterator is not advanced. *)

  method next : unit -> bool
  (** Attempts to advance the iterator to the next (possibly first) attribute.

      [TRUE] is returned on success, or [FALSE] if there are no more attributes.

      You must call this function when you first acquire the iterator to advance
      it to the first attribute (and determine if the first attribute exists at
      all). *)

  (** {2:conversions Conversions} *)

  method as_menu_attribute_iter : Raw.Menu_attribute_iter.t
end

(* High-level class for MenuAttributeIter *)
class menu_attribute_iter (obj : Raw.Menu_attribute_iter.t) :
  menu_attribute_iter_t =
  object (self)
    method get_name : unit -> string =
      fun () -> Raw.Menu_attribute_iter.get_name obj

    method get_value : unit -> Gvariant.t =
      fun () -> Raw.Menu_attribute_iter.get_value obj

    method next : unit -> bool = fun () -> Raw.Menu_attribute_iter.next obj
    method as_menu_attribute_iter = obj
  end
