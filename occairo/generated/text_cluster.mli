(** Bindings for [TextCluster].

    Its methods, signals and properties are on {!class-type-text_cluster_t}. The
    functions it is built on are in {!Occairo.Raw.Text_cluster}. *)

(** The methods, signals and properties of a [TextCluster]. *)
class type text_cluster_t = object
  method as_text_cluster : Raw.Text_cluster.t
end

class text_cluster : Raw.Text_cluster.t -> text_cluster_t
(** Wraps a raw handle of {!Occairo.Raw.Text_cluster.t}. *)
