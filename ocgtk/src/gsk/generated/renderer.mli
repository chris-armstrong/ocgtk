(* GENERATED CODE - DO NOT EDIT *)
(* Renderer: Renderer *)

type t = [`renderer | `object_] Gobject.obj

(** Create a new Renderer *)
external new_for_surface : unit -> t = "ml_gsk_renderer_new_for_surface"

(* Methods *)
(** Releases all the resources created by gsk_renderer_realize(). *)
external unrealize : t -> unit = "ml_gsk_renderer_unrealize"

(** Checks whether the @renderer is realized or not. *)
external is_realized : t -> bool = "ml_gsk_renderer_is_realized"

(* Properties *)

(** Get property: realized *)
external get_realized : t -> bool = "ml_gsk_renderer_get_realized"

