[@@@ocaml.text
"[GAsyncResult] provides a base class for implementing asynchronous function \
 results.\n\n\
 Asynchronous operations are broken up into two separate operations\n\
 which are chained together by a [GAsyncReadyCallback]. To begin\n\
 an asynchronous operation, provide a [GAsyncReadyCallback] to the\n\
 asynchronous function. This callback will be triggered when the\n\
 operation has completed, and must be run in a later iteration of\n\
 the thread-default main context (see\n\
 [GLib.MainContext.push_thread_default]) from where the operation was\n\
 initiated. It will be passed a [GAsyncResult] instance filled with the\n\
 details of the operation's success or failure, the object the asynchronous\n\
 function was started for and any error codes returned. The asynchronous\n\
 callback function is then expected to call the corresponding [_finish()]\n\
 function, passing the object the function was called for, the\n\
 [GAsyncResult] instance, and (optionally) an [error] to grab any\n\
 error conditions that may have occurred.\n\n\
 The [_finish()] function for an operation takes the generic result\n\
 (of type [GAsyncResult]) and returns the specific result that the\n\
 operation in question yields (e.g. a [Gio.FileEnumerator] for a\n\
 \"enumerate children\" operation). If the result or error status of the\n\
 operation is not needed, there is no need to call the [_finish()]\n\
 function; GIO will take care of cleaning up the result and error\n\
 information after the [GAsyncReadyCallback] returns. You can pass\n\
 [NULL] for the [GAsyncReadyCallback] if you don't need to take any\n\
 action at all after the operation completes. Applications may also\n\
 take a reference to the [GAsyncResult] and call [_finish()] later;\n\
 however, the [_finish()] function may be called at most once.\n\n\
 Example of a typical asynchronous operation flow:\n\n\
 {[\n\
 void _theoretical_frobnitz_async (Theoretical         *t,\n\
\                                  GCancellable        *c,\n\
\                                  GAsyncReadyCallback  cb,\n\
\                                  gpointer             u);\n\n\
 gboolean _theoretical_frobnitz_finish (Theoretical   *t,\n\
\                                       GAsyncResult  *res,\n\
\                                       GError       **e);\n\n\
 static void\n\
 frobnitz_result_func (GObject      *source_object,\n\
 \t\t GAsyncResult *res,\n\
 \t\t gpointer      user_data)\n\
 {\n\
\  gboolean success = FALSE;\n\n\
\  success = _theoretical_frobnitz_finish (source_object, res, NULL);\n\n\
\  if (success)\n\
\    g_printf (\"Hurray!\\n\");\n\
\  else\n\
\    g_printf (\"Uh oh!\\n\");\n\n\
\  ...\n\n\
 }\n\n\
 int main (int argc, void *argv[])\n\
 {\n\
\   ...\n\n\
\   _theoretical_frobnitz_async (theoretical_data,\n\
\                                NULL,\n\
\                                frobnitz_result_func,\n\
\                                NULL);\n\n\
\   ...\n\
 }\n\
 ]}\n\n\
 The callback for an asynchronous operation is called only once, and is\n\
 always called, even in the case of a cancelled operation. On cancellation\n\
 the result is a [G_IO_ERROR_CANCELLED] error.\n\n\
 {b I/O Priority}\n\n\
 Many I/O-related asynchronous operations have a priority parameter,\n\
 which is used in certain cases to determine the order in which\n\
 operations are executed. They are not used to determine system-wide\n\
 I/O scheduling. Priorities are integers, with lower numbers indicating\n\
 higher priority. It is recommended to choose priorities between\n\
 [G_PRIORITY_LOW] and [G_PRIORITY_HIGH], with [G_PRIORITY_DEFAULT]\n\
 as a default.\n\n\
 Its methods, signals and properties are on {!class-type-async_result_t}. The \
 functions it is built on are in {!Ocgio.Raw.Async_result}."]

(** The methods, signals and properties of a [GAsyncResult]. *)
class type async_result_t = object
  method get_source_object : unit -> [ `object_ ] Gobject.obj option
  method legacy_propagate_error : unit -> (bool, GError.t) result
  method as_async_result : Raw.Async_result.t
end

class async_result : Raw.Async_result.t -> async_result_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Async_result.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GAsyncResult], give one already wrapped. *)
