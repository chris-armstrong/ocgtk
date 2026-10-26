class type async_initable_t = object
  method init_finish : Async_result.async_result_t -> (bool, GError.t) result

  method new_finish :
    Async_result.async_result_t -> ([ `object_ ] Gobject.obj, GError.t) result

  method as_async_initable : Raw.Async_initable.t
end

class async_initable : Raw.Async_initable.t -> async_initable_t
