class type text_cluster_t = object
  method as_text_cluster : Raw.Text_cluster.t
end

(* High-level class for TextCluster *)
class text_cluster (obj : Raw.Text_cluster.t) : text_cluster_t =
  object (self)
    method as_text_cluster = obj
  end
