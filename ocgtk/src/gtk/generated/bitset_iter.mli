(* GENERATED CODE - DO NOT EDIT *)
(* BitsetIter: BitsetIter *)

(** An opaque, stack-allocated struct for iterating
over the elements of a `GtkBitset`.

Before a `GtkBitsetIter` can be used, it needs to be initialized with
[func@Gtk.BitsetIter.init_first], [func@Gtk.BitsetIter.init_last]
or [func@Gtk.BitsetIter.init_at]. *)
type t = [`bitset_iter] Gobject.obj

(* Methods *)
(** Moves @iter to the previous value in the set.

If it was already pointing to the first value in the set,
%FALSE is returned and @iter is invalidated. *)
external previous : t -> bool * int = "ml_gtk_bitset_iter_previous"

(** Moves @iter to the next value in the set.

If it was already pointing to the last value in the set,
%FALSE is returned and @iter is invalidated. *)
external next : t -> bool * int = "ml_gtk_bitset_iter_next"

(** Checks if @iter points to a valid value. *)
external is_valid : t -> bool = "ml_gtk_bitset_iter_is_valid"

(** Gets the current value that @iter points to.

If @iter is not valid and [method@Gtk.BitsetIter.is_valid]
returns %FALSE, this function returns 0. *)
external get_value : t -> int = "ml_gtk_bitset_iter_get_value"

