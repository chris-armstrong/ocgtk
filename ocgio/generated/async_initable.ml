class type async_initable_t = object
  (** {2:methods Methods} *)

  method init_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes asynchronous initialization and returns the result. See
      g_async_initable_init_async(). *)

  method new_finish :
    Async_result.async_result_t -> ([ `object_ ] Gobject.obj, GError.t) result
  (** Finishes the async construction for the various g_async_initable_new
      calls, returning the created object or an [Error] result. *)

  (** {2:conversions Conversions} *)

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
