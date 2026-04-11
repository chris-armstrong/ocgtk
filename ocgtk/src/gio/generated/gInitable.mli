class type initable_t = object
    method init : GCancellable.cancellable_t option -> (bool, GError.t) result
    method as_initable : Initable.t
end

class initable : Initable.t -> initable_t

