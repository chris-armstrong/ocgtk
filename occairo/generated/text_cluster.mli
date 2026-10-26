class type text_cluster_t = object
  method as_text_cluster : Text_cluster.t
end

class text_cluster : Text_cluster.t -> text_cluster_t
