class type debug_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  method get_message : unit -> string
  (** Gets the debug message that was set on this node *)

  (** {2:conversions Conversions} *)

  method as_debug_node : Raw.Debug_node.t
end

(* High-level class for DebugNode *)
class debug_node (obj : Raw.Debug_node.t) : debug_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Debug_node.get_child obj)

    method get_message : unit -> string =
      fun () -> Raw.Debug_node.get_message obj

    method as_debug_node = obj
  end

let new_ (child : Render_node.render_node_t) (message : string) : debug_node_t =
  let child = child#as_render_node in
  let obj_ = Raw.Debug_node.new_ child message in
  new debug_node obj_
