(** A render node for a solid color.

    Its methods, signals and properties are on {!class-type-color_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Color_node}. *)

(** The methods, signals and properties of a [GskColorNode]. *)
class type color_node_t = object
  inherit Render_node.render_node_t
  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  method as_color_node : Raw.Color_node.t
end

class color_node : Raw.Color_node.t -> color_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Color_node.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskColorNode], give one already wrapped. *)

val new_ : Ocgdk.Rgb_a.rgb_a_t -> Ocgraphene.Rect.rect_t -> color_node_t
