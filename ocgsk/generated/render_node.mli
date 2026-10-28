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

(** {b The methods, signals and properties of a [RenderNode].}

    The basic block in a scene graph to be rendered using [Gsk.Renderer].

    Each node has a parent, except the top-level node; each node may have
    children nodes.

    Each node has an associated drawing surface, which has the size of the
    rectangle set when creating it.

    Render nodes are meant to be transient; once they have been associated to a
    [Gsk.Renderer] it's safe to release any reference you have on them. All
    [Gsk.RenderNode]s are immutable, you can only specify their properties
    during construction. *)
class type render_node_t = object
  method draw : Occairo.Context.context_t -> unit
  (** Draws the contents of a render node on a cairo context.

      Typically, you'll use this function to implement fallback rendering of
      render nodes on an intermediate Cairo context, instead of using the
      drawing context associated to a [Gdk.Surface]'s rendering buffer.

      For advanced nodes that cannot be supported using Cairo, in particular for
      nodes doing 3D operations, this function may fail. *)

  method get_node_type : unit -> Enums.rendernodetype
  (** Returns the type of the render node. *)

  method ref : unit -> render_node_t
  (** Acquires a reference on the given [GskRenderNode]. *)

  method serialize : unit -> Glib_bytes.t
  (** Serializes the [node] for later deserialization via
      gsk_render_node_deserialize(). No guarantees are made about the format
      used other than that the same version of GTK will be able to deserialize
      the result of a call to gsk_render_node_serialize() and
      gsk_render_node_deserialize() will correctly reject files it cannot open
      that were created with previous versions of GTK.

      The intended use of this functions is testing, benchmarking and debugging.
      The format is not meant as a permanent storage format. *)

  method unref : unit -> unit
  (** Releases a reference on the given [GskRenderNode].

      If the reference was the last, the resources associated to the [node] are
      freed. *)

  method write_to_file : string -> (bool, GError.t) result
  (** This function is equivalent to calling [Gsk.RenderNode.serialize] followed
      by [GLib.file_set_contents].

      See those two functions for details on the arguments.

      It is mostly intended for use inside a debugger to quickly dump a render
      node to a file for later inspection. *)

  method as_render_node : Raw.Render_node.t
end

class render_node : Raw.Render_node.t -> render_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Render_node.t}. *)
