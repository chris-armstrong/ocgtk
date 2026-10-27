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
  method add_range : int -> int -> unit
  method add_range_closed : int -> int -> unit
  method add_rectangle : int -> int -> int -> int -> unit
  method contains : int -> bool
  method difference : Raw.Bitset.t -> unit
  method equals : Raw.Bitset.t -> bool
  method get_maximum : unit -> int
  method get_minimum : unit -> int
  method get_nth : int -> int
  method get_size : unit -> UInt64.t
  method get_size_in_range : int -> int -> UInt64.t
  method intersect : Raw.Bitset.t -> unit
  method is_empty : unit -> bool
  method ref : unit -> Raw.Bitset.t
  method remove : int -> bool
  method remove_all : unit -> unit
  method remove_range : int -> int -> unit
  method remove_range_closed : int -> int -> unit
  method remove_rectangle : int -> int -> int -> int -> unit
  method shift_left : int -> unit
  method shift_right : int -> unit
  method splice : int -> int -> int -> unit
  method subtract : Raw.Bitset.t -> unit
  method union : Raw.Bitset.t -> unit
  method as_bitset : Raw.Bitset.t
end

class bitset : Raw.Bitset.t -> bitset_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Bitset.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBitset], give one already wrapped. *)

val new_empty : unit -> bitset_t
val new_range : int -> int -> bitset_t
