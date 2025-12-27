/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GraphicsOffload */

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


CAMLexport CAMLprim value ml_gtk_graphics_offload_new(value arg1)
{
CAMLparam1(arg1);
GtkGraphicsOffload *obj = gtk_graphics_offload_new(Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_GtkGraphicsOffload(obj));
}

CAMLexport CAMLprim value ml_gtk_graphics_offload_set_enabled(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_graphics_offload_set_enabled(GtkGraphicsOffload_val(self), GtkGraphicsOffloadEnabled_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_graphics_offload_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_graphics_offload_set_child(GtkGraphicsOffload_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_graphics_offload_get_enabled(value self)
{
CAMLparam1(self);

GtkGraphicsOffloadEnabled result = gtk_graphics_offload_get_enabled(GtkGraphicsOffload_val(self));
CAMLreturn(Val_GtkGraphicsOffloadEnabled(result));
}

CAMLexport CAMLprim value ml_gtk_graphics_offload_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_graphics_offload_get_child(GtkGraphicsOffload_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}
