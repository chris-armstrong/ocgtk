/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleText */

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


CAMLexport CAMLprim value ml_gtk_accessible_text_update_selection_bound(value self)
{
CAMLparam1(self);


    gtk_accessible_text_update_selection_bound(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_text_update_contents(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_accessible_text_update_contents(GtkWidget_val(self), GtkAccessibleTextContentChange_val(arg1), arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_text_update_caret_position(value self)
{
CAMLparam1(self);


    gtk_accessible_text_update_caret_position(GtkWidget_val(self));
CAMLreturn(Val_unit);
}
