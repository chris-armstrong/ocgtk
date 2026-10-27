class type container_node_t = object
  inherit Render_node.render_node_t

  method get_child : int -> Render_node.render_node_t
  (** Gets one of the children of [container]. *)

  method get_n_children : unit -> int
  (** Retrieves the number of direct children of [node]. *)

  method as_container_node : Raw.Container_node.t
end

(* High-level class for ContainerNode *)
class container_node (obj : Raw.Container_node.t) : container_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : int -> Render_node.render_node_t =
      fun idx ->
        new Render_node.render_node (Raw.Container_node.get_child obj idx)

    method get_n_children : unit -> int =
      fun () -> Raw.Container_node.get_n_children obj

    method as_container_node = obj
  end

let new_ (children : Raw.Render_node.t array) (n_children : int) :
    container_node_t =
  let obj_ = Raw.Container_node.new_ children n_children in
  new container_node obj_
