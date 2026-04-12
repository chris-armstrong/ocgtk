/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Action */

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

CAMLexport CAMLprim value ml_g_action_get_name(value self)
{
CAMLparam1(self);

const gchar* result = g_action_get_name(GAction_val(self));
CAMLreturn(caml_copy_string(result));
}

#else

CAMLexport CAMLprim value ml_g_action_get_name(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Action requires GLib >= 2.28");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,28,0)

CAMLexport CAMLprim value ml_g_action_get_enabled(value self)
{
CAMLparam1(self);

gboolean result = g_action_get_enabled(GAction_val(self));
CAMLreturn(Val_bool(result));
}

#else

CAMLexport CAMLprim value ml_g_action_get_enabled(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("Action requires GLib >= 2.28");
return Val_unit;
}
#endif
CAMLexport CAMLprim value ml_gio_action_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_ext_of_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), G_TYPE_ACTION)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%s' does not implement %s",
            G_OBJECT_TYPE_NAME(gobj), "GAction");
        caml_failwith(msg);
    }
    g_object_ref(gobj);
    CAMLreturn(Val_GAction((GAction*)gobj));
}
