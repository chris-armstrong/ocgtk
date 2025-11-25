/* GENERATED CODE - DO NOT EDIT */
/* C bindings for WidgetPaintable */

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

/* Type-specific conversion macros for GtkWidgetPaintable */
#ifndef Val_GtkWidgetPaintable
#define GtkWidgetPaintable_val(val) ((GtkWidgetPaintable*)ext_of_val(val))
#define Val_GtkWidgetPaintable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkWidgetPaintable */


CAMLexport CAMLprim value ml_gtk_widget_paintable_new(value arg1)
{
CAMLparam1(arg1);
GtkWidgetPaintable *obj = gtk_widget_paintable_new(GtkWidget_option_val(arg1));
CAMLreturn(Val_GtkWidgetPaintable(obj));
}

CAMLexport CAMLprim value ml_gtk_widget_paintable_set_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_widget_paintable_set_widget(GtkWidgetPaintable_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_widget_paintable_get_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_widget_paintable_get_widget(GtkWidgetPaintable_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}
