(* GENERATED CODE - DO NOT EDIT *)
(* AsyncInitable: AsyncInitable *)

type t = [ `async_initable ] Gobject.obj
(** [GAsyncInitable] is an interface for asynchronously initializable objects.

    This is the asynchronous version of [Gio.Initable]; it behaves the same in
    all ways except that initialization is asynchronous. For more details see
    the descriptions on [GInitable].

    A class may implement both the [GInitable] and [GAsyncInitable] interfaces.

    Users of objects implementing this are not intended to use the interface
    method directly; instead it will be used automatically in various ways. For
    C applications you generally just call [Gio.AsyncInitable.new_async]
    directly, or indirectly via a foo_thing_new_async() wrapper. This will call
    [Gio.AsyncInitable.init_async] under the covers, calling back with [NULL]
    and a set [GError] on failure.

    A typical implementation might look something like this:

    {[
    enum {
       NOT_INITIALIZED,
       INITIALIZING,
       INITIALIZED
    };

    static void
    _foo_ready_cb (Foo *self)
    {
      GList *l;

      self->priv->state = INITIALIZED;

      for (l = self->priv->init_results; l != NULL; l = l->next)
        {
          GTask *task = l->data;

          if (self->priv->success)
            g_task_return_boolean (task, TRUE);
          else
            g_task_return_new_error (task, ...);
          g_object_unref (task);
        }

      g_list_free (self->priv->init_results);
      self->priv->init_results = NULL;
    }

    static void
    foo_init_async (GAsyncInitable       *initable,
                    int                   io_priority,
                    GCancellable         *cancellable,
                    GAsyncReadyCallback   callback,
                    gpointer              user_data)
    {
      Foo *self = FOO (initable);
      GTask *task;

      task = g_task_new (initable, cancellable, callback, user_data);
      g_task_set_name (task, G_STRFUNC);

      switch (self->priv->state)
        {
          case NOT_INITIALIZED:
            _foo_get_ready (self);
            self->priv->init_results = g_list_append (self->priv->init_results,
                                                      task);
            self->priv->state = INITIALIZING;
            break;
          case INITIALIZING:
            self->priv->init_results = g_list_append (self->priv->init_results,
                                                      task);
            break;
          case INITIALIZED:
            if (!self->priv->success)
              g_task_return_new_error (task, ...);
            else
              g_task_return_boolean (task, TRUE);
            g_object_unref (task);
            break;
        }
    }

    static gboolean
    foo_init_finish (GAsyncInitable       *initable,
                     GAsyncResult         *result,
                     GError              **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, initable), FALSE);

      return g_task_propagate_boolean (G_TASK (result), error);
    }

    static void
    foo_async_initable_iface_init (gpointer g_iface,
                                   gpointer data)
    {
      GAsyncInitableIface *iface = g_iface;

      iface->init_async = foo_init_async;
      iface->init_finish = foo_init_finish;
    }
    ]} *)

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_async_initable_from_gobject"

(* Methods *)

external new_finish :
  t -> Async_result.t -> ([ `object_ ] Gobject.obj, GError.t) result
  = "ml_g_async_initable_new_finish"
(** Finishes the async construction for the various g_async_initable_new calls,
    returning the created object or [NULL] on error. *)

external init_finish : t -> Async_result.t -> (bool, GError.t) result
  = "ml_g_async_initable_init_finish"
(** Finishes asynchronous initialization and returns the result. See
    g_async_initable_init_async(). *)
