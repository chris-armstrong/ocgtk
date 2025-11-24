/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ConstraintLayout */

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


CAMLexport CAMLprim value ml_gtk_constraint_layout_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_constraint_layout_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_constraint_layout_remove_guide(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_constraint_layout_remove_guide(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_layout_remove_constraint(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_constraint_layout_remove_constraint(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_layout_remove_all_constraints(value self)
{
CAMLparam1(self);


    gtk_constraint_layout_remove_all_constraints(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_layout_add_guide(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_constraint_layout_add_guide(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_layout_add_constraint(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_constraint_layout_add_constraint(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
