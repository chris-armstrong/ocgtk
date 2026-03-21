(* GENERATED CODE - DO NOT EDIT *)
(* RenderNode: RenderNode *)

type t = [`render_node] Gobject.obj

(* Methods *)
(** This function is equivalent to calling [method@Gsk.RenderNode.serialize]
followed by [func@GLib.file_set_contents].

See those two functions for details on the arguments.

It is mostly intended for use inside a debugger to quickly dump a render
node to a file for later inspection. *)
external write_to_file : t -> string -> (bool, GError.t) result = "ml_gsk_render_node_write_to_file"

(** Releases a reference on the given `GskRenderNode`.

If the reference was the last, the resources associated to the @node are
freed. *)
external unref : t -> unit = "ml_gsk_render_node_unref"

(** Acquires a reference on the given `GskRenderNode`. *)
external ref : t -> t = "ml_gsk_render_node_ref"

(** Returns the type of the @node. *)
external get_node_type : t -> Gsk_enums.rendernodetype = "ml_gsk_render_node_get_node_type"

(** Retrieves the boundaries of the @node.

The node will not draw outside of its boundaries. *)
external get_bounds : t -> Ocgtk_graphene.Graphene.Wrappers.Rect.t = "ml_gsk_render_node_get_bounds"

(** Draw the contents of @node to the given cairo context.

Typically, you'll use this function to implement fallback rendering
of `GskRenderNode`s on an intermediate Cairo context, instead of using
the drawing context associated to a [class@Gdk.Surface]'s rendering buffer.

For advanced nodes that cannot be supported using Cairo, in particular
for nodes doing 3D operations, this function may fail. *)
external draw : t -> Ocgtk_cairo.Cairo.Wrappers.Context.t -> unit = "ml_gsk_render_node_draw"

