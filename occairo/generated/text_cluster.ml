class type text_cluster_t = object
  method as_text_cluster : Text_cluster.t
end

(* High-level class for TextCluster *)
class text_cluster (obj : Text_cluster.t) : text_cluster_t =
  object (self)
    method as_text_cluster = obj
  end
