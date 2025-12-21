(* High-level class for SimpleAsyncResult *)
class simple_async_result (obj : Simple_async_result.t) = object (self)

  method complete : unit -> unit =
    fun () ->
      (Simple_async_result.complete obj)

  method complete_in_idle : unit -> unit =
    fun () ->
      (Simple_async_result.complete_in_idle obj)

  method get_op_res_gboolean : unit -> bool =
    fun () ->
      (Simple_async_result.get_op_res_gboolean obj)

  method propagate_error : unit -> (bool, GError.t) result =
    fun () ->
      (Simple_async_result.propagate_error obj)

  method set_check_cancellable : 'p1. (#GCancellable.cancellable as 'p1) option -> unit =
    fun check_cancellable ->
      let check_cancellable = Option.map (fun (c) -> c#as_cancellable) check_cancellable in
      (Simple_async_result.set_check_cancellable obj check_cancellable)

  method set_handle_cancellation : bool -> unit =
    fun handle_cancellation ->
      (Simple_async_result.set_handle_cancellation obj handle_cancellation)

  method set_op_res_gboolean : bool -> unit =
    fun op_res ->
      (Simple_async_result.set_op_res_gboolean obj op_res)

    method as_simple_async_result = obj
end

