(** The [PangoAttrString] structure is used to represent attributes with a
    string value.

    Its methods, signals and properties are on {!class-type-attr_string_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_string}. *)

(** The methods, signals and properties of a [AttrString]. *)
class type attr_string_t = object
  method as_attr_string : Raw.Attr_string.t
end

class attr_string : Raw.Attr_string.t -> attr_string_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_string.t}. *)
