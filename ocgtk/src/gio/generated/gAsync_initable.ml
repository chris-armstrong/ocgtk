class type async_initable_t = object
    method as_async_initable : Async_initable.t
end

(* High-level class for AsyncInitable *)
class async_initable (obj : Async_initable.t) : async_initable_t = object (self)

    method as_async_initable = obj
end

