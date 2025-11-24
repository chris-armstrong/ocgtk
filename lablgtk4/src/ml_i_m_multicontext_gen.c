/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IMMulticontext */

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


CAMLexport CAMLprim value ml_gtk_im_multicontext_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_im_multicontext_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_im_multicontext_set_context_id(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_im_multicontext_set_context_id(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_multicontext_get_context_id(value self)
{
CAMLparam1(self);


    const char* result = gtk_im_multicontext_get_context_id(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}
