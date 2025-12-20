class initable : Initable.t ->
  object
    method init : #GCancellable.cancellable option -> (bool, GError.t) result
    method as_initable : Initable.t
  end

