(** A [PangoAttrList] represents a list of attributes that apply to a section of
    text.

    The attributes in a [PangoAttrList] are, in general, allowed to overlap in
    an arbitrary fashion. However, if the attributes are manipulated only
    through [Pango.AttrList.change], the overlap between properties will meet
    stricter criteria.

    Since the [PangoAttrList] structure is stored as a linear list, it is not
    suitable for storing attributes for large amounts of text. In general, you
    should not use a single [PangoAttrList] for more than one paragraph of text.

    Its methods, signals and properties are on {!class-type-attr_list_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocpango.Raw.Attr_list}. *)

(** {b The methods, signals and properties of a [AttrList].}

    A [PangoAttrList] represents a list of attributes that apply to a section of
    text.

    The attributes in a [PangoAttrList] are, in general, allowed to overlap in
    an arbitrary fashion. However, if the attributes are manipulated only
    through [Pango.AttrList.change], the overlap between properties will meet
    stricter criteria.

    Since the [PangoAttrList] structure is stored as a linear list, it is not
    suitable for storing attributes for large amounts of text. In general, you
    should not use a single [PangoAttrList] for more than one paragraph of text.
*)
class type attr_list_t = object
  method change : Raw.Attribute.t -> unit
  (** Insert the given attribute into the [PangoAttrList].

      It will replace any attributes of the same type on that segment and be
      merged with any adjoining attributes that are identical.

      This function is slower than [Pango.AttrList.insert] for creating an
      attribute list in order (potentially much slower for large lists).
      However, [Pango.AttrList.insert] is not suitable for continually changing
      a set of attributes since it never removes or combines existing
      attributes. *)

  method equal : Raw.Attr_list.t -> bool
  (** Checks whether [list] and [other_list] contain the same attributes and
      whether those attributes apply to the same ranges.

      Beware that this will return wrong values if any list contains duplicates.
  *)

  method get_attributes : unit -> Raw.Attribute.t list
  (** Gets a list of all attributes in [list]. *)

  method get_iterator : unit -> Raw.Attr_iterator.t
  (** Create a iterator initialized to the beginning of the list.

      [list] must not be modified until this iterator is freed. *)

  method insert : Raw.Attribute.t -> unit
  (** Insert the given attribute into the [PangoAttrList].

      It will be inserted after all other attributes with a matching
      [start_index]. *)

  method insert_before : Raw.Attribute.t -> unit
  (** Insert the given attribute into the [PangoAttrList].

      It will be inserted before all other attributes with a matching
      [start_index]. *)

  method ref : unit -> Raw.Attr_list.t
  (** Increase the reference count of the given attribute list by one. *)

  method splice : Raw.Attr_list.t -> int -> int -> unit
  (** This function opens up a hole in [list], fills it in with attributes from
      the left, and then merges [other] on top of the hole.

      This operation is equivalent to stretching every attribute that applies at
      position [pos] in [list] by an amount [len], and then calling
      [Pango.AttrList.change] with a copy of each attribute in [other] in
      sequence (offset in position by [pos], and limited in length to [len]).

      This operation proves useful for, for instance, inserting a pre-edit
      string in the middle of an edit buffer.

      For backwards compatibility, the function behaves differently when [len]
      is 0. In this case, the attributes from [other] are not imited to [len],
      and are just overlayed on top of [list].

      This mode is useful for merging two lists of attributes together. *)

  method to_string : unit -> string
  [@@ocaml.doc
    "Serializes a [PangoAttrList] to a string.\n\n\
     In the resulting string, serialized attributes are separated by newlines \
     or commas.\n\
     Individual attributes are serialized to a string of the form\n\n\
     \\[START END\\] TYPE VALUE\n\n\
     Where START and END are the indices (with -1 being accepted in place\n\
     of MAXUINT), TYPE is the nickname of the attribute value type, e.g.\n\
     _weight_ or _stretch_, and the value is serialized according to its type:\n\n\
     Optionally, START and END can be omitted to indicate unlimited extent.\n\n\
     - enum values as nick or numeric value\n\
     - boolean values as _true_ or _false_\n\
     - integers and floats as numbers\n\
     - strings as string, optionally quoted\n\
     - font features as quoted string\n\
     - PangoLanguage as string\n\
     - PangoFontDescription as serialized by \
     [Pango.FontDescription.to_string], quoted\n\
     - PangoColor as serialized by [Pango.Color.to_string]\n\n\
     Examples:\n\n\
     0 10 foreground red, 5 15 weight bold, 0 200 font-desc \"Sans 10\"\n\n\
     0 -1 weight 700\n\
     0 100 family Times\n\n\
     weight bold\n\n\
     To parse the returned value, use [Pango.AttrList.from_string].\n\n\
     Note that shape attributes can not be serialized."]

  method update : int -> int -> int -> unit
  (** Update indices of attributes in [list] for a change in the text they refer
      to.

      The change that this function applies is removing [remove] bytes at
      position [pos] and inserting [add] bytes instead.

      Attributes that fall entirely in the ([pos], [pos] + [remove]) range are
      removed.

      Attributes that start or end inside the ([pos], [pos] + [remove]) range
      are shortened to reflect the removal.

      Attributes start and end positions are updated if they are behind [pos] +
      [remove]. *)

  method as_attr_list : Raw.Attr_list.t
end

class attr_list : Raw.Attr_list.t -> attr_list_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_list.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> attr_list_t
(** Create a new empty attribute list with a reference count of one. *)
