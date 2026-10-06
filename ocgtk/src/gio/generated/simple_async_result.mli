(* GENERATED CODE - DO NOT EDIT *)
(* SimpleAsyncResult: SimpleAsyncResult *)

[@@@ocaml.text
"As of GLib 2.46, [GSimpleAsyncResult] is deprecated in favor of\n\
 [Gio.Task], which provides a simpler API.\n\n\
 [GSimpleAsyncResult] implements [Gio.AsyncResult].\n\n\
 [GSimpleAsyncResult] handles [Gio.AsyncReadyCallback]s, error\n\
 reporting, operation cancellation and the final state of an operation,\n\
 completely transparent to the application. Results can be returned\n\
 as a pointer e.g. for functions that return data that is collected\n\
 asynchronously, a boolean value for checking the success or failure\n\
 of an operation, or a [gssize] for operations which return the number\n\
 of bytes modified by the operation; all of the simple return cases\n\
 are covered.\n\n\
 Most of the time, an application will not need to know of the details\n\
 of this API; it is handled transparently, and any necessary operations\n\
 are handled by [Gio.AsyncResult]’s interface. However, if implementing\n\
 a new GIO module, for writing language bindings, or for complex\n\
 applications that need better control of how asynchronous operations\n\
 are completed, it is important to understand this functionality.\n\n\
 [GSimpleAsyncResult]s are tagged with the calling function to ensure\n\
 that asynchronous functions and their finishing functions are used\n\
 together correctly.\n\n\
 To create a new [GSimpleAsyncResult], call [Gio.SimpleAsyncResult.new].\n\
 If the result needs to be created for a [GError], use\n\
 [Gio.SimpleAsyncResult.new_from_error] or\n\
 [Gio.SimpleAsyncResult.new_take_error]. If a [GError] is not available\n\
 (e.g. the asynchronous operation doesn’t take a [GError] argument),\n\
 but the result still needs to be created for an error condition, use\n\
 [Gio.SimpleAsyncResult.new_error] (or\n\
 [Gio.SimpleAsyncResult.set_error_va] if your application or binding\n\
 requires passing a variable argument list directly), and the error can then\n\
 be propagated through the use of\n\
 [Gio.SimpleAsyncResult.propagate_error].\n\n\
 An asynchronous operation can be made to ignore a cancellation event by\n\
 calling [Gio.SimpleAsyncResult.set_handle_cancellation] with a\n\
 [GSimpleAsyncResult] for the operation and [FALSE]. This is useful for\n\
 operations that are dangerous to cancel, such as close (which would\n\
 cause a leak if cancelled before being run).\n\n\
 [GSimpleAsyncResult] can integrate into GLib’s event loop,\n\
 [GLib.MainLoop], or it can use [GLib.Thread]s.\n\
 [Gio.SimpleAsyncResult.complete] will finish an I/O task directly\n\
 from the point where it is called.\n\
 [Gio.SimpleAsyncResult.complete_in_idle] will finish it from an idle\n\
 handler in the  thread-default main context (see\n\
 [GLib.MainContext.push_thread_default]) where the [GSimpleAsyncResult]\n\
 was created. [Gio.SimpleAsyncResult.run_in_thread] will run the job in\n\
 a separate thread and then use\n\
 [Gio.SimpleAsyncResult.complete_in_idle] to deliver the result.\n\n\
 To set the results of an asynchronous function,\n\
 [Gio.SimpleAsyncResult.set_op_res_gpointer],\n\
 [Gio.SimpleAsyncResult.set_op_res_gboolean], and\n\
 [Gio.SimpleAsyncResult.set_op_res_gssize]\n\
 are provided, setting the operation's result to a [gpointer], [gboolean], or\n\
 [gssize], respectively.\n\n\
 Likewise, to get the result of an asynchronous function,\n\
 [Gio.SimpleAsyncResult.get_op_res_gpointer],\n\
 [Gio.SimpleAsyncResult.get_op_res_gboolean], and\n\
 [Gio.SimpleAsyncResult.get_op_res_gssize] are\n\
 provided, getting the operation’s result as a [gpointer], [gboolean], and\n\
 [gssize], respectively.\n\n\
 For the details of the requirements implementations must respect, see\n\
 [Gio.AsyncResult].  A typical implementation of an asynchronous\n\
 operation using [GSimpleAsyncResult] looks something like this:\n\n\
 {[\n\
 static void\n\
 baked_cb (Cake    *cake,\n\
\          gpointer user_data)\n\
 {\n\
\  // In this example, this callback is not given a reference to the cake,\n\
\  // so the GSimpleAsyncResult has to take a reference to it.\n\
\  GSimpleAsyncResult *result = user_data;\n\n\
\  if (cake == NULL)\n\
\    g_simple_async_result_set_error (result,\n\
\                                     BAKER_ERRORS,\n\
\                                     BAKER_ERROR_NO_FLOUR,\n\
\                                     \"Go to the supermarket\");\n\
\  else\n\
\    g_simple_async_result_set_op_res_gpointer (result,\n\
\                                               g_object_ref (cake),\n\
\                                               g_object_unref);\n\n\n\
\  // In this example, we assume that baked_cb is called as a callback from\n\
\  // the mainloop, so it's safe to complete the operation synchronously here.\n\
\  // If, however, _baker_prepare_cake () might call its callback without\n\
\  // first returning to the mainloop — inadvisable, but some APIs do so —\n\
\  // we would need to use g_simple_async_result_complete_in_idle().\n\
\  g_simple_async_result_complete (result);\n\
\  g_object_unref (result);\n\
 }\n\n\
 void\n\
 baker_bake_cake_async (Baker              *self,\n\
\                       guint               radius,\n\
\                       GAsyncReadyCallback callback,\n\
\                       gpointer            user_data)\n\
 {\n\
\  GSimpleAsyncResult *simple;\n\
\  Cake               *cake;\n\n\
\  if (radius < 3)\n\
\    {\n\
\      g_simple_async_report_error_in_idle (G_OBJECT (self),\n\
\                                           callback,\n\
\                                           user_data,\n\
\                                           BAKER_ERRORS,\n\
\                                           BAKER_ERROR_TOO_SMALL,\n\
\                                           \"%ucm radius cakes are silly\",\n\
\                                           radius);\n\
\      return;\n\
\    }\n\n\
\  simple = g_simple_async_result_new (G_OBJECT (self),\n\
\                                      callback,\n\
\                                      user_data,\n\
\                                      baker_bake_cake_async);\n\
\  cake = _baker_get_cached_cake (self, radius);\n\n\
\  if (cake != NULL)\n\
\    {\n\
\      g_simple_async_result_set_op_res_gpointer (simple,\n\
\                                                 g_object_ref (cake),\n\
\                                                 g_object_unref);\n\
\      g_simple_async_result_complete_in_idle (simple);\n\
\      g_object_unref (simple);\n\
\      // Drop the reference returned by _baker_get_cached_cake();\n\
\      // the GSimpleAsyncResult has taken its own reference.\n\
\      g_object_unref (cake);\n\
\      return;\n\
\    }\n\n\
\  _baker_prepare_cake (self, radius, baked_cb, simple);\n\
 }\n\n\
 Cake *\n\
 baker_bake_cake_finish (Baker        *self,\n\
\                        GAsyncResult *result,\n\
\                        GError      **error)\n\
 {\n\
\  GSimpleAsyncResult *simple;\n\
\  Cake               *cake;\n\n\
\  g_return_val_if_fail (g_simple_async_result_is_valid (result,\n\
\                                                        G_OBJECT (self),\n\
\                                                        baker_bake_cake_async),\n\
\                        NULL);\n\n\
\  simple = (GSimpleAsyncResult *\\) result;\n\n\
\  if (g_simple_async_result_propagate_error (simple, error))\n\
\    return NULL;\n\n\
\  cake = CAKE (g_simple_async_result_get_op_res_gpointer (simple));\n\
\  return g_object_ref (cake);\n\
 }\n\
 ]}"]

type t = [ `simple_async_result | `object_ ] Gobject.obj

(* Methods *)

external set_op_res_gssize : t -> int -> unit
  = "ml_g_simple_async_result_set_op_res_gssize"
(** Sets the operation result within the asynchronous result to the given
    [op_res]. *)

external set_op_res_gboolean : t -> bool -> unit
  = "ml_g_simple_async_result_set_op_res_gboolean"
(** Sets the operation result to a boolean within the asynchronous result. *)

external set_handle_cancellation : t -> bool -> unit
  = "ml_g_simple_async_result_set_handle_cancellation"
(** Sets whether to handle cancellation within the asynchronous operation.

    This function has nothing to do with
    g_simple_async_result_set_check_cancellable(). It only refers to the
    [GCancellable] passed to g_simple_async_result_run_in_thread(). *)

external set_from_error : t -> GError.t -> unit
  = "ml_g_simple_async_result_set_from_error"
(** Sets the result from a [GError]. *)

external set_check_cancellable : t -> Cancellable.t option -> unit
  = "ml_g_simple_async_result_set_check_cancellable"
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

external propagate_error : t -> (bool, GError.t) result
  = "ml_g_simple_async_result_propagate_error"
(** Propagates an error from within the simple asynchronous result to a given
    destination.

    If the [GCancellable] given to a prior call to
    g_simple_async_result_set_check_cancellable() is cancelled then this
    function will return [TRUE] with [dest] set appropriately. *)

external get_op_res_gssize : t -> int
  = "ml_g_simple_async_result_get_op_res_gssize"
(** Gets a gssize from the asynchronous result. *)

external get_op_res_gboolean : t -> bool
  = "ml_g_simple_async_result_get_op_res_gboolean"
(** Gets the operation result boolean from within the asynchronous result. *)

external complete_in_idle : t -> unit
  = "ml_g_simple_async_result_complete_in_idle"
(** Completes an asynchronous function in an idle handler in the thread-default
    main context (see [GLib.MainContext.push_thread_default]) of the thread that
    [simple] was initially created in (and re-pushes that context around the
    invocation of the callback).

    Calling this function takes a reference to [simple] for as long as is needed
    to complete the call. *)

external complete : t -> unit = "ml_g_simple_async_result_complete"
(** Completes an asynchronous I/O job immediately. Must be called in the thread
    where the asynchronous result was to be delivered, as it invokes the
    callback directly. If you are in a different thread use
    g_simple_async_result_complete_in_idle().

    Calling this function takes a reference to [simple] for as long as is needed
    to complete the call. *)
