/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextChildAnchor */

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


CAMLexport CAMLprim value ml_gtk_text_child_anchor_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_text_child_anchor_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_text_child_anchor_new_with_replacement(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_text_child_anchor_new_with_replacement(String_val(arg1));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_text_child_anchor_get_widgets(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_child_anchor_get_widgets(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_child_anchor_get_deleted(value self)
{
CAMLparam1(self);


    gboolean result = gtk_text_child_anchor_get_deleted(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}
