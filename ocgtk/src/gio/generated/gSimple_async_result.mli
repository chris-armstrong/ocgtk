class type simple_async_result_t = object
    method complete : unit -> unit
    method complete_in_idle : unit -> unit
    method get_op_res_gboolean : unit -> bool
    method get_op_res_gssize : unit -> int
    method propagate_error : unit -> (bool, GError.t) result
    method set_check_cancellable : GCancellable.cancellable_t option -> unit
    method set_handle_cancellation : bool -> unit
    method set_op_res_gboolean : bool -> unit
    method set_op_res_gssize : int -> unit
    method as_simple_async_result : Simple_async_result.t
end

class simple_async_result : Simple_async_result.t -> simple_async_result_t

