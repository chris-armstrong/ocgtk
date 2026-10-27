(** A [PangoAttrList] represents a list of attributes that apply to a section of
    text.

    The attributes in a [PangoAttrList] are, in general, allowed to overlap in
    an arbitrary fashion. However, if the attributes are manipulated only
    through [Pango.AttrList.change], the overlap between properties will meet
    stricter criteria.

    Since the [PangoAttrList] structure is stored as a linear list, it is not
    suitable for storing attributes for large amounts of text. In general, you
    should not use a single [PangoAttrList] for more than one paragraph of text.

    Its methods, signals and properties are on {!class-type-attr_list_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_list}. *)

(** The methods, signals and properties of a [PangoAttrList]. *)
class type attr_list_t = object
  method change : Raw.Attribute.t -> unit
  method equal : Raw.Attr_list.t -> bool
  method get_attributes : unit -> Raw.Attribute.t list
  method get_iterator : unit -> Raw.Attr_iterator.t
  method insert : Raw.Attribute.t -> unit
  method insert_before : Raw.Attribute.t -> unit
  method ref : unit -> Raw.Attr_list.t
  method splice : Raw.Attr_list.t -> int -> int -> unit
  method to_string : unit -> string
  method update : int -> int -> int -> unit
  method as_attr_list : Raw.Attr_list.t
end

class attr_list : Raw.Attr_list.t -> attr_list_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attr_list.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoAttrList], give one already wrapped. *)

val new_ : unit -> attr_list_t
