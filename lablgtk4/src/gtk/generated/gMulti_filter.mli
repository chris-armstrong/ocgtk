class multi_filter : Multi_filter.t ->
  object
    method n_items : int
    method append : #GFilter.filter -> unit
    method remove : int -> unit
    method as_multi_filter : Multi_filter.t
  end

