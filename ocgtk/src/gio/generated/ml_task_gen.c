/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Task */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gio.h>
#ifdef __linux__
#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
#endif /* __linux__ */
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"


#if GLIB_CHECK_VERSION(2,76,0)

CAMLexport CAMLprim value ml_g_task_set_static_name(value self, value arg1)
{
CAMLparam2(self, arg1);

g_task_set_static_name(GTask_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_task_set_static_name(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("Task requires GLib >= 2.76");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_set_return_on_cancel(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = g_task_set_return_on_cancel(GTask_val(self), Bool_val(arg1));
CAMLreturn(Val_bool(result));
}

#else

CAMLexport CAMLprim value ml_g_task_set_return_on_cancel(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_set_priority(value self, value arg1)
{
CAMLparam2(self, arg1);

g_task_set_priority(GTask_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_task_set_priority(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,60,0)

CAMLexport CAMLprim value ml_g_task_set_name(value self, value arg1)
{
CAMLparam2(self, arg1);

g_task_set_name(GTask_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_task_set_name(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("Task requires GLib >= 2.60");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_set_check_cancellable(value self, value arg1)
{
CAMLparam2(self, arg1);

g_task_set_check_cancellable(GTask_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_task_set_check_cancellable(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_return_int(value self, value arg1)
{
CAMLparam2(self, arg1);

g_task_return_int(GTask_val(self), Long_val(arg1));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_task_return_int(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_return_error_if_cancelled(value self)
{
CAMLparam1(self);

gboolean result = g_task_return_error_if_cancelled(GTask_val(self));
CAMLreturn(Val_bool(result));
}

#else

CAMLexport CAMLprim value ml_g_task_return_error_if_cancelled(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_return_boolean(value self, value arg1)
{
CAMLparam2(self, arg1);

g_task_return_boolean(GTask_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_task_return_boolean(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_propagate_int(value self)
{
CAMLparam1(self);
GError *error = NULL;

gssize result = g_task_propagate_int(GTask_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_long(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

#else

CAMLexport CAMLprim value ml_g_task_propagate_int(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_propagate_boolean(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = g_task_propagate_boolean(GTask_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

#else

CAMLexport CAMLprim value ml_g_task_propagate_boolean(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_had_error(value self)
{
CAMLparam1(self);

gboolean result = g_task_had_error(GTask_val(self));
CAMLreturn(Val_bool(result));
}

#else

CAMLexport CAMLprim value ml_g_task_had_error(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_get_source_object(value self)
{
CAMLparam1(self);

gpointer result = g_task_get_source_object(GTask_val(self));
CAMLreturn(ml_gobject_val_of_ext(result));
}

#else

CAMLexport CAMLprim value ml_g_task_get_source_object(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_get_return_on_cancel(value self)
{
CAMLparam1(self);

gboolean result = g_task_get_return_on_cancel(GTask_val(self));
CAMLreturn(Val_bool(result));
}

#else

CAMLexport CAMLprim value ml_g_task_get_return_on_cancel(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_get_priority(value self)
{
CAMLparam1(self);

gint result = g_task_get_priority(GTask_val(self));
CAMLreturn(Val_int(result));
}

#else

CAMLexport CAMLprim value ml_g_task_get_priority(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,60,0)

CAMLexport CAMLprim value ml_g_task_get_name(value self)
{
CAMLparam1(self);

const gchar* result = g_task_get_name(GTask_val(self));
CAMLreturn(Val_option_string(result));
}

#else

CAMLexport CAMLprim value ml_g_task_get_name(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.60");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,44,0)

CAMLexport CAMLprim value ml_g_task_get_completed(value self)
{
CAMLparam1(self);

gboolean result = g_task_get_completed(GTask_val(self));
CAMLreturn(Val_bool(result));
}

#else

CAMLexport CAMLprim value ml_g_task_get_completed(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.44");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_get_check_cancellable(value self)
{
CAMLparam1(self);

gboolean result = g_task_get_check_cancellable(GTask_val(self));
CAMLreturn(Val_bool(result));
}

#else

CAMLexport CAMLprim value ml_g_task_get_check_cancellable(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,36,0)

CAMLexport CAMLprim value ml_g_task_get_cancellable(value self)
{
CAMLparam1(self);

GCancellable* result = g_task_get_cancellable(GTask_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GCancellable));
}

#else

CAMLexport CAMLprim value ml_g_task_get_cancellable(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Task requires GLib >= 2.36");
return Val_unit;
}
#endif
