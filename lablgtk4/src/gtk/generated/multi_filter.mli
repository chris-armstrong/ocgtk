(* GENERATED CODE - DO NOT EDIT *)
(* MultiFilter: MultiFilter *)

type t = [`multi_filter | `filter | `object_] Gobject.obj

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_multi_filter_get_n_items"

(** Removes the filter at the given @position from the list of filters used
by @self.

If @position is larger than the number of filters, nothing happens and
the function returns. *)
external remove : t -> int -> unit = "ml_gtk_multi_filter_remove"

(** Adds a @filter to @self to use for matching. *)
external append : t -> Filter.t -> unit = "ml_gtk_multi_filter_append"

