/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DatagramBased */

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

#if GLIB_CHECK_VERSION(2,48,0)

CAMLexport CAMLprim value ml_gio_datagram_based_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_ext_of_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), G_TYPE_DATAGRAM_BASED)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%s' does not implement %s",
            G_OBJECT_TYPE_NAME(gobj), "GDatagramBased");
        caml_failwith(msg);
    }
    g_object_ref(gobj);
    CAMLreturn(Val_GDatagramBased((GDatagramBased*)gobj));
}

#else

CAMLexport CAMLprim value ml_gio_datagram_based_from_gobject(value obj)
{
    CAMLparam1(obj);
    (void)obj;
    caml_failwith("DatagramBased requires GTK >= 2.48");
    return Val_unit;
}


#endif
