/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Notification */

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

/* Type-specific conversion macros for GNotification */
#ifndef Val_GNotification
#define GNotification_val(val) ((GNotification*)ext_of_val(val))
#define Val_GNotification(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GNotification */


CAMLexport CAMLprim value ml_g_notification_new(value arg1)
{
CAMLparam1(arg1);
GNotification *obj = g_notification_new(String_val(arg1));
CAMLreturn(Val_GNotification(obj));
}

CAMLexport CAMLprim value ml_g_notification_set_urgent(value self, value arg1)
{
CAMLparam2(self, arg1);

g_notification_set_urgent(GNotification_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_notification_set_title(value self, value arg1)
{
CAMLparam2(self, arg1);

g_notification_set_title(GNotification_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_notification_set_priority(value self, value arg1)
{
CAMLparam2(self, arg1);

g_notification_set_priority(GNotification_val(self), GioNotificationPriority_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_notification_set_default_action(value self, value arg1)
{
CAMLparam2(self, arg1);

g_notification_set_default_action(GNotification_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_notification_set_category(value self, value arg1)
{
CAMLparam2(self, arg1);

g_notification_set_category(GNotification_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_notification_set_body(value self, value arg1)
{
CAMLparam2(self, arg1);

g_notification_set_body(GNotification_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_notification_add_button(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

g_notification_add_button(GNotification_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}
