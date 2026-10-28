(** A render node for a border.

    Its methods, signals and properties are on {!class-type-border_node_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgsk.Raw.Border_node}. *)

(** The methods, signals and properties of a [BorderNode]. *)
class type border_node_t = object
  inherit Render_node.render_node_t

  method get_colors : unit -> Ocgdk.Raw.Rgb_a.t array
  (** Retrieves the colors of the border. *)

  method get_outline : unit -> Raw.Rounded_rect.t
  (** Retrieves the outline of the border. *)

  method get_widths : unit -> float array
  (** Retrieves the stroke widths of the border. *)

  method as_border_node : Raw.Border_node.t
end

class border_node : Raw.Border_node.t -> border_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Border_node.t}. *)

(** {2:constructors Constructors} *)

val new_ :
  Raw.Rounded_rect.t -> float array -> Ocgdk.Raw.Rgb_a.t array -> border_node_t
(** Creates a [GskRenderNode] that will stroke a border rectangle inside the
    given [outline].

    The 4 sides of the border can have different widths and colors. *)
