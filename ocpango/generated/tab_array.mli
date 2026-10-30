(** A [PangoTabArray] contains an array of tab stops.

    Its methods, signals and properties are on {!class-type-tab_array_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Tab_array}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TabArray].}

    A [PangoTabArray] contains an array of tab stops.

    [PangoTabArray] can be used to set tab stops in a [PangoLayout]. Each tab
    stop has an alignment, a position, and optionally a character to use as
    decimal point. *)
class type tab_array_t = object
  (** {2:methods Methods} *)

  method get_decimal_point : int -> int
  (** Gets the Unicode character to use as decimal point.

      This is only relevant for tabs with [PANGO_TAB_DECIMAL] alignment, which
      align content at the first occurrence of the decimal point character.

      The default value of 0 means that Pango will use the decimal point
      according to the current locale. *)

  method get_positions_in_pixels : unit -> bool
  (** Returns [true] if the tab positions are in pixels, [false] if they are in
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

  (** {2:conversions Conversions} *)

  method as_tab_array : Raw.Tab_array.t
end

class tab_array : Raw.Tab_array.t -> tab_array_t
(** Wraps a raw handle of {!Ocpango.Raw.Tab_array.t}. *)

(** {1:description Description}

    A [PangoTabArray] contains an array of tab stops.

    [PangoTabArray] can be used to set tab stops in a [PangoLayout]. Each tab
    stop has an alignment, a position, and optionally a character to use as
    decimal point. *)

(** {1:constructors Constructors} *)

val new_ : int -> bool -> tab_array_t
(** Creates an array of [initial_size] tab stops.

    Tab stops are specified in pixel units if [positions_in_pixels] is [true],
    otherwise in Pango units. All stops are initially at position 0. *)
