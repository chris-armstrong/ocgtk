class type bitset_iter_t = object
  (** {2:methods Methods} *)

  method get_value : unit -> int
  (** Gets the current value that [iter] points to.

      If [iter] is not valid and [Gtk.BitsetIter.is_valid] returns [FALSE], this
      function returns 0. *)

  method is_valid : unit -> bool
  (** Checks if [iter] points to a valid value. *)

  (** {2:conversions Conversions} *)

  method as_bitset_iter : Raw.Bitset_iter.t
end

(* High-level class for BitsetIter *)
class bitset_iter (obj : Raw.Bitset_iter.t) : bitset_iter_t =
  object (self)
    method get_value : unit -> int = fun () -> Raw.Bitset_iter.get_value obj
    method is_valid : unit -> bool = fun () -> Raw.Bitset_iter.is_valid obj
    method as_bitset_iter = obj
  end
