(** Constructs [GskPath] objects.

    A path is constructed like this:

    {[
    GskPath *
    construct_path (void)
    {
      GskPathBuilder *builder;

      builder = gsk_path_builder_new ();

      // add contours to the path here

      return gsk_path_builder_free_to_path (builder);
    ]}

    Adding contours to the path can be done in two ways. The easiest option is
    to use the [gsk_path_builder_add_*] group of functions that add predefined
    contours to the current path, either common shapes like
    [Gsk.PathBuilder.add_circle] or by adding from other paths like
    [Gsk.PathBuilder.add_path].

    The [gsk_path_builder_add_*] methods always add complete contours, and do
    not use or modify the current point.

    The other option is to define each line and curve manually with the
    [gsk_path_builder_*_to] group of functions. You start with a call to
    [Gsk.PathBuilder.move_to] to set the starting point and then use multiple
    calls to any of the drawing functions to move the pen along the plane. Once
    you are done, you can call [Gsk.PathBuilder.close] to close the path by
    connecting it back with a line to the starting point.

    This is similar to how paths are drawn in Cairo.

    Note that [GskPathBuilder] will reduce the degree of added Bézier curves as
    much as possible, to simplify rendering.

    Its methods, signals and properties are on {!class-type-path_builder_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Path_builder}. *)

(** The methods, signals and properties of a [GskPathBuilder]. *)
class type path_builder_t = object
  method add_cairo_path : Occairo.Path.path_t -> unit
  (** Adds a Cairo path to the builder.

      You can use cairo_copy_path() to access the path from a Cairo context. *)

  method add_circle : Ocgraphene.Point.point_t -> float -> unit
  (** Adds a circle as a new contour.

      The path is going around the circle in clockwise direction.

      If [radius] is zero, the contour will be a closed point. *)

  method add_layout : Ocpango.Layout.layout_t -> unit
  (** Adds the outlines for the glyphs in [layout] to the builder. *)

  method add_path : Raw.Path.t -> unit
  (** Appends all of [path] to the builder. *)

  method add_rect : Ocgraphene.Rect.rect_t -> unit
  (** Adds a rectangle as a new contour.

      The path is going around the rectangle in clockwise direction.

      If the the width or height are 0, the path will be a closed horizontal or
      vertical line. If both are 0, it'll be a closed dot. *)

  method add_reverse_path : Raw.Path.t -> unit
  (** Appends all of [path] to the builder, in reverse order. *)

  method add_rounded_rect : Raw.Rounded_rect.t -> unit
  (** Adds a rounded rectangle as a new contour.

      The path is going around the rectangle in clockwise direction. *)

  method add_segment :
    Raw.Path.t -> Raw.Path_point.t -> Raw.Path_point.t -> unit
  (** Adds a segment of a path to the builder.

      If [start] is equal to or after [end], the path will first add the segment
      from [start] to the end of the path, and then add the segment from the
      beginning to [end]. If the path is closed, these segments will be
      connected.

      Note that this method always adds a path with the given start point and
      end point. To add a closed path, use [Gsk.PathBuilder.add_path]. *)

  method arc_to : float -> float -> float -> float -> unit
  (** Adds an elliptical arc from the current point to [x2], [y2] with [x1],
      [y1] determining the tangent directions.

      After this, [x2], [y2] will be the new current point.

      Note: Two points and their tangents do not determine a unique ellipse, so
      GSK just picks one. If you need more precise control, use
      [Gsk.PathBuilder.conic_to] or [Gsk.PathBuilder.svg_arc_to].

      Arc To *)

  method close : unit -> unit
  (** Ends the current contour with a line back to the start point.

      Note that this is different from calling [Gsk.PathBuilder.line_to] with
      the start point in that the contour will be closed. A closed contour
      behaves differently from an open one. When stroking, its start and end
      point are considered connected, so they will be joined via the line join,
      and not ended with line caps. *)

  method conic_to : float -> float -> float -> float -> float -> unit
  (** Adds a
      {{:https://en.wikipedia.org/wiki/Non-uniform_rational_B-spline}conic
       curve} from the current point to [x2], [y2] with the given [weight] and
      [x1], [y1] as the control point.

      The weight determines how strongly the curve is pulled towards the control
      point. A conic with weight 1 is identical to a quadratic Bézier curve with
      the same points.

      Conic curves can be used to draw ellipses and circles. They are also known
      as rational quadratic Bézier curves.

      After this, [x2], [y2] will be the new current point.

      Conic To *)

  method cubic_to : float -> float -> float -> float -> float -> float -> unit
  (** Adds a
      {{:https://en.wikipedia.org/wiki/B%C3%A9zier_curve}cubic Bézier curve}
      from the current point to [x3], [y3] with [x1], [y1] and [x2], [y2] as the
      control points.

      After this, [x3], [y3] will be the new current point.

      Cubic To *)

  method get_current_point : unit -> Ocgraphene.Point.point_t
  (** Gets the current point.

      The current point is used for relative drawing commands and updated after
      every operation.

      When the builder is created, the default current point is set to [0, 0].
      Note that this is different from cairo, which starts out without a current
      point. *)

  method html_arc_to : float -> float -> float -> float -> float -> unit
  (** Implements arc-to according to the HTML Canvas spec.

      A convenience function that implements the
      {{:https://html.spec.whatwg.org/multipage/canvas.html#dom-context-2d-arcto-dev}HTML
       arc_to} functionality.

      After this, the current point will be the point where the circle with the
      given radius touches the line from [x1], [y1] to [x2], [y2]. *)

  method line_to : float -> float -> unit
  (** Draws a line from the current point to [x], [y] and makes it the new
      current point.

      Line To *)

  method move_to : float -> float -> unit
  (** Starts a new contour by placing the pen at [x], [y].

      If this function is called twice in succession, the first call will result
      in a contour made up of a single point. The second call will start a new
      contour. *)

  method quad_to : float -> float -> float -> float -> unit
  (** Adds a
      {{:https://en.wikipedia.org/wiki/B%C3%A9zier_curve}quadratic Bézier curve}
      from the current point to [x2], [y2] with [x1], [y1] as the control point.

      After this, [x2], [y2] will be the new current point.

      Quad To *)

  method ref : unit -> Raw.Path_builder.t
  (** Acquires a reference on the given builder.

      This function is intended primarily for language bindings.
      [GskPathBuilder] objects should not be kept around. *)

  method rel_arc_to : float -> float -> float -> float -> unit
  (** Adds an elliptical arc from the current point to [x2], [y2] with [x1],
      [y1] determining the tangent directions.

      All coordinates are given relative to the current point.

      This is the relative version of [Gsk.PathBuilder.arc_to]. *)

  method rel_conic_to : float -> float -> float -> float -> float -> unit
  (** Adds a
      {{:https://en.wikipedia.org/wiki/Non-uniform_rational_B-spline}conic
       curve} from the current point to [x2], [y2] with the given [weight] and
      [x1], [y1] as the control point.

      All coordinates are given relative to the current point.

      This is the relative version of [Gsk.PathBuilder.conic_to]. *)

  method rel_cubic_to :
    float -> float -> float -> float -> float -> float -> unit
  (** Adds a
      {{:https://en.wikipedia.org/wiki/B%C3%A9zier_curve}cubic Bézier curve}
      from the current point to [x3], [y3] with [x1], [y1] and [x2], [y2] as the
      control points.

      All coordinates are given relative to the current point.

      This is the relative version of [Gsk.PathBuilder.cubic_to]. *)

  method rel_html_arc_to : float -> float -> float -> float -> float -> unit
  (** Implements arc-to according to the HTML Canvas spec.

      All coordinates are given relative to the current point.

      This is the relative version of [Gsk.PathBuilder.html_arc_to]. *)

  method rel_line_to : float -> float -> unit
  (** Draws a line from the current point to a point offset from it by [x], [y]
      and makes it the new current point.

      This is the relative version of [Gsk.PathBuilder.line_to]. *)

  method rel_move_to : float -> float -> unit
  (** Starts a new contour by placing the pen at [x], [y] relative to the
      current point.

      This is the relative version of [Gsk.PathBuilder.move_to]. *)

  method rel_quad_to : float -> float -> float -> float -> unit
  (** Adds a
      {{:https://en.wikipedia.org/wiki/B%C3%A9zier_curve}quadratic Bézier curve}
      from the current point to [x2], [y2] with [x1], [y1] the control point.

      All coordinates are given relative to the current point.

      This is the relative version of [Gsk.PathBuilder.quad_to]. *)

  method rel_svg_arc_to :
    float -> float -> float -> bool -> bool -> float -> float -> unit
  (** Implements arc-to according to the SVG spec.

      All coordinates are given relative to the current point.

      This is the relative version of [Gsk.PathBuilder.svg_arc_to]. *)

  method svg_arc_to :
    float -> float -> float -> bool -> bool -> float -> float -> unit
  (** Implements arc-to according to the SVG spec.

      A convenience function that implements the
      {{:https://www.w3.org/TR/SVG11/paths.html#PathDataEllipticalArcCommands}SVG
       arc_to} functionality.

      After this, [x], [y] will be the new current point. *)

  method to_path : unit -> Raw.Path.t
  (** Creates a new path from the given builder.

      The given [GskPathBuilder] is reset to the initial state once this
      function returns. Calling this function again on the same builder instance
      will therefore produce an empty path, not a copy of the same path.

      This function is intended primarily for language bindings. C code should
      use [Gsk.PathBuilder.free_to_path]. *)

  method as_path_builder : Raw.Path_builder.t
end

class path_builder : Raw.Path_builder.t -> path_builder_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Path_builder.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskPathBuilder], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> path_builder_t
(** Create a new [GskPathBuilder] object.

    The resulting builder would create an empty [GskPath]. Use addition
    functions to add types to it. *)
