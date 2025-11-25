/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerKey */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkEventControllerKey */
#ifndef Val_GtkEventControllerKey
#define GtkEventControllerKey_val(val) ((GtkEventControllerKey*)ext_of_val(val))
#define Val_GtkEventControllerKey(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEventControllerKey */


CAMLexport CAMLprim value ml_gtk_event_controller_key_new(value unit)
{
CAMLparam1(unit);
GtkEventControllerKey *obj = gtk_event_controller_key_new();
CAMLreturn(Val_GtkEventControllerKey(obj));
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_set_im_context(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_event_controller_key_set_im_context(GtkEventControllerKey_val(self), Option_val(arg1, GtkIMContext_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_get_im_context(value self)
{
CAMLparam1(self);

GtkIMContext* result = gtk_event_controller_key_get_im_context(GtkEventControllerKey_val(self));
CAMLreturn(Val_option(result, Val_GtkIMContext));
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_get_group(value self)
{
CAMLparam1(self);

guint result = gtk_event_controller_key_get_group(GtkEventControllerKey_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_forward(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_event_controller_key_forward(GtkEventControllerKey_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}
