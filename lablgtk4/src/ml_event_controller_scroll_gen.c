/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EventControllerScroll */

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


CAMLexport CAMLprim value ml_gtk_event_controller_scroll_new(value arg1)
{
CAMLparam1(arg1);
GtkEventController *controller = gtk_event_controller_scroll_new(GtkEventControllerScrollFlags_val(arg1));
CAMLreturn(Val_GtkEventController(controller));
}

CAMLexport CAMLprim value ml_gtk_event_controller_scroll_set_flags(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_event_controller_scroll_set_flags(GtkEventController_val(self), GtkEventControllerScrollFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_event_controller_scroll_get_unit(value self)
{
CAMLparam1(self);


    GdkScrollUnit result = gtk_event_controller_scroll_get_unit(GtkEventController_val(self));
CAMLreturn(Val_GdkScrollUnit(result));
}

CAMLexport CAMLprim value ml_gtk_event_controller_scroll_get_flags(value self)
{
CAMLparam1(self);


    GtkEventControllerScrollFlags result = gtk_event_controller_scroll_get_flags(GtkEventController_val(self));
CAMLreturn(Val_GtkEventControllerScrollFlags(result));
}
