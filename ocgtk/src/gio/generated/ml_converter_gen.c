/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Converter */

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

#if GLIB_CHECK_VERSION(2,24,0)


CAMLexport CAMLprim value ml_g_converter_reset(value self)
{
CAMLparam1(self);

g_converter_reset(GConverter_val(self));
CAMLreturn(Val_unit);
}
CAMLexport CAMLprim value ml_gio_converter_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), G_TYPE_CONVERTER)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%s' does not implement %s",
            G_OBJECT_TYPE_NAME(gobj), "GConverter");
        caml_failwith(msg);
    }
    CAMLreturn(Val_GConverter((GConverter*)gobj));
}

#else


CAMLexport CAMLprim value ml_g_converter_reset(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Converter requires GLib >= 2.24");
return Val_unit;
}


#endif
