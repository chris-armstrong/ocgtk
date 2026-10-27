class type cancellable_t = object
  method on_cancelled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method cancel : unit -> unit
  (** Will set [cancellable] to cancelled, and will emit the
      [GCancellable::cancelled] signal. (However, see the warning about race
      conditions in the documentation for that signal if you are planning to
      connect to it.)

      This function is thread-safe. In other words, you can safely call it from
      a thread other than the one running the operation that was passed the
      [cancellable].

      If [cancellable] is [NULL], this function returns immediately for
      convenience.

      The convention within GIO is that cancelling an asynchronous operation
      causes it to complete asynchronously. That is, if you cancel the operation
      from the same thread in which it is running, then the operation's
      [GAsyncReadyCallback] will not be invoked until the application returns to
      the main loop.

      It is safe (although useless, since it will be a no-op) to call this
      function from a [Gio.Cancellable::cancelled] signal handler. *)

  method disconnect : int -> unit
  (** Disconnects a handler from a cancellable instance similar to
      g_signal_handler_disconnect(). Additionally, in the event that a signal
      handler is currently running, this call will block until the handler has
      finished. Calling this function from a [GCancellable::cancelled] signal
      handler will therefore result in a deadlock.

      This avoids a race condition where a thread cancels at the same time as
      the cancellable operation is finished and the signal handler is removed.
      See [GCancellable::cancelled] for details on how to use this.

      If [cancellable] is [NULL] or [handler_id] is [0] this function does
      nothing. *)

  method get_fd : unit -> int
  (** Gets the file descriptor for a cancellable job. This can be used to
      implement cancellable operations on Unix systems. The returned fd will
      turn readable when [cancellable] is cancelled.

      You are not supposed to read from the fd yourself, just check for readable
      status. Reading to unset the readable status is done with
      g_cancellable_reset().

      After a successful return from this function, you should use
      g_cancellable_release_fd() to free up resources allocated for the returned
      file descriptor.

      See also g_cancellable_make_pollfd(). *)

  method is_cancelled : unit -> bool
  (** Checks if a cancellable job has been cancelled. *)

  method pop_current : unit -> unit
  (** Pops [cancellable] off the cancellable stack (verifying that [cancellable]
      is on the top of the stack). *)

  method push_current : unit -> unit
  (** Pushes [cancellable] onto the cancellable stack. The current cancellable
      can then be received using g_cancellable_get_current().

      This is useful when implementing cancellable operations in code that does
      not allow you to pass down the cancellable object.

      This is typically called automatically by e.g. [GFile] operations, so you
      rarely have to call this yourself. *)

  method release_fd : unit -> unit
  (** Releases a resources previously allocated by g_cancellable_get_fd() or
      g_cancellable_make_pollfd().

      For compatibility reasons with older releases, calling this function is
      not strictly required, the resources will be automatically freed when the
      [cancellable] is finalized. However, the [cancellable] will block scarce
      file descriptors until it is finalized if this function is not called.
      This can cause the application to run out of file descriptors when many
      [GCancellables] are used at the same time.

      Note that in the event that a [Gio.Cancellable::cancelled] signal handler
      is currently running, this call will block until the handler has finished.
      Calling this function from a signal handler will therefore result in a
      deadlock. *)

  method reset : unit -> unit
  (** Resets [cancellable] to its uncancelled state.

      If cancellable is currently in use by any cancellable operation then the
      behavior of this function is undefined.

      Note that it is generally not a good idea to reuse an existing cancellable
      for more operations after it has been cancelled once, as this function
      might tempt you to do. The recommended practice is to drop the reference
      to a cancellable after cancelling it, and let it die with the outstanding
      async operations. You should create a fresh cancellable for further async
      operations.

      In the event that a [Gio.Cancellable::cancelled] signal handler is
      currently running, this call will block until the handler has finished.
      Calling this function from a signal handler will therefore result in a
      deadlock. *)

  method set_error_if_cancelled : unit -> (bool, GError.t) result
  (** If the [cancellable] is cancelled, sets the error to notify that the
      operation was cancelled. *)

  method as_cancellable : Raw.Cancellable.t
end

(* High-level class for Cancellable *)
class cancellable (obj : Raw.Cancellable.t) : cancellable_t =
  object (self)
    method on_cancelled ?(after = false) ~callback () =
      Raw.Cancellable.on_cancelled ~after self#as_cancellable ~callback

    method cancel : unit -> unit = fun () -> Raw.Cancellable.cancel obj

    method disconnect : int -> unit =
      fun handler_id -> Raw.Cancellable.disconnect obj handler_id

    method get_fd : unit -> int = fun () -> Raw.Cancellable.get_fd obj

    method is_cancelled : unit -> bool =
      fun () -> Raw.Cancellable.is_cancelled obj

    method pop_current : unit -> unit =
      fun () -> Raw.Cancellable.pop_current obj

    method push_current : unit -> unit =
      fun () -> Raw.Cancellable.push_current obj

    method release_fd : unit -> unit = fun () -> Raw.Cancellable.release_fd obj
    method reset : unit -> unit = fun () -> Raw.Cancellable.reset obj

    method set_error_if_cancelled : unit -> (bool, GError.t) result =
      fun () -> Raw.Cancellable.set_error_if_cancelled obj

    method as_cancellable = obj
  end

let new_ () : cancellable_t = new cancellable (Raw.Cancellable.new_ ())
