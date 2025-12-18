/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Fixed */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkFixed */
#ifndef Val_GtkFixed
#define GtkFixed_val(val) ((GtkFixed*)ext_of_val(val))
#define Val_GtkFixed(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFixed */


CAMLexport CAMLprim value ml_gtk_fixed_new(value unit)
{
CAMLparam1(unit);
GtkFixed *obj = gtk_fixed_new();
CAMLreturn(Val_GtkFixed(obj));
}

CAMLexport CAMLprim value ml_gtk_fixed_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_fixed_remove(GtkFixed_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_fixed_put(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_fixed_put(GtkFixed_val(self), GtkWidget_val(arg1), Double_val(arg2), Double_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_fixed_move(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_fixed_move(GtkFixed_val(self), GtkWidget_val(arg1), Double_val(arg2), Double_val(arg3));
CAMLreturn(Val_unit);
}
