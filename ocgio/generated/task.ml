class type task_t = object
  inherit Async_result.async_result_t

  (** {2:methods Methods} *)

  method get_cancellable : unit -> Cancellable.cancellable_t option
  (** Gets [task]'s [GCancellable] *)

  method get_check_cancellable : unit -> bool
  (** Gets [task]'s check-cancellable flag. See g_task_set_check_cancellable()
      for more details. *)

  method get_completed : unit -> bool
  (** Gets the value of [GTask:completed]. This changes from [FALSE] to [TRUE]
      after the task’s callback is invoked, and will return [FALSE] if called
      from inside the callback. *)

  method get_name : unit -> string option
  (** Gets [task]’s name. See g_task_set_name(). *)

  method get_priority : unit -> int
  (** Gets [task]'s priority *)

  method get_return_on_cancel : unit -> bool
  (** Gets [task]'s return-on-cancel flag. See g_task_set_return_on_cancel() for
      more details. *)

  method had_error : unit -> bool
  (** Tests if [task] resulted in an error. *)

  method propagate_boolean : unit -> (bool, GError.t) result
  (** Gets the result of [task] as a #gboolean.

      If the task resulted in an error, or was cancelled, then this will instead
      return [FALSE] and set [error].

      Since this method transfers ownership of the return value (or error) to
      the caller, you may only call it once. *)

  method propagate_int : unit -> (int, GError.t) result
  (** Gets the result of [task] as an integer (#gssize).

      If the task resulted in an error, or was cancelled, then this will instead
      return -1 and set [error].

      Since this method transfers ownership of the return value (or error) to
      the caller, you may only call it once. *)

  method return_boolean : bool -> unit
  (** Sets [task]'s result to [result] and completes the task (see
      g_task_return_pointer() for more discussion of exactly what this means).
  *)

  method return_error : GError.t -> unit
  (** Sets [task]'s result to [error] (which [task] assumes ownership of) and
      completes the task (see g_task_return_pointer() for more discussion of
      exactly what this means).

      Note that since the task takes ownership of [error], and since the task
      may be completed before returning from g_task_return_error(), you cannot
      assume that [error] is still valid after calling this. Call g_error_copy()
      on the error if you need to keep a local copy as well.

      See also [Gio.Task.return_new_error], [Gio.Task.return_new_error_literal].
  *)

  method return_error_if_cancelled : unit -> bool
  (** Checks if [task]'s [GCancellable] has been cancelled, and if so, sets
      [task]'s error accordingly and completes the task (see
      g_task_return_pointer() for more discussion of exactly what this means).
  *)

  method return_int : int -> unit
  (** Sets [task]'s result to [result] and completes the task (see
      g_task_return_pointer() for more discussion of exactly what this means).
  *)

  method return_value : Gobject.Value.t option -> unit
  (** Sets [task]'s result to [result] (by copying it) and completes the task.

      If [result] is [NULL] then a [GValue] of type [G_TYPE_POINTER] with a
      value of [NULL] will be used for the result.

      This is a very generic low-level method intended primarily for use by
      language bindings; for C code, g_task_return_pointer() and the like will
      normally be much easier to use. *)

  method set_check_cancellable : bool -> unit
  [@@ocaml.doc
    "Sets or clears [task]'s check-cancellable flag. If this is [TRUE]\n\
     (the default), then g_task_propagate_pointer(), etc, and\n\
     g_task_had_error() will check the task's [GCancellable] first, and\n\
     if it has been cancelled, then they will consider the task to have\n\
     returned an \"Operation was cancelled\" error\n\
     ([G_IO_ERROR_CANCELLED]), regardless of any other error or return\n\
     value the task may have had.\n\n\
     If [check_cancellable] is [FALSE], then the [GTask] will not check the\n\
     cancellable itself, and it is up to [task]'s owner to do this (eg,\n\
     via g_task_return_error_if_cancelled()).\n\n\
     If you are using g_task_set_return_on_cancel() as well, then\n\
     you must leave check-cancellable set [TRUE]."]

  method set_name : string option -> unit
  (** Sets [task]’s name, used in debugging and profiling. The name defaults to
      [NULL].

      The task name should describe in a human readable way what the task does.
      For example, ‘Open file’ or ‘Connect to network host’. It is used to set
      the name of the [GSource] used for idle completion of the task.

      This function may only be called before the [task] is first used in a
      thread other than the one it was constructed in. *)

  method set_priority : int -> unit
  (** Sets [task]'s priority. If you do not call this, it will default to
      [G_PRIORITY_DEFAULT].

      This will affect the priority of [GSources] created with
      g_task_attach_source() and the scheduling of tasks run in threads, and can
      also be explicitly retrieved later via g_task_get_priority(). *)

  method set_return_on_cancel : bool -> bool
  (** Sets or clears [task]'s return-on-cancel flag. This is only meaningful for
      tasks run via g_task_run_in_thread() or g_task_run_in_thread_sync().

      If [return_on_cancel] is [TRUE], then cancelling [task]'s [GCancellable]
      will immediately cause it to return, as though the task's
      [GTaskThreadFunc] had called g_task_return_error_if_cancelled() and then
      returned.

      This allows you to create a cancellable wrapper around an uninterruptible
      function. The [GTaskThreadFunc] just needs to be careful that it does not
      modify any externally-visible state after it has been cancelled. To do
      that, the thread should call g_task_set_return_on_cancel() again to
      (atomically) set return-on-cancel [FALSE] before making externally-visible
      changes; if the task gets cancelled before the return-on-cancel flag could
      be changed, g_task_set_return_on_cancel() will indicate this by returning
      [FALSE].

      You can disable and re-enable this flag multiple times if you wish. If the
      task's [GCancellable] is cancelled while return-on-cancel is [FALSE], then
      calling g_task_set_return_on_cancel() to set it [TRUE] again will cause
      the task to be cancelled at that point.

      If the task's [GCancellable] is already cancelled before you call
      g_task_run_in_thread()/g_task_run_in_thread_sync(), then the
      [GTaskThreadFunc] will still be run (for consistency), but the task will
      also be completed right away. *)

  method set_static_name : string option -> unit
  (** Sets [task]’s name, used in debugging and profiling.

      This is a variant of g_task_set_name() that avoids copying [name].

      This function is called automatically by [Gio.Task.set_source_tag] unless
      a name is set. *)

  (** {2:conversions Conversions} *)

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
