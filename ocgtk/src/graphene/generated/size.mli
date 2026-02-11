(* GENERATED CODE - DO NOT EDIT *)
(* Size: Size *)

(** A size. *)
type t = [`size] Gobject.obj

(** Create a new Size *)
external alloc : unit -> t = "ml_graphene_size_alloc"

(* Methods *)
(** Scales the components of a #graphene_size_t using the given @factor. *)
external scale : t -> float -> t = "ml_graphene_size_scale"

(** Linearly interpolates the two given #graphene_size_t using the given
interpolation @factor. *)
external interpolate : t -> t -> float -> t = "ml_graphene_size_interpolate"

(** Initializes a #graphene_size_t using the width and height of
the given @src. *)
external init_from_size : t -> t -> t = "ml_graphene_size_init_from_size"

(** Initializes a #graphene_size_t using the given @width and @height. *)
external init : t -> float -> float -> t = "ml_graphene_size_init"

(** Frees the resources allocated by graphene_size_alloc(). *)
external free : t -> unit = "ml_graphene_size_free"

(** Checks whether the two give #graphene_size_t are equal. *)
external equal : t -> t -> bool = "ml_graphene_size_equal"

