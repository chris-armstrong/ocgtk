/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreeIter */

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
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"

/* Copy function for GtkTreeIter (value-like record with copy method) */
value copy_GtkTreeIter(const GtkTreeIter *ptr)
{
  if (ptr == NULL) return Val_none;
  GtkTreeIter *copy = g_boxed_copy(gtk_tree_iter_get_type(), ptr);
  return ml_gir_record_val_ptr_with_type(gtk_tree_iter_get_type(), copy);
}

\
CAMLexport CAMLprim value ml_gtk_tree_iter_get_stamp(value self)
{
    CAMLparam1(self);
    GtkTreeIter *rec = GtkTreeIter_val(self);
    CAMLreturn(Val_int(rec->stamp));
}

\
CAMLexport CAMLprim value ml_gtk_tree_iter_set_stamp(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkTreeIter *rec = GtkTreeIter_val(self);
    rec->stamp = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_tree_iter_make(value v_stamp)
{
    CAMLparam1(v_stamp);
    GtkTreeIter *obj = g_new0(GtkTreeIter, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->stamp = Int_val(v_stamp);
    CAMLreturn(Val_GtkTreeIter(obj));
}


CAMLprim value ml_gtk_tree_iter_get_type(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_long(gtk_tree_iter_get_type()));
}
