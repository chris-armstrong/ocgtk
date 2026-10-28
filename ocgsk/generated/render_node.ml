class type render_node_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_render_node : Raw.Render_node.t
end

(* High-level class for RenderNode *)
class render_node (obj : Raw.Render_node.t) : render_node_t =
  object (self)
    method draw : Occairo.Context.context_t -> unit =
      fun cr ->
        let cr = cr#as_context in
        Raw.Render_node.draw obj cr

    method get_node_type : unit -> Enums.rendernodetype =
      fun () -> Raw.Render_node.get_node_type obj

    method ref : unit -> render_node_t =
      fun () -> new render_node (Raw.Render_node.ref obj)

    method serialize : unit -> Glib_bytes.t =
      fun () -> Raw.Render_node.serialize obj

    method unref : unit -> unit = fun () -> Raw.Render_node.unref obj

    method write_to_file : string -> (bool, GError.t) result =
      fun filename -> Raw.Render_node.write_to_file obj filename

    method as_render_node = obj
  end
