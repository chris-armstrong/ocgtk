class multi_filter : Multi_filter.t ->
  object
    method append : #GFilter.filter -> unit
    method remove : int -> unit
    method n_items : int
    method as_multi_filter : Multi_filter.t
  end

