class type item_t = object
  (** {2:methods Methods} *)

  method apply_attrs : Raw.Attr_iterator.t -> unit
  (** Add attributes to a [PangoItem].

      The idea is that you have attributes that don't affect itemization, such
      as font features, so you filter them out using [Pango.AttrList.filter],
      itemize your text, then reapply the attributes to the resulting items
      using this function.

      The [iter] should be positioned before the range of the item, and will be
      advanced past it. This function is meant to be called in a loop over the
      items resulting from itemization, while passing the iter to each call. *)

  method get_char_offset : unit -> int
  (** Returns the character offset of the item from the beginning of the
      itemized text.

      If the item has not been obtained from Pango's itemization machinery, then
      the character offset is not available. In that case, this function returns
      -1. *)

  method split : int -> int -> Raw.Item.t
  (** Modifies [orig] to cover only the text after [split_index], and returns a
      new item that covers the text before [split_index] that used to be in
      [orig].

      You can think of [split_index] as the length of the returned item.
      [split_index] may not be 0, and it may not be greater than or equal to the
      length of [orig] (that is, there must be at least one byte assigned to
      each item, you can't create a zero-length item). [split_offset] is the
      length of the first item in chars, and must be provided because the text
      used to generate the item isn't available, so [pango_item_split()] can't
      count the char length of the split items itself. *)

  (** {2:conversions Conversions} *)

  method as_item : Raw.Item.t
end

(* High-level class for Item *)
class item (obj : Raw.Item.t) : item_t =
  object (self)
    method apply_attrs : Raw.Attr_iterator.t -> unit =
      fun iter -> Raw.Item.apply_attrs obj iter

    method get_char_offset : unit -> int =
      fun () -> Raw.Item.get_char_offset obj

    method split : int -> int -> Raw.Item.t =
      fun split_index split_offset ->
        Raw.Item.split obj split_index split_offset

    method as_item = obj
  end

let new_ () : item_t = new item (Raw.Item.new_ ())
