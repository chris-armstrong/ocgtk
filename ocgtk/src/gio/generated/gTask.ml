(* High-level class for Task *)
class task (obj : Task.t) = object (self)

  method get_cancellable : unit -> GCancellable.cancellable option =
    fun () ->
      Option.map (fun ret -> new GCancellable.cancellable ret) (Task.get_cancellable obj)

  method get_check_cancellable : unit -> bool =
    fun () ->
      (Task.get_check_cancellable obj)

  method get_completed : unit -> bool =
    fun () ->
      (Task.get_completed obj)

  method get_name : unit -> string option =
    fun () ->
      (Task.get_name obj)

  method get_priority : unit -> int =
    fun () ->
      (Task.get_priority obj)

  method get_return_on_cancel : unit -> bool =
    fun () ->
      (Task.get_return_on_cancel obj)

  method had_error : unit -> bool =
    fun () ->
      (Task.had_error obj)

  method propagate_boolean : unit -> (bool, GError.t) result =
    fun () ->
      (Task.propagate_boolean obj)

  method return_boolean : bool -> unit =
    fun result ->
      (Task.return_boolean obj result)

  method return_error_if_cancelled : unit -> bool =
    fun () ->
      (Task.return_error_if_cancelled obj)

  method set_check_cancellable : bool -> unit =
    fun check_cancellable ->
      (Task.set_check_cancellable obj check_cancellable)

  method set_name : string option -> unit =
    fun name ->
      (Task.set_name obj name)

  method set_priority : int -> unit =
    fun priority ->
      (Task.set_priority obj priority)

  method set_return_on_cancel : bool -> bool =
    fun return_on_cancel ->
      (Task.set_return_on_cancel obj return_on_cancel)

  method set_static_name : string option -> unit =
    fun name ->
      (Task.set_static_name obj name)

    method as_task = obj
end

