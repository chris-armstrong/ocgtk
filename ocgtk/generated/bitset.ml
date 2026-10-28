class type bitset_t = object
  (** {2:methods Methods} *)

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
  (** Returns [true] if [self] and [other] contain the same values. *)

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

      Values that end up too large to be held in a [int] are discarded. *)

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

  (** {2:conversions Conversions} *)

  method as_bitset : Raw.Bitset.t
end

(* High-level class for Bitset *)
class bitset (obj : Raw.Bitset.t) : bitset_t =
  object (self)
    method add : int -> bool = fun value -> Raw.Bitset.add obj value

    method add_range : int -> int -> unit =
      fun start n_items -> Raw.Bitset.add_range obj start n_items

    method add_range_closed : int -> int -> unit =
      fun first last -> Raw.Bitset.add_range_closed obj first last

    method add_rectangle : int -> int -> int -> int -> unit =
      fun start width height stride ->
        Raw.Bitset.add_rectangle obj start width height stride

    method contains : int -> bool = fun value -> Raw.Bitset.contains obj value

    method difference : Raw.Bitset.t -> unit =
      fun other -> Raw.Bitset.difference obj other

    method equals : Raw.Bitset.t -> bool =
      fun other -> Raw.Bitset.equals obj other

    method get_maximum : unit -> int = fun () -> Raw.Bitset.get_maximum obj
    method get_minimum : unit -> int = fun () -> Raw.Bitset.get_minimum obj
    method get_nth : int -> int = fun nth -> Raw.Bitset.get_nth obj nth
    method get_size : unit -> UInt64.t = fun () -> Raw.Bitset.get_size obj

    method get_size_in_range : int -> int -> UInt64.t =
      fun first last -> Raw.Bitset.get_size_in_range obj first last

    method intersect : Raw.Bitset.t -> unit =
      fun other -> Raw.Bitset.intersect obj other

    method is_empty : unit -> bool = fun () -> Raw.Bitset.is_empty obj
    method ref : unit -> Raw.Bitset.t = fun () -> Raw.Bitset.ref obj
    method remove : int -> bool = fun value -> Raw.Bitset.remove obj value
    method remove_all : unit -> unit = fun () -> Raw.Bitset.remove_all obj

    method remove_range : int -> int -> unit =
      fun start n_items -> Raw.Bitset.remove_range obj start n_items

    method remove_range_closed : int -> int -> unit =
      fun first last -> Raw.Bitset.remove_range_closed obj first last

    method remove_rectangle : int -> int -> int -> int -> unit =
      fun start width height stride ->
        Raw.Bitset.remove_rectangle obj start width height stride

    method shift_left : int -> unit =
      fun amount -> Raw.Bitset.shift_left obj amount

    method shift_right : int -> unit =
      fun amount -> Raw.Bitset.shift_right obj amount

    method splice : int -> int -> int -> unit =
      fun position removed added -> Raw.Bitset.splice obj position removed added

    method subtract : Raw.Bitset.t -> unit =
      fun other -> Raw.Bitset.subtract obj other

    method union : Raw.Bitset.t -> unit =
      fun other -> Raw.Bitset.union obj other

    method as_bitset = obj
  end

let new_empty () : bitset_t = new bitset (Raw.Bitset.new_empty ())

let new_range (start : int) (n_items : int) : bitset_t =
  let obj_ = Raw.Bitset.new_range start n_items in
  new bitset obj_
