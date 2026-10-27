[@@@ocaml.text
"A [GTask] represents and manages a cancellable ‘task’.\n\n\
 {b Asynchronous operations}\n\n\
 The most common usage of [GTask] is as a [Gio.AsyncResult], to\n\
 manage data during an asynchronous operation. You call\n\
 [Gio.Task.new] in the ‘start’ method, followed by\n\
 [Gio.Task.set_task_data] and the like if you need to keep some\n\
 additional data associated with the task, and then pass the\n\
 task object around through your asynchronous operation.\n\
 Eventually, you will call a method such as\n\
 [Gio.Task.return_pointer] or [Gio.Task.return_error], which\n\
 will save the value you give it and then invoke the task’s callback\n\
 function in the thread-default main context (see\n\
 [GLib.MainContext.push_thread_default])\n\
 where it was created (waiting until the next iteration of the main\n\
 loop first, if necessary). The caller will pass the [GTask] back to\n\
 the operation’s finish function (as a [Gio.AsyncResult]), and you can\n\
 use [Gio.Task.propagate_pointer] or the like to extract the\n\
 return value.\n\n\
 Using [GTask] requires the thread-default [GLib.MainContext] from when\n\
 the [GTask] was constructed to be running at least until the task has\n\
 completed and its data has been freed.\n\n\
 If a [GTask] has been constructed and its callback set, it is an error to\n\
 not call [g_task_return_*()] on it. GLib will warn at runtime if this happens\n\
 (since 2.76).\n\n\
 Here is an example for using [GTask] as a [Gio.AsyncResult]:\n\n\
 {[\n\
 typedef struct {\n\
\  CakeFrostingType frosting;\n\
\  char *message;\n\
 } DecorationData;\n\n\
 static void\n\
 decoration_data_free (DecorationData *decoration)\n\
 {\n\
\  g_free (decoration->message);\n\
\  g_slice_free (DecorationData, decoration);\n\
 }\n\n\
 static void\n\
 baked_cb (Cake     *cake,\n\
\          gpointer  user_data)\n\
 {\n\
\  GTask *task = user_data;\n\
\  DecorationData *decoration = g_task_get_task_data (task);\n\
\  GError *error = NULL;\n\n\
\  if (cake == NULL)\n\
\    {\n\
\      g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_NO_FLOUR,\n\
\                               \"Go to the supermarket\");\n\
\      g_object_unref (task);\n\
\      return;\n\
\    }\n\n\
\  if (!cake_decorate (cake, decoration->frosting, decoration->message, &error))\n\
\    {\n\
\      g_object_unref (cake);\n\
\      // g_task_return_error() takes ownership of error\n\
\      g_task_return_error (task, error);\n\
\      g_object_unref (task);\n\
\      return;\n\
\    }\n\n\
\  g_task_return_pointer (task, cake, g_object_unref);\n\
\  g_object_unref (task);\n\
 }\n\n\
 void\n\
 baker_bake_cake_async (Baker               *self,\n\
\                       guint                radius,\n\
\                       CakeFlavor           flavor,\n\
\                       CakeFrostingType     frosting,\n\
\                       const char          *message,\n\
\                       GCancellable        *cancellable,\n\
\                       GAsyncReadyCallback  callback,\n\
\                       gpointer             user_data)\n\
 {\n\
\  GTask *task;\n\
\  DecorationData *decoration;\n\
\  Cake  *cake;\n\n\
\  task = g_task_new (self, cancellable, callback, user_data);\n\
\  if (radius < 3)\n\
\    {\n\
\      g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_TOO_SMALL,\n\
\                               \"%ucm radius cakes are silly\",\n\
\                               radius);\n\
\      g_object_unref (task);\n\
\      return;\n\
\    }\n\n\
\  cake = _baker_get_cached_cake (self, radius, flavor, frosting, message);\n\
\  if (cake != NULL)\n\
\    {\n\
\      // _baker_get_cached_cake() returns a reffed cake\n\
\      g_task_return_pointer (task, cake, g_object_unref);\n\
\      g_object_unref (task);\n\
\      return;\n\
\    }\n\n\
\  decoration = g_slice_new (DecorationData);\n\
\  decoration->frosting = frosting;\n\
\  decoration->message = g_strdup (message);\n\
\  g_task_set_task_data (task, decoration, (GDestroyNotify) \
 decoration_data_free);\n\n\
\  _baker_begin_cake (self, radius, flavor, cancellable, baked_cb, task);\n\
 }\n\n\
 Cake *\n\
 baker_bake_cake_finish (Baker         *self,\n\
\                        GAsyncResult  *result,\n\
\                        GError       **error)\n\
 {\n\
\  g_return_val_if_fail (g_task_is_valid (result, self), NULL);\n\n\
\  return g_task_propagate_pointer (G_TASK (result), error);\n\
 }\n\
 ]}\n\n\
 {b Chained asynchronous operations}\n\n\
 [GTask] also tries to simplify asynchronous operations that\n\
 internally chain together several smaller asynchronous\n\
 operations. [Gio.Task.get_cancellable], [Gio.Task.get_context],\n\
 and [Gio.Task.get_priority] allow you to get back the task’s\n\
 [Gio.Cancellable], [GLib.MainContext], and\n\
 I/O priority\n\
 when starting a new subtask, so you don’t have to keep track\n\
 of them yourself. [Gio.Task.attach_source] simplifies the case\n\
 of waiting for a source to fire (automatically using the correct\n\
 [GLib.MainContext] and priority).\n\n\
 Here is an example for chained asynchronous operations:\n\n\
 {[\n\
 typedef struct {\n\
\  Cake *cake;\n\
\  CakeFrostingType frosting;\n\
\  char *message;\n\
 } BakingData;\n\n\
 static void\n\
 decoration_data_free (BakingData *bd)\n\
 {\n\
\  if (bd->cake)\n\
\    g_object_unref (bd->cake);\n\
\  g_free (bd->message);\n\
\  g_slice_free (BakingData, bd);\n\
 }\n\n\
 static void\n\
 decorated_cb (Cake         *cake,\n\
\              GAsyncResult *result,\n\
\              gpointer      user_data)\n\
 {\n\
\  GTask *task = user_data;\n\
\  GError *error = NULL;\n\n\
\  if (!cake_decorate_finish (cake, result, &error))\n\
\    {\n\
\      g_object_unref (cake);\n\
\      g_task_return_error (task, error);\n\
\      g_object_unref (task);\n\
\      return;\n\
\    }\n\n\
\  // baking_data_free() will drop its ref on the cake, so we have to\n\
\  // take another here to give to the caller.\n\
\  g_task_return_pointer (task, g_object_ref (cake), g_object_unref);\n\
\  g_object_unref (task);\n\
 }\n\n\
 static gboolean\n\
 decorator_ready (gpointer user_data)\n\
 {\n\
\  GTask *task = user_data;\n\
\  BakingData *bd = g_task_get_task_data (task);\n\n\
\  cake_decorate_async (bd->cake, bd->frosting, bd->message,\n\
\                       g_task_get_cancellable (task),\n\
\                       decorated_cb, task);\n\n\
\  return G_SOURCE_REMOVE;\n\
 }\n\n\
 static void\n\
 baked_cb (Cake     *cake,\n\
\          gpointer  user_data)\n\
 {\n\
\  GTask *task = user_data;\n\
\  BakingData *bd = g_task_get_task_data (task);\n\
\  GError *error = NULL;\n\n\
\  if (cake == NULL)\n\
\    {\n\
\      g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_NO_FLOUR,\n\
\                               \"Go to the supermarket\");\n\
\      g_object_unref (task);\n\
\      return;\n\
\    }\n\n\
\  bd->cake = cake;\n\n\
\  // Bail out now if the user has already cancelled\n\
\  if (g_task_return_error_if_cancelled (task))\n\
\    {\n\
\      g_object_unref (task);\n\
\      return;\n\
\    }\n\n\
\  if (cake_decorator_available (cake))\n\
\    decorator_ready (task);\n\
\  else\n\
\    {\n\
\      GSource *source;\n\n\
\      source = cake_decorator_wait_source_new (cake);\n\
\      // Attach @source to @task’s GMainContext and have it call\n\
\      // decorator_ready() when it is ready.\n\
\      g_task_attach_source (task, source, decorator_ready);\n\
\      g_source_unref (source);\n\
\    }\n\
 }\n\n\
 void\n\
 baker_bake_cake_async (Baker               *self,\n\
\                       guint                radius,\n\
\                       CakeFlavor           flavor,\n\
\                       CakeFrostingType     frosting,\n\
\                       const char          *message,\n\
\                       gint                 priority,\n\
\                       GCancellable        *cancellable,\n\
\                       GAsyncReadyCallback  callback,\n\
\                       gpointer             user_data)\n\
 {\n\
\  GTask *task;\n\
\  BakingData *bd;\n\n\
\  task = g_task_new (self, cancellable, callback, user_data);\n\
\  g_task_set_priority (task, priority);\n\n\
\  bd = g_slice_new0 (BakingData);\n\
\  bd->frosting = frosting;\n\
\  bd->message = g_strdup (message);\n\
\  g_task_set_task_data (task, bd, (GDestroyNotify) baking_data_free);\n\n\
\  _baker_begin_cake (self, radius, flavor, cancellable, baked_cb, task);\n\
 }\n\n\
 Cake *\n\
 baker_bake_cake_finish (Baker         *self,\n\
\                        GAsyncResult  *result,\n\
\                        GError       **error)\n\
 {\n\
\  g_return_val_if_fail (g_task_is_valid (result, self), NULL);\n\n\
\  return g_task_propagate_pointer (G_TASK (result), error);\n\
 }\n\
 ]}\n\n\
 {b Asynchronous operations from synchronous ones}\n\n\
 You can use [Gio.Task.run_in_thread] to turn a synchronous\n\
 operation into an asynchronous one, by running it in a thread.\n\
 When it completes, the result will be dispatched to the thread-default\n\
 main context (see [GLib.MainContext.push_thread_default])\n\
 where the [GTask] was created.\n\n\
 Running a task in a thread:\n\n\
 {[\n\
 typedef struct {\n\
\  guint radius;\n\
\  CakeFlavor flavor;\n\
\  CakeFrostingType frosting;\n\
\  char *message;\n\
 } CakeData;\n\n\
 static void\n\
 cake_data_free (CakeData *cake_data)\n\
 {\n\
\  g_free (cake_data->message);\n\
\  g_slice_free (CakeData, cake_data);\n\
 }\n\n\
 static void\n\
 bake_cake_thread (GTask         *task,\n\
\                  gpointer       source_object,\n\
\                  gpointer       task_data,\n\
\                  GCancellable  *cancellable)\n\
 {\n\
\  Baker *self = source_object;\n\
\  CakeData *cake_data = task_data;\n\
\  Cake *cake;\n\
\  GError *error = NULL;\n\n\
\  cake = bake_cake (baker, cake_data->radius, cake_data->flavor,\n\
\                    cake_data->frosting, cake_data->message,\n\
\                    cancellable, &error);\n\
\  if (cake)\n\
\    g_task_return_pointer (task, cake, g_object_unref);\n\
\  else\n\
\    g_task_return_error (task, error);\n\
 }\n\n\
 void\n\
 baker_bake_cake_async (Baker               *self,\n\
\                       guint                radius,\n\
\                       CakeFlavor           flavor,\n\
\                       CakeFrostingType     frosting,\n\
\                       const char          *message,\n\
\                       GCancellable        *cancellable,\n\
\                       GAsyncReadyCallback  callback,\n\
\                       gpointer             user_data)\n\
 {\n\
\  CakeData *cake_data;\n\
\  GTask *task;\n\n\
\  cake_data = g_slice_new (CakeData);\n\
\  cake_data->radius = radius;\n\
\  cake_data->flavor = flavor;\n\
\  cake_data->frosting = frosting;\n\
\  cake_data->message = g_strdup (message);\n\
\  task = g_task_new (self, cancellable, callback, user_data);\n\
\  g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);\n\
\  g_task_run_in_thread (task, bake_cake_thread);\n\
\  g_object_unref (task);\n\
 }\n\n\
 Cake *\n\
 baker_bake_cake_finish (Baker         *self,\n\
\                        GAsyncResult  *result,\n\
\                        GError       **error)\n\
 {\n\
\  g_return_val_if_fail (g_task_is_valid (result, self), NULL);\n\n\
\  return g_task_propagate_pointer (G_TASK (result), error);\n\
 }\n\
 ]}\n\n\
 {b Adding cancellability to uncancellable tasks}\n\n\
 Finally, [Gio.Task.run_in_thread] and\n\
 [Gio.Task.run_in_thread_sync] can be used to turn an uncancellable\n\
 operation into a cancellable one. If you call\n\
 [Gio.Task.set_return_on_cancel], passing [TRUE], then if the task’s\n\
 [Gio.Cancellable] is cancelled, it will return control back to the\n\
 caller immediately, while allowing the task thread to continue running in the\n\
 background (and simply discarding its result when it finally does finish).\n\
 Provided that the task thread is careful about how it uses\n\
 locks and other externally-visible resources, this allows you\n\
 to make ‘GLib-friendly’ asynchronous and cancellable\n\
 synchronous variants of blocking APIs.\n\n\
 Cancelling a task:\n\n\
 {[\n\
 static void\n\
 bake_cake_thread (GTask         *task,\n\
\                  gpointer       source_object,\n\
\                  gpointer       task_data,\n\
\                  GCancellable  *cancellable)\n\
 {\n\
\  Baker *self = source_object;\n\
\  CakeData *cake_data = task_data;\n\
\  Cake *cake;\n\
\  GError *error = NULL;\n\n\
\  cake = bake_cake (baker, cake_data->radius, cake_data->flavor,\n\
\                    cake_data->frosting, cake_data->message,\n\
\                    &error);\n\
\  if (error)\n\
\    {\n\
\      g_task_return_error (task, error);\n\
\      return;\n\
\    }\n\n\
\  // If the task has already been cancelled, then we don’t want to add\n\
\  // the cake to the cake cache. Likewise, we don’t  want to have the\n\
\  // task get cancelled in the middle of updating the cache.\n\
\  // g_task_set_return_on_cancel() will return %TRUE here if it managed\n\
\  // to disable return-on-cancel, or %FALSE if the task was cancelled\n\
\  // before it could.\n\
\  if (g_task_set_return_on_cancel (task, FALSE))\n\
\    {\n\
\      // If the caller cancels at this point, their\n\
\      // GAsyncReadyCallback won’t be invoked until we return,\n\
\      // so we don’t have to worry that this code will run at\n\
\      // the same time as that code does. But if there were\n\
\      // other functions that might look at the cake cache,\n\
\      // then we’d probably need a GMutex here as well.\n\
\      baker_add_cake_to_cache (baker, cake);\n\
\      g_task_return_pointer (task, cake, g_object_unref);\n\
\    }\n\
 }\n\n\
 void\n\
 baker_bake_cake_async (Baker               *self,\n\
\                       guint                radius,\n\
\                       CakeFlavor           flavor,\n\
\                       CakeFrostingType     frosting,\n\
\                       const char          *message,\n\
\                       GCancellable        *cancellable,\n\
\                       GAsyncReadyCallback  callback,\n\
\                       gpointer             user_data)\n\
 {\n\
\  CakeData *cake_data;\n\
\  GTask *task;\n\n\
\  cake_data = g_slice_new (CakeData);\n\n\
\  ...\n\n\
\  task = g_task_new (self, cancellable, callback, user_data);\n\
\  g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);\n\
\  g_task_set_return_on_cancel (task, TRUE);\n\
\  g_task_run_in_thread (task, bake_cake_thread);\n\
 }\n\n\
 Cake *\n\
 baker_bake_cake_sync (Baker               *self,\n\
\                      guint                radius,\n\
\                      CakeFlavor           flavor,\n\
\                      CakeFrostingType     frosting,\n\
\                      const char          *message,\n\
\                      GCancellable        *cancellable,\n\
\                      GError             **error)\n\
 {\n\
\  CakeData *cake_data;\n\
\  GTask *task;\n\
\  Cake *cake;\n\n\
\  cake_data = g_slice_new (CakeData);\n\n\
\  ...\n\n\
\  task = g_task_new (self, cancellable, NULL, NULL);\n\
\  g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);\n\
\  g_task_set_return_on_cancel (task, TRUE);\n\
\  g_task_run_in_thread_sync (task, bake_cake_thread);\n\n\
\  cake = g_task_propagate_pointer (task, error);\n\
\  g_object_unref (task);\n\
\  return cake;\n\
 }\n\
 ]}\n\n\
 {b Porting from [Gio.SimpleAsyncResult]}\n\n\
 [GTask]’s API attempts to be simpler than [Gio.SimpleAsyncResult]’s\n\
 in several ways:\n\n\
 - You can save task-specific data with [Gio.Task.set_task_data], and\n\
 retrieve it later with [Gio.Task.get_task_data]. This replaces the\n\
 abuse of [Gio.SimpleAsyncResult.set_op_res_gpointer] for the same\n\
 purpose with [Gio.SimpleAsyncResult].\n\
 - In addition to the task data, [GTask] also keeps track of the\n\
 priority, [Gio.Cancellable],\n\
 and [GLib.MainContext] associated with the task, so tasks that\n\
 consist of a chain of simpler asynchronous operations will have easy access\n\
 to those values when starting each sub-task.\n\
 - [Gio.Task.return_error_if_cancelled] provides simplified\n\
 handling for cancellation. In addition, cancellation\n\
 overrides any other [GTask] return value by default, like\n\
 [Gio.SimpleAsyncResult] does when\n\
 [Gio.SimpleAsyncResult.set_check_cancellable] is called.\n\
 (You can use [Gio.Task.set_check_cancellable] to turn off that\n\
 behavior.) On the other hand, [Gio.Task.run_in_thread]\n\
 guarantees that it will always run your\n\
 [task_func], even if the task’s [Gio.Cancellable]\n\
 is already cancelled before the task gets a chance to run;\n\
 you can start your [task_func] with a\n\
 [Gio.Task.return_error_if_cancelled] check if you need the\n\
 old behavior.\n\
 - The ‘return’ methods (eg, [Gio.Task.return_pointer])\n\
 automatically cause the task to be ‘completed’ as well, and\n\
 there is no need to worry about the ‘complete’ vs ‘complete in idle’\n\
 distinction. ([GTask] automatically figures out\n\
 whether the task’s callback can be invoked directly, or\n\
 if it needs to be sent to another [GLib.MainContext], or delayed\n\
 until the next iteration of the current [GLib.MainContext].)\n\
 - The ‘finish’ functions for [GTask] based operations are generally\n\
 much simpler than [Gio.SimpleAsyncResult] ones, normally consisting\n\
 of only a single call to [Gio.Task.propagate_pointer] or the like.\n\
 Since [Gio.Task.propagate_pointer] ‘steals’ the return value from\n\
 the [GTask], it is not necessary to juggle pointers around to\n\
 prevent it from being freed twice.\n\
 - With [Gio.SimpleAsyncResult], it was common to call\n\
 [Gio.SimpleAsyncResult.propagate_error] from the\n\
 [_finish()] wrapper function, and have\n\
 virtual method implementations only deal with successful\n\
 returns. This behavior is deprecated, because it makes it\n\
 difficult for a subclass to chain to a parent class’s async\n\
 methods. Instead, the wrapper function should just be a\n\
 simple wrapper, and the virtual method should call an\n\
 appropriate [g_task_propagate_] function.\n\
 Note that wrapper methods can now use\n\
 [Gio.AsyncResult.legacy_propagate_error] to do old-style\n\
 [Gio.SimpleAsyncResult] error-returning behavior, and\n\
 [Gio.AsyncResult.is_tagged] to check if a result is tagged as\n\
 having come from the [_async()] wrapper\n\
 function (for ‘short-circuit’ results, such as when passing\n\
 [0] to [Gio.InputStream.read_async]).\n\n\
 {b Thread-safety considerations}\n\n\
 Due to some infelicities in the API design, there is a\n\
 thread-safety concern that users of [GTask] have to be aware of:\n\n\
 If the [main] thread drops its last reference to the source object\n\
 or the task data before the task is finalized, then the finalizers\n\
 of these objects may be called on the worker thread.\n\n\
 This is a problem if the finalizers use non-threadsafe API, and\n\
 can lead to hard-to-debug crashes. Possible workarounds include:\n\n\
 - Clear task data in a signal handler for [notify::completed]\n\
 - Keep iterating a main context in the main thread and defer\n\
 dropping the reference to the source object to that main\n\
 context when the task is finalized\n\n\
 Its methods, signals and properties are on {!class-type-task_t}. The \
 functions it is built on are in {!Ocgio.Raw.Task}."]

(** The methods, signals and properties of a [GTask]. *)
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

class task : Raw.Task.t -> task_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Task.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GTask], give one already wrapped. *)
