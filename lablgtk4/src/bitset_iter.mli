(* GENERATED CODE - DO NOT EDIT *)
(* Record: BitsetIter *)

(** An opaque, stack-allocated struct for iterating
over the elements of a `GtkBitset`.

Before a `GtkBitsetIter` can be used, it needs to be initialized with
[func@Gtk.BitsetIter.init_first], [func@Gtk.BitsetIter.init_last]
or [func@Gtk.BitsetIter.init_at]. *)
type t

(** Checks if @iter points to a valid value. *)
external is_valid : t -> bool = "ml_gtk_bitset_iter_is_valid"

(** Gets the current value that @iter points to.

If @iter is not valid and [method@Gtk.BitsetIter.is_valid]
returns %FALSE, this function returns 0. *)
external get_value : t -> int = "ml_gtk_bitset_iter_get_value"

