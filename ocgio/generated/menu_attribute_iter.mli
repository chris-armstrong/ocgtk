(** [GMenuAttributeIter] is an opaque structure type. You must access it using
    the functions below.

    Its methods, signals and properties are on
    {!class-type-menu_attribute_iter_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Menu_attribute_iter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MenuAttributeIter].}

    [GMenuAttributeIter] is an opaque structure type. You must access it using
    the functions below. *)
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

      [true] is returned on success, or [false] if there are no more attributes.

      You must call this function when you first acquire the iterator to advance
      it to the first attribute (and determine if the first attribute exists at
      all). *)

  (** {2:conversions Conversions} *)

  method as_menu_attribute_iter : Raw.Menu_attribute_iter.t
end

class menu_attribute_iter : Raw.Menu_attribute_iter.t -> menu_attribute_iter_t
(** Wraps a raw handle of {!Ocgio.Raw.Menu_attribute_iter.t}. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
