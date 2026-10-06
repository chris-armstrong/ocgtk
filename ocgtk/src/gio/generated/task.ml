(* GENERATED CODE - DO NOT EDIT *)
(* Task: Task *)

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
 context when the task is finalized"]

type t = [ `task | `object_ ] Gobject.obj

(* Methods *)

external set_static_name : t -> string option -> unit
  = "ml_g_task_set_static_name"
(** Sets [task]’s name, used in debugging and profiling.

    This is a variant of g_task_set_name() that avoids copying [name].

    This function is called automatically by [Gio.Task.set_source_tag] unless a
    name is set. *)

external set_return_on_cancel : t -> bool -> bool
  = "ml_g_task_set_return_on_cancel"
(** Sets or clears [task]'s return-on-cancel flag. This is only meaningful for
    tasks run via g_task_run_in_thread() or g_task_run_in_thread_sync().

    If [return_on_cancel] is [TRUE], then cancelling [task]'s [GCancellable]
    will immediately cause it to return, as though the task's [GTaskThreadFunc]
    had called g_task_return_error_if_cancelled() and then returned.

    This allows you to create a cancellable wrapper around an uninterruptible
    function. The [GTaskThreadFunc] just needs to be careful that it does not
    modify any externally-visible state after it has been cancelled. To do that,
    the thread should call g_task_set_return_on_cancel() again to (atomically)
    set return-on-cancel [FALSE] before making externally-visible changes; if
    the task gets cancelled before the return-on-cancel flag could be changed,
    g_task_set_return_on_cancel() will indicate this by returning [FALSE].

    You can disable and re-enable this flag multiple times if you wish. If the
    task's [GCancellable] is cancelled while return-on-cancel is [FALSE], then
    calling g_task_set_return_on_cancel() to set it [TRUE] again will cause the
    task to be cancelled at that point.

    If the task's [GCancellable] is already cancelled before you call
    g_task_run_in_thread()/g_task_run_in_thread_sync(), then the
    [GTaskThreadFunc] will still be run (for consistency), but the task will
    also be completed right away. *)

external set_priority : t -> int -> unit = "ml_g_task_set_priority"
(** Sets [task]'s priority. If you do not call this, it will default to
    [G_PRIORITY_DEFAULT].

    This will affect the priority of [GSources] created with
    g_task_attach_source() and the scheduling of tasks run in threads, and can
    also be explicitly retrieved later via g_task_get_priority(). *)

external set_name : t -> string option -> unit = "ml_g_task_set_name"
(** Sets [task]’s name, used in debugging and profiling. The name defaults to
    [NULL].

    The task name should describe in a human readable way what the task does.
    For example, ‘Open file’ or ‘Connect to network host’. It is used to set the
    name of the [GSource] used for idle completion of the task.

    This function may only be called before the [task] is first used in a thread
    other than the one it was constructed in. *)

external set_check_cancellable : t -> bool -> unit
  = "ml_g_task_set_check_cancellable"
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

external return_value : t -> Gobject.Value.t option -> unit
  = "ml_g_task_return_value"
(** Sets [task]'s result to [result] (by copying it) and completes the task.

    If [result] is [NULL] then a [GValue] of type [G_TYPE_POINTER] with a value
    of [NULL] will be used for the result.

    This is a very generic low-level method intended primarily for use by
    language bindings; for C code, g_task_return_pointer() and the like will
    normally be much easier to use. *)

external return_int : t -> int -> unit = "ml_g_task_return_int"
(** Sets [task]'s result to [result] and completes the task (see
    g_task_return_pointer() for more discussion of exactly what this means). *)

external return_error_if_cancelled : t -> bool
  = "ml_g_task_return_error_if_cancelled"
(** Checks if [task]'s [GCancellable] has been cancelled, and if so, sets
    [task]'s error accordingly and completes the task (see
    g_task_return_pointer() for more discussion of exactly what this means). *)

external return_error : t -> GError.t -> unit = "ml_g_task_return_error"
(** Sets [task]'s result to [error] (which [task] assumes ownership of) and
    completes the task (see g_task_return_pointer() for more discussion of
    exactly what this means).

    Note that since the task takes ownership of [error], and since the task may
    be completed before returning from g_task_return_error(), you cannot assume
    that [error] is still valid after calling this. Call g_error_copy() on the
    error if you need to keep a local copy as well.

    See also [Gio.Task.return_new_error], [Gio.Task.return_new_error_literal].
*)

external return_boolean : t -> bool -> unit = "ml_g_task_return_boolean"
(** Sets [task]'s result to [result] and completes the task (see
    g_task_return_pointer() for more discussion of exactly what this means). *)

external propagate_value : t -> (bool * Gobject.Value.t, GError.t) result
  = "ml_g_task_propagate_value"
(** Gets the result of [task] as a [GValue], and transfers ownership of that
    value to the caller. As with g_task_return_value(), this is a generic
    low-level method; g_task_propagate_pointer() and the like will usually be
    more useful for C code.

    If the task resulted in an error, or was cancelled, then this will instead
    set [error] and return [FALSE].

    Since this method transfers ownership of the return value (or error) to the
    caller, you may only call it once. *)

external propagate_int : t -> (int, GError.t) result = "ml_g_task_propagate_int"
(** Gets the result of [task] as an integer (#gssize).

    If the task resulted in an error, or was cancelled, then this will instead
    return -1 and set [error].

    Since this method transfers ownership of the return value (or error) to the
    caller, you may only call it once. *)

external propagate_boolean : t -> (bool, GError.t) result
  = "ml_g_task_propagate_boolean"
(** Gets the result of [task] as a #gboolean.

    If the task resulted in an error, or was cancelled, then this will instead
    return [FALSE] and set [error].

    Since this method transfers ownership of the return value (or error) to the
    caller, you may only call it once. *)

external had_error : t -> bool = "ml_g_task_had_error"
(** Tests if [task] resulted in an error. *)

external get_source_object : t -> [ `object_ ] Gobject.obj option
  = "ml_g_task_get_source_object"
(** Gets the source object from [task]. Like g_async_result_get_source_object(),
    but does not ref the object. *)

external get_return_on_cancel : t -> bool = "ml_g_task_get_return_on_cancel"
(** Gets [task]'s return-on-cancel flag. See g_task_set_return_on_cancel() for
    more details. *)

external get_priority : t -> int = "ml_g_task_get_priority"
(** Gets [task]'s priority *)

external get_name : t -> string option = "ml_g_task_get_name"
(** Gets [task]’s name. See g_task_set_name(). *)

external get_completed : t -> bool = "ml_g_task_get_completed"
(** Gets the value of [GTask:completed]. This changes from [FALSE] to [TRUE]
    after the task’s callback is invoked, and will return [FALSE] if called from
    inside the callback. *)

external get_check_cancellable : t -> bool = "ml_g_task_get_check_cancellable"
(** Gets [task]'s check-cancellable flag. See g_task_set_check_cancellable() for
    more details. *)

external get_cancellable : t -> Cancellable.t option
  = "ml_g_task_get_cancellable"
(** Gets [task]'s [GCancellable] *)

(* Properties *)
