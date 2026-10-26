class type async_initable_t = object
  method init_finish : Async_result.async_result_t -> (bool, GError.t) result

  method new_finish :
    Async_result.async_result_t -> ([ `object_ ] Gobject.obj, GError.t) result

  method as_async_initable : Raw.Async_initable.t
end

(* High-level class for AsyncInitable *)
class async_initable (obj : Raw.Async_initable.t) : async_initable_t =
  object (self)
    method init_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun res ->
        let res = res#as_async_result in
        Raw.Async_initable.init_finish obj res

    method new_finish :
        Async_result.async_result_t ->
        ([ `object_ ] Gobject.obj, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Raw.Async_initable.new_finish obj res

    method as_async_initable = obj
  end
