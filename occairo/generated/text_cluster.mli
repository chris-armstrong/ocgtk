(** Bindings for [cairo_text_cluster_t].

    Its methods, signals and properties are on {!class-type-text_cluster_t}. The
    functions it is built on are in {!Occairo.Raw.Text_cluster}. *)

(** The methods, signals and properties of a [cairo_text_cluster_t]. *)
class type text_cluster_t = object
  method as_text_cluster : Raw.Text_cluster.t
end

class text_cluster : Raw.Text_cluster.t -> text_cluster_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Text_cluster.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [cairo_text_cluster_t], give one already wrapped. *)
