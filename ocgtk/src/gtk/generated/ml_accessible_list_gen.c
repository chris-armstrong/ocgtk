/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleList */

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


CAMLexport CAMLprim value ml_gtk_accessible_list_new_from_array(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkAccessibleList *obj = gtk_accessible_list_new_from_array(arg1, arg2);
CAMLreturn(Val_GtkAccessibleList(obj));
}

CAMLexport CAMLprim value ml_gtk_accessible_list_new_from_list(value arg1)
{
CAMLparam1(arg1);
GtkAccessibleList *obj = gtk_accessible_list_new_from_list(arg1);
CAMLreturn(Val_GtkAccessibleList(obj));
}
