(* High-level class for AsyncInitable *)
class async_initable (obj : Async_initable.t) = object (self)

    method as_async_initable = obj
end

