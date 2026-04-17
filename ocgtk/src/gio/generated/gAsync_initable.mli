class type async_initable_t = object
  method init_finish : GAsync_result.async_result_t -> (bool, GError.t) result

  method new_finish :
    GAsync_result.async_result_t -> ([ `object_ ] Gobject.obj, GError.t) result

  method as_async_initable : Async_initable.t
end

class async_initable : Async_initable.t -> async_initable_t
