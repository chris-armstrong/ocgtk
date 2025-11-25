/* GENERATED CODE - DO NOT EDIT */
/* C bindings for WindowHandle */

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

/* Type-specific conversion macros for GtkWindowHandle */
#ifndef Val_GtkWindowHandle
#define GtkWindowHandle_val(val) ((GtkWindowHandle*)ext_of_val(val))
#define Val_GtkWindowHandle(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkWindowHandle */


CAMLexport CAMLprim value ml_gtk_window_handle_new(value unit)
{
CAMLparam1(unit);
GtkWindowHandle *obj = gtk_window_handle_new();
CAMLreturn(Val_GtkWindowHandle(obj));
}

CAMLexport CAMLprim value ml_gtk_window_handle_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_handle_set_child(GtkWindowHandle_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_handle_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_window_handle_get_child(GtkWindowHandle_val(self));
CAMLreturn(Val_GtkWidget(result));
}
