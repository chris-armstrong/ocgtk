(* GENERATED CODE - DO NOT EDIT *)
(* Task: Task *)

type t = [`task | `object_] Gobject.obj

(** Create a new Task *)
external new_ : unit -> Cancellable.t option -> unit -> unit -> t = "ml_g_task_new"

(* Methods *)
(** Sets @task’s name, used in debugging and profiling.

This is a variant of g_task_set_name() that avoids copying @name. *)
external set_static_name : t -> string option -> unit = "ml_g_task_set_static_name"

(** Sets or clears @task's return-on-cancel flag. This is only
meaningful for tasks run via g_task_run_in_thread() or
g_task_run_in_thread_sync().

If @return_on_cancel is %TRUE, then cancelling @task's
#GCancellable will immediately cause it to return, as though the
task's #GTaskThreadFunc had called
g_task_return_error_if_cancelled() and then returned.

This allows you to create a cancellable wrapper around an
uninterruptible function. The #GTaskThreadFunc just needs to be
careful that it does not modify any externally-visible state after
it has been cancelled. To do that, the thread should call
g_task_set_return_on_cancel() again to (atomically) set
return-on-cancel %FALSE before making externally-visible changes;
if the task gets cancelled before the return-on-cancel flag could
be changed, g_task_set_return_on_cancel() will indicate this by
returning %FALSE.

You can disable and re-enable this flag multiple times if you wish.
If the task's #GCancellable is cancelled while return-on-cancel is
%FALSE, then calling g_task_set_return_on_cancel() to set it %TRUE
again will cause the task to be cancelled at that point.

If the task's #GCancellable is already cancelled before you call
g_task_run_in_thread()/g_task_run_in_thread_sync(), then the
#GTaskThreadFunc will still be run (for consistency), but the task
will also be completed right away. *)
external set_return_on_cancel : t -> bool -> bool = "ml_g_task_set_return_on_cancel"

(** Sets @task's priority. If you do not call this, it will default to
%G_PRIORITY_DEFAULT.

This will affect the priority of #GSources created with
g_task_attach_source() and the scheduling of tasks run in threads,
and can also be explicitly retrieved later via
g_task_get_priority(). *)
external set_priority : t -> int -> unit = "ml_g_task_set_priority"

(** Sets @task’s name, used in debugging and profiling. The name defaults to
%NULL.

The task name should describe in a human readable way what the task does.
For example, ‘Open file’ or ‘Connect to network host’. It is used to set the
name of the #GSource used for idle completion of the task.

This function may only be called before the @task is first used in a thread
other than the one it was constructed in. It is called automatically by
g_task_set_source_tag() if not called already. *)
external set_name : t -> string option -> unit = "ml_g_task_set_name"

(** Sets or clears @task's check-cancellable flag. If this is %TRUE
(the default), then g_task_propagate_pointer(), etc, and
g_task_had_error() will check the task's #GCancellable first, and
if it has been cancelled, then they will consider the task to have
returned an "Operation was cancelled" error
(%G_IO_ERROR_CANCELLED), regardless of any other error or return
value the task may have had.

If @check_cancellable is %FALSE, then the #GTask will not check the
cancellable itself, and it is up to @task's owner to do this (eg,
via g_task_return_error_if_cancelled()).

If you are using g_task_set_return_on_cancel() as well, then
you must leave check-cancellable set %TRUE. *)
external set_check_cancellable : t -> bool -> unit = "ml_g_task_set_check_cancellable"

(** Checks if @task's #GCancellable has been cancelled, and if so, sets
@task's error accordingly and completes the task (see
g_task_return_pointer() for more discussion of exactly what this
means). *)
external return_error_if_cancelled : t -> bool = "ml_g_task_return_error_if_cancelled"

(** Sets @task's result to @result and completes the task (see
g_task_return_pointer() for more discussion of exactly what this
means). *)
external return_boolean : t -> bool -> unit = "ml_g_task_return_boolean"

(** Gets the result of @task as a #gboolean.

If the task resulted in an error, or was cancelled, then this will
instead return %FALSE and set @error.

Since this method transfers ownership of the return value (or
error) to the caller, you may only call it once. *)
external propagate_boolean : t -> (bool, GError.t) result = "ml_g_task_propagate_boolean"

(** Tests if @task resulted in an error. *)
external had_error : t -> bool = "ml_g_task_had_error"

(** Gets @task's return-on-cancel flag. See
g_task_set_return_on_cancel() for more details. *)
external get_return_on_cancel : t -> bool = "ml_g_task_get_return_on_cancel"

(** Gets @task's priority *)
external get_priority : t -> int = "ml_g_task_get_priority"

(** Gets @task’s name. See g_task_set_name(). *)
external get_name : t -> string option = "ml_g_task_get_name"

(** Gets the value of #GTask:completed. This changes from %FALSE to %TRUE after
the task’s callback is invoked, and will return %FALSE if called from inside
the callback. *)
external get_completed : t -> bool = "ml_g_task_get_completed"

(** Gets @task's check-cancellable flag. See
g_task_set_check_cancellable() for more details. *)
external get_check_cancellable : t -> bool = "ml_g_task_get_check_cancellable"

(** Gets @task's #GCancellable *)
external get_cancellable : t -> Cancellable.t option = "ml_g_task_get_cancellable"

(* Properties *)

