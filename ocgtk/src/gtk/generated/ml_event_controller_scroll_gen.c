/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerScroll */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_event_controller_scroll_new(value arg1)
{
CAMLparam1(arg1);
GtkEventControllerScroll *obj = gtk_event_controller_scroll_new(GtkEventControllerScrollFlags_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkEventControllerScroll(obj));
}

CAMLexport CAMLprim value ml_gtk_event_controller_scroll_set_flags(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_event_controller_scroll_set_flags(GtkEventControllerScroll_val(self), GtkEventControllerScrollFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_scroll_get_flags(value self)
{
CAMLparam1(self);

GtkEventControllerScrollFlags result = gtk_event_controller_scroll_get_flags(GtkEventControllerScroll_val(self));
CAMLreturn(Val_GtkEventControllerScrollFlags(result));
}
