(** Iterates over the elements of a
    {{!Ocgtk.Bitset.class-type-bitset_t}[Gtk.Bitset]}.

    Its methods, signals and properties are on {!class-type-bitset_iter_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Bitset_iter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [BitsetIter].}

    Iterates over the elements of a
    {{!Ocgtk.Bitset.class-type-bitset_t}[Gtk.Bitset]}.

    `GtkBitSetIter is an opaque, stack-allocated struct.

    Before a [GtkBitsetIter] can be used, it needs to be initialized with
    [Gtk.BitsetIter.init_first], [Gtk.BitsetIter.init_last] or
    [Gtk.BitsetIter.init_at]. *)
class type bitset_iter_t = object
  (** {2:methods Methods} *)

  method get_value : unit -> int
  (** Gets the current value that [iter] points to.

      If [iter] is not valid and [Gtk.BitsetIter.is_valid] returns [false], this
      function returns 0. *)

  method is_valid : unit -> bool
  (** Checks if [iter] points to a valid value. *)

  (** {2:conversions Conversions} *)

  method as_bitset_iter : Raw.Bitset_iter.t
end

class bitset_iter : Raw.Bitset_iter.t -> bitset_iter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Bitset_iter.t}. *)

(** {1:description Description}

    Iterates over the elements of a
    {{!Ocgtk.Bitset.class-type-bitset_t}[Gtk.Bitset]}.

    `GtkBitSetIter is an opaque, stack-allocated struct.

    Before a [GtkBitsetIter] can be used, it needs to be initialized with
    [Gtk.BitsetIter.init_first], [Gtk.BitsetIter.init_last] or
    [Gtk.BitsetIter.init_at]. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
