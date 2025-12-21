/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeRowReference */

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

/* Type-specific conversion macros for GtkTreeRowReference */
#ifndef Val_GtkTreeRowReference
#define GtkTreeRowReference_val(val) ((GtkTreeRowReference*)ext_of_val(val))
#define Val_GtkTreeRowReference(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkTreeRowReference */


CAMLexport CAMLprim value ml_gtk_tree_row_reference_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkTreeRowReference *obj = gtk_tree_row_reference_new(arg1, GtkTreePath_val(arg2));
CAMLreturn(Val_GtkTreeRowReference(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_row_reference_new_proxy(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkTreeRowReference *obj = gtk_tree_row_reference_new_proxy(arg1, arg2, GtkTreePath_val(arg3));
CAMLreturn(Val_GtkTreeRowReference(obj));
}

CAMLexport CAMLprim value ml_gtk_tree_row_reference_valid(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_row_reference_valid(GtkTreeRowReference_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_row_reference_get_path(value self)
{
CAMLparam1(self);

GtkTreePath* result = gtk_tree_row_reference_get_path(GtkTreeRowReference_val(self));
CAMLreturn(Val_option(result, Val_GtkTreePath));
}

CAMLexport CAMLprim value ml_gtk_tree_row_reference_free(value self)
{
CAMLparam1(self);

gtk_tree_row_reference_free(GtkTreeRowReference_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_row_reference_copy(value self)
{
CAMLparam1(self);

GtkTreeRowReference* result = gtk_tree_row_reference_copy(GtkTreeRowReference_val(self));
CAMLreturn(Val_GtkTreeRowReference(result));
}
