/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RemoteActionGroup */

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

#if GLIB_CHECK_VERSION(2,32,0)

CAMLexport CAMLprim value ml_gio_remote_action_group_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), G_TYPE_REMOTE_ACTION_GROUP)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%s' does not implement %s",
            G_OBJECT_TYPE_NAME(gobj), "GRemoteActionGroup");
        caml_failwith(msg);
    }
    CAMLreturn(Val_GRemoteActionGroup((GRemoteActionGroup*)gobj));
}

#else


#endif
