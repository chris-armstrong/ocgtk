(* GENERATED CODE - DO NOT EDIT *)
(* RequestedSize: RequestedSize *)

type t = [ `requested_size ] Gobject.obj
(** Represents a request of a screen object in a given orientation. These are
    primarily used in container implementations when allocating a natural size
    for children calling. See [func@distribute_natural_allocation]. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_minimum_size : t -> int = "ml_gtk_requested_size_get_minimum_size"
external get_natural_size : t -> int = "ml_gtk_requested_size_get_natural_size"

(* Setters *)
external set_minimum_size : t -> int -> unit
  = "ml_gtk_requested_size_set_minimum_size"

external set_natural_size : t -> int -> unit
  = "ml_gtk_requested_size_set_natural_size"

external make : int -> int -> t = "ml_gtk_requested_size_make"
