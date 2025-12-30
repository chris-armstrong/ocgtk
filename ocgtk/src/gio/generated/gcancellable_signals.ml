(* Signal handlers for Cancellable *)
class cancellable_signals (obj : Cancellable.t) = object
  (** Emitted when the operation has been cancelled.

Can be used by implementations of cancellable operations. If the
operation is cancelled from another thread, the signal will be
emitted in the thread that cancelled the operation, not the
thread that is running the operation.

Note that disconnecting from this signal (or any signal) in a
multi-threaded program is prone to race conditions. For instance
it is possible that a signal handler may be invoked even after
a call to g_signal_handler_disconnect() for that handler has
already returned.

There is also a problem when cancellation happens right before
connecting to the signal. If this happens the signal will
unexpectedly not be emitted, and checking before connecting to
the signal leaves a race condition where this is still happening.

In order to make it safe and easy to connect handlers there
are two helper functions: g_cancellable_connect() and
g_cancellable_disconnect() which protect against problems
like this.

An example of how to us this:
|[<!-- language="C" -->
    // Make sure we don't do unnecessary work if already cancelled
    if (g_cancellable_set_error_if_cancelled (cancellable, error))
      return;

    // Set up all the data needed to be able to handle cancellation
    // of the operation
    my_data = my_data_new (...);

    id = 0;
    if (cancellable)
      id = g_cancellable_connect (cancellable,
    			      G_CALLBACK (cancelled_handler)
    			      data, NULL);

    // cancellable operation here...

    g_cancellable_disconnect (cancellable, id);

    // cancelled_handler is never called after this, it is now safe
    // to free the data
    my_data_free (my_data);
]|

Note that the cancelled signal is emitted in the thread that
the user cancelled from, which may be the main thread. So, the
cancellable signal should not do something that can block. *)
  method on_cancelled ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"cancelled" ~callback ~after:false

end
