/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerKey */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_event_controller_key_new(value unit)
{
CAMLparam1(unit);
GtkEventController *controller = gtk_event_controller_key_new();
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_set_im_context(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_event_controller_key_set_im_context(GtkEventController_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_get_im_context(value self)
{
CAMLparam1(self);


    GtkIMContext* result = gtk_event_controller_key_get_im_context(GtkEventController_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_get_group(value self)
{
CAMLparam1(self);


    guint result = gtk_event_controller_key_get_group(GtkEventController_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_key_forward(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_event_controller_key_forward(GtkEventController_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}
