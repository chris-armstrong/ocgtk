/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DesktopAppInfoLookup */

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


CAMLexport CAMLprim value ml_g_desktop_app_info_lookup_get_default_for_uri_scheme(value self, value arg1)
{
CAMLparam2(self, arg1);

GAppInfo* result = g_desktop_app_info_lookup_get_default_for_uri_scheme(GDesktopAppInfoLookup_val(self), String_val(arg1));
CAMLreturn(Val_option(result, Val_GAppInfo));
}
CAMLexport CAMLprim value ml_gio_desktop_app_info_lookup_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_ext_of_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), G_TYPE_DESKTOP_APP_INFO_LOOKUP)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%s' does not implement %s",
            G_OBJECT_TYPE_NAME(gobj), "GDesktopAppInfoLookup");
        caml_failwith(msg);
    }
    g_object_ref(gobj);
    CAMLreturn(Val_GDesktopAppInfoLookup((GDesktopAppInfoLookup*)gobj));
}
