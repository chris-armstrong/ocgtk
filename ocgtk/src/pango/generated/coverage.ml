(* GENERATED CODE - DO NOT EDIT *)
(* Coverage: Coverage *)

type t = [`coverage | `object_] Gobject.obj

(** Create a new Coverage *)
external new_ : unit -> t = "ml_pango_coverage_new"

(* Methods *)
(** Decrease the reference count on the `PangoCoverage` by one.

If the result is zero, free the coverage and all associated memory. *)
external unref : t -> unit = "ml_pango_coverage_unref"

(** Modify a particular index within @coverage *)
external set : t -> int -> Pango_enums.coveragelevel -> unit = "ml_pango_coverage_set"

(** Increase the reference count on the `PangoCoverage` by one. *)
external ref : t -> t = "ml_pango_coverage_ref"

(** Set the coverage for each index in @coverage to be the max (better)
value of the current coverage for the index and the coverage for
the corresponding index in @other. *)
external max : t -> t -> unit = "ml_pango_coverage_max"

(** Determine whether a particular index is covered by @coverage. *)
external get : t -> int -> Pango_enums.coveragelevel = "ml_pango_coverage_get"

(** Copy an existing `PangoCoverage`. *)
external copy : t -> t = "ml_pango_coverage_copy"

