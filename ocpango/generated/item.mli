(** The [PangoItem] structure stores information about a segment of text.

    You typically obtain [PangoItems] by itemizing a piece of text with
    [itemize].

    Its methods, signals and properties are on {!class-type-item_t}. The
    functions it is built on are in {!Ocpango.Raw.Item}. *)

(** The methods, signals and properties of a [PangoItem]. *)
class type item_t = object
  method apply_attrs : Raw.Attr_iterator.t -> unit
  method get_char_offset : unit -> int
  method split : int -> int -> Raw.Item.t
  method as_item : Raw.Item.t
end

class item : Raw.Item.t -> item_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Item.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoItem], give one already wrapped. *)

val new_ : unit -> item_t
