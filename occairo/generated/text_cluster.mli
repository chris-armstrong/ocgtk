class type text_cluster_t = object
  method as_text_cluster : Raw.Text_cluster.t
end

class text_cluster : Raw.Text_cluster.t -> text_cluster_t
