class type initable_t = object
  method init : Cancellable.cancellable_t option -> (bool, GError.t) result
  method as_initable : Raw.Initable.t
end

class initable : Raw.Initable.t -> initable_t
