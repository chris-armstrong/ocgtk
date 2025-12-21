/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IOStream */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GIOStream */
#ifndef Val_GIOStream
#define GIOStream_val(val) ((GIOStream*)ext_of_val(val))
#define Val_GIOStream(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GIOStream */


CAMLexport CAMLprim value ml_g_io_stream_set_pending(value self)
{
CAMLparam1(self);
GError *error = NULL;

gboolean result = g_io_stream_set_pending(GIOStream_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_io_stream_is_closed(value self)
{
CAMLparam1(self);

gboolean result = g_io_stream_is_closed(GIOStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_io_stream_has_pending(value self)
{
CAMLparam1(self);

gboolean result = g_io_stream_has_pending(GIOStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_io_stream_get_output_stream(value self)
{
CAMLparam1(self);

GOutputStream* result = g_io_stream_get_output_stream(GIOStream_val(self));
CAMLreturn(Val_GOutputStream(result));
}

CAMLexport CAMLprim value ml_g_io_stream_get_input_stream(value self)
{
CAMLparam1(self);

GInputStream* result = g_io_stream_get_input_stream(GIOStream_val(self));
CAMLreturn(Val_GInputStream(result));
}

CAMLexport CAMLprim value ml_g_io_stream_close(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = g_io_stream_close(GIOStream_val(self), Option_val(arg1, GCancellable_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_g_io_stream_clear_pending(value self)
{
CAMLparam1(self);

g_io_stream_clear_pending(GIOStream_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_io_stream_get_closed(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GIOStream *obj = (GIOStream *)GIOStream_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "closed");
if (pspec == NULL) caml_failwith("ml_gtk_io_stream_get_closed: property 'closed' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "closed", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
