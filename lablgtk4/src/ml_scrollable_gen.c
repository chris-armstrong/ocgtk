/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Scrollable */

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


CAMLexport CAMLprim value ml_gtk_scrollable_set_vscroll_policy(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scrollable_set_vscroll_policy(GtkWidget_val(self), GtkScrollablePolicy_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrollable_set_vadjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scrollable_set_vadjustment(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrollable_set_hscroll_policy(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scrollable_set_hscroll_policy(GtkWidget_val(self), GtkScrollablePolicy_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrollable_set_hadjustment(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_scrollable_set_hadjustment(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_vscroll_policy(value self)
{
CAMLparam1(self);


    GtkScrollablePolicy result = gtk_scrollable_get_vscroll_policy(GtkWidget_val(self));
CAMLreturn(Val_GtkScrollablePolicy(result));
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_vadjustment(value self)
{
CAMLparam1(self);


    GtkAdjustment* result = gtk_scrollable_get_vadjustment(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_hscroll_policy(value self)
{
CAMLparam1(self);


    GtkScrollablePolicy result = gtk_scrollable_get_hscroll_policy(GtkWidget_val(self));
CAMLreturn(Val_GtkScrollablePolicy(result));
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_hadjustment(value self)
{
CAMLparam1(self);


    GtkAdjustment* result = gtk_scrollable_get_hadjustment(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_scrollable_get_border(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_scrollable_get_border(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_bool(result));
}
