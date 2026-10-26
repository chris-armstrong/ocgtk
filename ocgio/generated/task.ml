class type task_t = object
  inherit Async_result.async_result_t
  method get_cancellable : unit -> Cancellable.cancellable_t option
  method get_check_cancellable : unit -> bool
  method get_completed : unit -> bool
  method get_name : unit -> string option
  method get_priority : unit -> int
  method get_return_on_cancel : unit -> bool
  method had_error : unit -> bool
  method propagate_boolean : unit -> (bool, GError.t) result
  method propagate_int : unit -> (int, GError.t) result
  method return_boolean : bool -> unit
  method return_error : GError.t -> unit
  method return_error_if_cancelled : unit -> bool
  method return_int : int -> unit
  method return_value : Gobject.Value.t option -> unit
  method set_check_cancellable : bool -> unit
  method set_name : string option -> unit
  method set_priority : int -> unit
  method set_return_on_cancel : bool -> bool
  method set_static_name : string option -> unit
  method as_task : Raw.Task.t
end

(* High-level class for Task *)
class task (obj : Raw.Task.t) : task_t =
  object (self)
    inherit Async_result.async_result (Raw.Async_result.from_gobject obj)

    method get_cancellable : unit -> Cancellable.cancellable_t option =
      fun () ->
        Option.map
          (fun ret -> new Cancellable.cancellable ret)
          (Raw.Task.get_cancellable obj)

    method get_check_cancellable : unit -> bool =
      fun () -> Raw.Task.get_check_cancellable obj

    method get_completed : unit -> bool = fun () -> Raw.Task.get_completed obj
    method get_name : unit -> string option = fun () -> Raw.Task.get_name obj
    method get_priority : unit -> int = fun () -> Raw.Task.get_priority obj

    method get_return_on_cancel : unit -> bool =
      fun () -> Raw.Task.get_return_on_cancel obj

    method had_error : unit -> bool = fun () -> Raw.Task.had_error obj

    method propagate_boolean : unit -> (bool, GError.t) result =
      fun () -> Raw.Task.propagate_boolean obj

    method propagate_int : unit -> (int, GError.t) result =
      fun () -> Raw.Task.propagate_int obj

    method return_boolean : bool -> unit =
      fun result -> Raw.Task.return_boolean obj result

    method return_error : GError.t -> unit =
      fun error -> Raw.Task.return_error obj error

    method return_error_if_cancelled : unit -> bool =
      fun () -> Raw.Task.return_error_if_cancelled obj

    method return_int : int -> unit =
      fun result -> Raw.Task.return_int obj result

    method return_value : Gobject.Value.t option -> unit =
      fun result -> Raw.Task.return_value obj result

    method set_check_cancellable : bool -> unit =
      fun check_cancellable ->
        Raw.Task.set_check_cancellable obj check_cancellable

    method set_name : string option -> unit =
      fun name -> Raw.Task.set_name obj name

    method set_priority : int -> unit =
      fun priority -> Raw.Task.set_priority obj priority

    method set_return_on_cancel : bool -> bool =
      fun return_on_cancel -> Raw.Task.set_return_on_cancel obj return_on_cancel

    method set_static_name : string option -> unit =
      fun name -> Raw.Task.set_static_name obj name

    method as_task = obj
  end
