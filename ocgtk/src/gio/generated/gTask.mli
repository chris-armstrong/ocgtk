class task : Task.t ->
  object
    method get_cancellable : unit -> GCancellable.cancellable option
    method get_check_cancellable : unit -> bool
    method get_completed : unit -> bool
    method get_name : unit -> string option
    method get_priority : unit -> int
    method get_return_on_cancel : unit -> bool
    method had_error : unit -> bool
    method propagate_boolean : unit -> (bool, GError.t) result
    method return_boolean : bool -> unit
    method return_error_if_cancelled : unit -> bool
    method set_check_cancellable : bool -> unit
    method set_name : string option -> unit
    method set_priority : int -> unit
    method set_return_on_cancel : bool -> bool
    method set_static_name : string option -> unit
    method as_task : Task.t
  end

