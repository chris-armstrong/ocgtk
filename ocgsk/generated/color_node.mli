(** A render node for a solid color.

    Its methods, signals and properties are on {!class-type-color_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Color_node}. *)

(** The methods, signals and properties of a [GskColorNode]. *)
class type color_node_t = object
  inherit Render_node.render_node_t

  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  (** Retrieves the color of the given [node].

      The value returned by this function will not be correct if the render node
      was created for a non-sRGB color. *)

  method as_color_node : Raw.Color_node.t
end

class color_node : Raw.Color_node.t -> color_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Color_node.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskColorNode], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Ocgdk.Rgb_a.rgb_a_t -> Ocgraphene.Rect.rect_t -> color_node_t
(** Creates a [GskRenderNode] that will render the color specified by [rgba]
    into the area given by [bounds]. *)
