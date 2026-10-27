(** Iterates over the elements of a [Gtk.Bitset].

    `GtkBitSetIter is an opaque, stack-allocated struct.

    Before a [GtkBitsetIter] can be used, it needs to be initialized with
    [Gtk.BitsetIter.init_first], [Gtk.BitsetIter.init_last] or
    [Gtk.BitsetIter.init_at].

    Its methods, signals and properties are on {!class-type-bitset_iter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Bitset_iter}. *)

(** The methods, signals and properties of a [GtkBitsetIter]. *)
class type bitset_iter_t = object
  method get_value : unit -> int
  method is_valid : unit -> bool
  method as_bitset_iter : Raw.Bitset_iter.t
end

class bitset_iter : Raw.Bitset_iter.t -> bitset_iter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Bitset_iter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBitsetIter], give one already wrapped. *)
