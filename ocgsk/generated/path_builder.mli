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

    Its methods, signals and properties are on {!class-type-path_builder_t}. The
    functions it is built on are in {!Ocgsk.Raw.Path_builder}. *)

(** The methods, signals and properties of a [GskPathBuilder]. *)
class type path_builder_t = object
  method add_cairo_path : Occairo.Path.path_t -> unit
  method add_circle : Ocgraphene.Point.point_t -> float -> unit
  method add_layout : Ocpango.Layout.layout_t -> unit
  method add_path : Raw.Path.t -> unit
  method add_rect : Ocgraphene.Rect.rect_t -> unit
  method add_reverse_path : Raw.Path.t -> unit
  method add_rounded_rect : Raw.Rounded_rect.t -> unit

  method add_segment :
    Raw.Path.t -> Raw.Path_point.t -> Raw.Path_point.t -> unit

  method arc_to : float -> float -> float -> float -> unit
  method close : unit -> unit
  method conic_to : float -> float -> float -> float -> float -> unit
  method cubic_to : float -> float -> float -> float -> float -> float -> unit
  method get_current_point : unit -> Ocgraphene.Point.point_t
  method html_arc_to : float -> float -> float -> float -> float -> unit
  method line_to : float -> float -> unit
  method move_to : float -> float -> unit
  method quad_to : float -> float -> float -> float -> unit
  method ref : unit -> Raw.Path_builder.t
  method rel_arc_to : float -> float -> float -> float -> unit
  method rel_conic_to : float -> float -> float -> float -> float -> unit

  method rel_cubic_to :
    float -> float -> float -> float -> float -> float -> unit

  method rel_html_arc_to : float -> float -> float -> float -> float -> unit
  method rel_line_to : float -> float -> unit
  method rel_move_to : float -> float -> unit
  method rel_quad_to : float -> float -> float -> float -> unit

  method rel_svg_arc_to :
    float -> float -> float -> bool -> bool -> float -> float -> unit

  method svg_arc_to :
    float -> float -> float -> bool -> bool -> float -> float -> unit

  method to_path : unit -> Raw.Path.t
  method as_path_builder : Raw.Path_builder.t
end

class path_builder : Raw.Path_builder.t -> path_builder_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Path_builder.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskPathBuilder], give one already wrapped. *)

val new_ : unit -> path_builder_t
