(** A set of unsigned integers.

    Another name for this data structure is “bitmap”.

    The current implementation is based on
    {{:https://roaringbitmap.org/}roaring bitmaps}.

    A bitset allows adding a set of integers and provides support for set
    operations like unions, intersections and checks for equality or if a value
    is contained in the set. [GtkBitset] also contains various functions to
    query metadata about the bitset, such as the minimum or maximum values or
    its size.

    The fastest way to iterate values in a bitset is [Gtk.BitsetIter].

    The main use case for [GtkBitset] is implementing complex selections for
    [Gtk.SelectionModel].

    Its methods, signals and properties are on {!class-type-bitset_t}. The
    functions it is built on are in {!Ocgtk.Raw.Bitset}. *)

(** The methods, signals and properties of a [GtkBitset]. *)
class type bitset_t = object
  method add : int -> bool
  (** Adds [value] to [self] if it wasn't part of it before. *)

  method add_range : int -> int -> unit
  (** Adds all values from [start] (inclusive) to [start] + [n_items]
      (exclusive) in [self]. *)

  method add_range_closed : int -> int -> unit
  (** Adds the closed range \[[first], [last]\], so [first], [last] and all
      values in between. [first] must be smaller than [last]. *)

  method add_rectangle : int -> int -> int -> int -> unit
  (** Interprets the values as a 2-dimensional boolean grid with the given
      [stride] and inside that grid, adds a rectangle with the given [width] and
      [height]. *)

  method contains : int -> bool
  (** Checks if the given [value] has been added to [self] *)

  method difference : Raw.Bitset.t -> unit
  (** Sets [self] to be the symmetric difference of [self] and [other].

      The symmetric difference is set [self] to contain all values that were
      either contained in [self] or in [other], but not in both. This operation
      is also called an XOR.

      It is allowed for [self] and [other] to be the same bitset. The bitset
      will be emptied in that case. *)

  method equals : Raw.Bitset.t -> bool
  (** Returns [TRUE] if [self] and [other] contain the same values. *)

  method get_maximum : unit -> int
  (** Returns the largest value in [self].

      If [self] is empty, 0 is returned. *)

  method get_minimum : unit -> int
  (** Returns the smallest value in [self].

      If [self] is empty, [G_MAXUINT] is returned. *)

  method get_nth : int -> int
  (** Returns the value of the [nth] item in self.

      If [nth] is >= the size of [self], 0 is returned. *)

  method get_size : unit -> UInt64.t
  (** Gets the number of values that were added to the set.

      For example, if the set is empty, 0 is returned.

      Note that this function returns a [guint64], because when all values are
      set, the return value is [G_MAXUINT + 1]. Unless you are sure this cannot
      happen (it can't with [GListModel]), be sure to use a 64bit type. *)

  method get_size_in_range : int -> int -> UInt64.t
  (** Gets the number of values that are part of the set from [first] to [last]
      (inclusive).

      Note that this function returns a [guint64], because when all values are
      set, the return value is [G_MAXUINT + 1]. Unless you are sure this cannot
      happen (it can't with [GListModel]), be sure to use a 64bit type. *)

  method intersect : Raw.Bitset.t -> unit
  (** Sets [self] to be the intersection of [self] and [other].

      In other words, remove all values from [self] that are not part of
      [other].

      It is allowed for [self] and [other] to be the same bitset. Nothing will
      happen in that case. *)

  method is_empty : unit -> bool
  (** Check if no value is contained in bitset. *)

  method ref : unit -> Raw.Bitset.t
  (** Acquires a reference on the given [GtkBitset]. *)

  method remove : int -> bool
  (** Removes [value] from [self] if it was part of it before. *)

  method remove_all : unit -> unit
  (** Removes all values from the bitset so that it is empty again. *)

  method remove_range : int -> int -> unit
  (** Removes all values from [start] (inclusive) to [start] + [n_items]
      (exclusive) in [self]. *)

  method remove_range_closed : int -> int -> unit
  (** Removes the closed range \[[first], [last]\], so [first], [last] and all
      values in between. [first] must be smaller than [last]. *)

  method remove_rectangle : int -> int -> int -> int -> unit
  (** Interprets the values as a 2-dimensional boolean grid with the given
      [stride] and inside that grid, removes a rectangle with the given [width]
      and [height]. *)

  method shift_left : int -> unit
  (** Shifts all values in [self] to the left by [amount].

      Values smaller than [amount] are discarded. *)

  method shift_right : int -> unit
  (** Shifts all values in [self] to the right by [amount].

      Values that end up too large to be held in a #guint are discarded. *)

  method splice : int -> int -> int -> unit
  [@@ocaml.doc
    "This is a support function for [GListModel] handling, by mirroring\n\
     the [GlistModel::items-changed] signal.\n\n\
     First, it \"cuts\" the values from [position] to [removed] from\n\
     the bitset. That is, it removes all those values and shifts\n\
     all larger values to the left by [removed] places.\n\n\
     Then, it \"pastes\" new room into the bitset by shifting all values\n\
     larger than [position] by [added] spaces to the right. This frees\n\
     up space that can then be filled."]

  method subtract : Raw.Bitset.t -> unit
  (** Sets [self] to be the subtraction of [other] from [self].

      In other words, remove all values from [self] that are part of [other].

      It is allowed for [self] and [other] to be the same bitset. The bitset
      will be emptied in that case. *)

  method union : Raw.Bitset.t -> unit
  (** Sets [self] to be the union of [self] and [other].

      That is, add all values from [other] into [self] that weren't part of it.

      It is allowed for [self] and [other] to be the same bitset. Nothing will
      happen in that case. *)

  method as_bitset : Raw.Bitset.t
end

class bitset : Raw.Bitset.t -> bitset_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Bitset.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBitset], give one already wrapped. *)

val new_empty : unit -> bitset_t
val new_range : int -> int -> bitset_t
