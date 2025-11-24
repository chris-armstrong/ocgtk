/* GENERATED CODE - DO NOT EDIT */
/* C bindings for LayoutChild */

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


CAMLexport CAMLprim value ml_gtk_layout_child_get_layout_manager(value self)
{
CAMLparam1(self);


    GtkLayoutManager* result = gtk_layout_child_get_layout_manager(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_layout_child_get_child_widget(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_layout_child_get_child_widget(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
