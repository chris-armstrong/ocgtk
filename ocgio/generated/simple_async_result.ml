class type simple_async_result_t = object
  inherit Async_result.async_result_t

  (** {2:methods Methods} *)

  method complete : unit -> unit
  (** Completes an asynchronous I/O job immediately. Must be called in the
      thread where the asynchronous result was to be delivered, as it invokes
      the callback directly. If you are in a different thread use
      g_simple_async_result_complete_in_idle().

      Calling this function takes a reference to [simple] for as long as is
      needed to complete the call. *)

  method complete_in_idle : unit -> unit
  (** Completes an asynchronous function in an idle handler in the
      thread-default main context (see [GLib.MainContext.push_thread_default])
      of the thread that [simple] was initially created in (and re-pushes that
      context around the invocation of the callback).

      Calling this function takes a reference to [simple] for as long as is
      needed to complete the call. *)

  method get_op_res_gboolean : unit -> bool
  (** Gets the operation result boolean from within the asynchronous result. *)

  method get_op_res_gssize : unit -> int
  (** Gets a gssize from the asynchronous result. *)

  method propagate_error : unit -> (bool, GError.t) result
  (** Propagates an error from within the simple asynchronous result to a given
      destination.

      If the [GCancellable] given to a prior call to
      g_simple_async_result_set_check_cancellable() is cancelled then this
      function will return [TRUE] with [dest] set appropriately. *)

  method set_check_cancellable : Cancellable.cancellable_t option -> unit
  [@@ocaml.doc
    "Sets a [GCancellable] to check before dispatching results.\n\n\
     This function has one very specific purpose: the provided cancellable\n\
     is checked at the time of g_simple_async_result_propagate_error() If\n\
     it is cancelled, these functions will return an \"Operation was\n\
     cancelled\" error ([G_IO_ERROR_CANCELLED]).\n\n\
     Implementors of cancellable asynchronous functions should use this in\n\
     order to provide a guarantee to their callers that cancelling an\n\
     async operation will reliably result in an error being returned for\n\
     that operation (even if a positive result for the operation has\n\
     already been sent as an idle to the main context to be dispatched).\n\n\
     The checking described above is done regardless of any call to the\n\
     unrelated g_simple_async_result_set_handle_cancellation() function."]

  method set_from_error : GError.t -> unit
  (** Sets the result from a [GError]. *)

  method set_handle_cancellation : bool -> unit
  (** Sets whether to handle cancellation within the asynchronous operation.

      This function has nothing to do with
      g_simple_async_result_set_check_cancellable(). It only refers to the
      [GCancellable] passed to g_simple_async_result_run_in_thread(). *)

  method set_op_res_gboolean : bool -> unit
  (** Sets the operation result to a boolean within the asynchronous result. *)

  method set_op_res_gssize : int -> unit
  (** Sets the operation result within the asynchronous result to the given
      [op_res]. *)

  (** {2:conversions Conversions} *)

  method as_simple_async_result : Raw.Simple_async_result.t
end

(* High-level class for SimpleAsyncResult *)
class simple_async_result (obj : Raw.Simple_async_result.t) :
  simple_async_result_t =
  object (self)
    inherit Async_result.async_result (Raw.Async_result.from_gobject obj)

    method complete : unit -> unit =
      fun () -> Raw.Simple_async_result.complete obj

    method complete_in_idle : unit -> unit =
      fun () -> Raw.Simple_async_result.complete_in_idle obj

    method get_op_res_gboolean : unit -> bool =
      fun () -> Raw.Simple_async_result.get_op_res_gboolean obj

    method get_op_res_gssize : unit -> int =
      fun () -> Raw.Simple_async_result.get_op_res_gssize obj

    method propagate_error : unit -> (bool, GError.t) result =
      fun () -> Raw.Simple_async_result.propagate_error obj

    method set_check_cancellable : Cancellable.cancellable_t option -> unit =
      fun check_cancellable ->
        let check_cancellable =
          Option.map (fun c -> c#as_cancellable) check_cancellable
        in
        Raw.Simple_async_result.set_check_cancellable obj check_cancellable

    method set_from_error : GError.t -> unit =
      fun error -> Raw.Simple_async_result.set_from_error obj error

    method set_handle_cancellation : bool -> unit =
      fun handle_cancellation ->
        Raw.Simple_async_result.set_handle_cancellation obj handle_cancellation

    method set_op_res_gboolean : bool -> unit =
      fun op_res -> Raw.Simple_async_result.set_op_res_gboolean obj op_res

    method set_op_res_gssize : int -> unit =
      fun op_res -> Raw.Simple_async_result.set_op_res_gssize obj op_res

    method as_simple_async_result = obj
  end
