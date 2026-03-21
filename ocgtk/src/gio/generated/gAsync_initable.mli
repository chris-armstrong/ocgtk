class type async_initable_t = object
    method as_async_initable : Async_initable.t
end

class async_initable : Async_initable.t -> async_initable_t

