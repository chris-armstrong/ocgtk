(** Represents a rectangle.

    [GdkRectangle] is identical to [cairo_rectangle_t]. Together with Cairo’s
    [cairo_region_t] data type, these are the central types for representing
    sets of pixels.

    The intersection of two rectangles can be computed with
    [Gdk.Rectangle.intersect]; to find the union of two rectangles use
    [Gdk.Rectangle.union].

    The [cairo_region_t] type provided by Cairo is usually used for managing
    non-rectangular clipping of graphical operations.

    The Graphene library has a number of other data types for regions and
    volumes in 2D and 3D.

    Its methods, signals and properties are on {!class-type-rectangle_t}. The
    functions it is built on are in {!Ocgdk.Raw.Rectangle}. *)

(** The methods, signals and properties of a [GdkRectangle]. *)
class type rectangle_t = object
  method contains_point : int -> int -> bool
  (** Returns [TRUE] if [rect] contains the point described by [x] and [y]. *)

  method equal : Raw.Rectangle.t -> bool
  (** Checks if the two given rectangles are equal. *)

  method as_rectangle : Raw.Rectangle.t
end

class rectangle : Raw.Rectangle.t -> rectangle_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Rectangle.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkRectangle], give one already wrapped. *)
