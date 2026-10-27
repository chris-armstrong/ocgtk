(** [GMenuAttributeIter] is an opaque structure type. You must access it using
    the functions below.

    Its methods, signals and properties are on
    {!class-type-menu_attribute_iter_t}. The functions it is built on are in
    {!Ocgio.Raw.Menu_attribute_iter}. *)

(** The methods, signals and properties of a [GMenuAttributeIter]. *)
class type menu_attribute_iter_t = object
  method get_name : unit -> string
  method get_value : unit -> Gvariant.t
  method next : unit -> bool
  method as_menu_attribute_iter : Raw.Menu_attribute_iter.t
end

class menu_attribute_iter : Raw.Menu_attribute_iter.t -> menu_attribute_iter_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Menu_attribute_iter.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GMenuAttributeIter], give one already wrapped. *)
