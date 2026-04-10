/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PollableInputStream */

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
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"

#if GLIB_CHECK_VERSION(2,28,0)


CAMLexport CAMLprim value ml_g_pollable_input_stream_is_readable(value self)
{
CAMLparam1(self);

gboolean result = g_pollable_input_stream_is_readable(GPollableInputStream_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_pollable_input_stream_can_poll(value self)
{
CAMLparam1(self);

gboolean result = g_pollable_input_stream_can_poll(GPollableInputStream_val(self));
CAMLreturn(Val_bool(result));
}
CAMLexport CAMLprim value ml_gio_pollable_input_stream_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_ext_of_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), G_TYPE_POLLABLE_INPUT_STREAM)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%s' does not implement %s",
            G_OBJECT_TYPE_NAME(gobj), "GPollableInputStream");
        caml_failwith(msg);
    }
    g_object_ref(gobj);
    CAMLreturn(Val_GPollableInputStream((GPollableInputStream*)gobj));
}

#else


CAMLexport CAMLprim value ml_g_pollable_input_stream_can_poll(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("PollableInputStream requires GLib >= 2.28");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_pollable_input_stream_is_readable(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("PollableInputStream requires GLib >= 2.28");
return Val_unit;
}

CAMLexport CAMLprim value ml_gio_pollable_input_stream_from_gobject(value obj)
{
    CAMLparam1(obj);
    (void)obj;
    caml_failwith("PollableInputStream requires GTK >= 2.28");
    return Val_unit;
}


#endif
