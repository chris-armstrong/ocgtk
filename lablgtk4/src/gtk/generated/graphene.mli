(** Graphene geometry library (minimal bindings for GTK4)

    These are lightweight OCaml record types that map to Graphene
    C structures used by GTK4's snapshot API. *)

(** 2D Point *)
module Point : sig
  (** A point in 2D space with floating-point coordinates *)
  type t = { x : float; y : float }

  (** Create a point *)
  val make : x:float -> y:float -> t

  (** Zero point (0, 0) *)
  val zero : t
end

(** Rectangle *)
module Rect : sig
  (** A rectangle defined by origin point and size *)
  type t = { x : float; y : float; width : float; height : float }

  (** Create a rectangle *)
  val make : x:float -> y:float -> width:float -> height:float -> t

  (** Zero rectangle (0, 0, 0, 0) *)
  val zero : t

  (** Check if rectangle contains a point *)
  val contains_point : t -> Point.t -> bool

  (** Check if two rectangles intersect *)
  val intersects : t -> t -> bool
end

(** Size *)
module Size : sig
  (** A size with width and height *)
  type t = { width : float; height : float }

  (** Create a size *)
  val make : width:float -> height:float -> t

  (** Zero size (0, 0) *)
  val zero : t
end
