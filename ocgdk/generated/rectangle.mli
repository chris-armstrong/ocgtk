(** Represents a rectangle.

    Its methods, signals and properties are on {!class-type-rectangle_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Rectangle}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Rectangle].}

    Represents a rectangle.

    [GdkRectangle] is identical to [cairo_rectangle_t]. Together with Cairo’s
    [cairo_region_t] data type, these are the central types for representing
    sets of pixels.

    The intersection of two rectangles can be computed with
    [Gdk.Rectangle.intersect]; to find the union of two rectangles use
    [Gdk.Rectangle.union].

    The [cairo_region_t] type provided by Cairo is usually used for managing
    non-rectangular clipping of graphical operations.

    The Graphene library has a number of other data types for regions and
    volumes in 2D and 3D. *)
class type rectangle_t = object
  (** {2:methods Methods} *)

  method contains_point : int -> int -> bool
  (** Returns [TRUE] if [rect] contains the point described by [x] and [y]. *)

  method equal : Raw.Rectangle.t -> bool
  (** Checks if the two given rectangles are equal. *)

  (** {2:conversions Conversions} *)

  method as_rectangle : Raw.Rectangle.t
end

class rectangle : Raw.Rectangle.t -> rectangle_t
(** Wraps a raw handle of {!Ocgdk.Raw.Rectangle.t}. *)

(** {1:description Description}

    Represents a rectangle.

    [GdkRectangle] is identical to [cairo_rectangle_t]. Together with Cairo’s
    [cairo_region_t] data type, these are the central types for representing
    sets of pixels.

    The intersection of two rectangles can be computed with
    [Gdk.Rectangle.intersect]; to find the union of two rectangles use
    [Gdk.Rectangle.union].

    The [cairo_region_t] type provided by Cairo is usually used for managing
    non-rectangular clipping of graphical operations.

    The Graphene library has a number of other data types for regions and
    volumes in 2D and 3D. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
