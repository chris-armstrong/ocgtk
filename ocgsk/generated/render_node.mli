(** The basic block in a scene graph to be rendered using [Gsk.Renderer].

    Each node has a parent, except the top-level node; each node may have
    children nodes.

    Each node has an associated drawing surface, which has the size of the
    rectangle set when creating it.

    Render nodes are meant to be transient; once they have been associated to a
    [Gsk.Renderer] it's safe to release any reference you have on them. All
    [Gsk.RenderNode]s are immutable, you can only specify their properties
    during construction.

    Its methods, signals and properties are on {!class-type-render_node_t}. The
    functions it is built on are in {!Ocgsk.Raw.Render_node}. *)

(** The methods, signals and properties of a [GskRenderNode]. *)
class type render_node_t = object
  method draw : Occairo.Context.context_t -> unit
  method get_node_type : unit -> Enums.rendernodetype
  method ref : unit -> render_node_t
  method serialize : unit -> Glib_bytes.t
  method unref : unit -> unit
  method write_to_file : string -> (bool, GError.t) result
  method as_render_node : Raw.Render_node.t
end

class render_node : Raw.Render_node.t -> render_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Render_node.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskRenderNode], give one already wrapped. *)
