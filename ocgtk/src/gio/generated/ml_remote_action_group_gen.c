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


CAMLexport CAMLprim value ml_g_remote_action_group_change_action_state_full(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

g_remote_action_group_change_action_state_full(GRemoteActionGroup_val(self), String_val(arg1), GVariant_val(arg2), GVariant_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_remote_action_group_activate_action_full(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

g_remote_action_group_activate_action_full(GRemoteActionGroup_val(self), String_val(arg1), Option_val(arg2, GVariant_val, NULL), GVariant_val(arg3));
CAMLreturn(Val_unit);
}

#else


CAMLexport CAMLprim value ml_g_remote_action_group_activate_action_full(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
(void)self;
(void)arg1;
(void)arg2;
(void)arg3;
caml_failwith("RemoteActionGroup requires GLib >= 2.32");
return Val_unit;
}


CAMLexport CAMLprim value ml_g_remote_action_group_change_action_state_full(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
(void)self;
(void)arg1;
(void)arg2;
(void)arg3;
caml_failwith("RemoteActionGroup requires GLib >= 2.32");
return Val_unit;
}


#endif
