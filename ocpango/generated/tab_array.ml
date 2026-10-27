class type tab_array_t = object
  method get_decimal_point : int -> int
  (** Gets the Unicode character to use as decimal point.

      This is only relevant for tabs with [PANGO_TAB_DECIMAL] alignment, which
      align content at the first occurrence of the decimal point character.

      The default value of 0 means that Pango will use the decimal point
      according to the current locale. *)

  method get_positions_in_pixels : unit -> bool
  (** Returns [TRUE] if the tab positions are in pixels, [FALSE] if they are in
      Pango units. *)

  method get_size : unit -> int
  (** Gets the number of tab stops in [tab_array]. *)

  method resize : int -> unit
  (** Resizes a tab array.

      You must subsequently initialize any tabs that were added as a result of
      growing the array. *)

  method set_decimal_point : int -> int -> unit
  (** Sets the Unicode character to use as decimal point.

      This is only relevant for tabs with [PANGO_TAB_DECIMAL] alignment, which
      align content at the first occurrence of the decimal point character.

      By default, Pango uses the decimal point according to the current locale.
  *)

  method set_positions_in_pixels : bool -> unit
  (** Sets whether positions in this array are specified in pixels. *)

  method set_tab : int -> Enums.tabalign -> int -> unit
  (** Sets the alignment and location of a tab stop. *)

  method sort : unit -> unit
  (** Utility function to ensure that the tab stops are in increasing order. *)

  method to_string : unit -> string
  (** Serializes a [PangoTabArray] to a string.

      In the resulting string, serialized tabs are separated by newlines or
      commas.

      Individual tabs are serialized to a string of the form

      \[ALIGNMENT:\]POSITION\[:DECIMAL_POINT\]

      Where ALIGNMENT is one of _left_, _right_, _center_ or _decimal_, and
      POSITION is the position of the tab, optionally followed by the unit _px_.
      If ALIGNMENT is omitted, it defaults to _left_. If ALIGNMENT is _decimal_,
      the DECIMAL_POINT character may be specified as a Unicode codepoint.

      Note that all tabs in the array must use the same unit.

      A typical example:

      100px 200px center:300px right:400px *)

  method as_tab_array : Raw.Tab_array.t
end

(* High-level class for TabArray *)
class tab_array (obj : Raw.Tab_array.t) : tab_array_t =
  object (self)
    method get_decimal_point : int -> int =
      fun tab_index -> Raw.Tab_array.get_decimal_point obj tab_index

    method get_positions_in_pixels : unit -> bool =
      fun () -> Raw.Tab_array.get_positions_in_pixels obj

    method get_size : unit -> int = fun () -> Raw.Tab_array.get_size obj

    method resize : int -> unit =
      fun new_size -> Raw.Tab_array.resize obj new_size

    method set_decimal_point : int -> int -> unit =
      fun tab_index decimal_point ->
        Raw.Tab_array.set_decimal_point obj tab_index decimal_point

    method set_positions_in_pixels : bool -> unit =
      fun positions_in_pixels ->
        Raw.Tab_array.set_positions_in_pixels obj positions_in_pixels

    method set_tab : int -> Enums.tabalign -> int -> unit =
      fun tab_index alignment location ->
        Raw.Tab_array.set_tab obj tab_index alignment location

    method sort : unit -> unit = fun () -> Raw.Tab_array.sort obj
    method to_string : unit -> string = fun () -> Raw.Tab_array.to_string obj
    method as_tab_array = obj
  end

let new_ (initial_size : int) (positions_in_pixels : bool) : tab_array_t =
  let obj_ = Raw.Tab_array.new_ initial_size positions_in_pixels in
  new tab_array obj_
