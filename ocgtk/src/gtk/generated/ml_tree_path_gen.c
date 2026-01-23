/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TreePath */

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

/* Conversion functions for GtkTreePath (opaque record with hidden fields) */
GtkTreePath *GtkTreePath_val(value v) {
  return *(GtkTreePath **)Data_custom_val(v);
}

value Val_GtkTreePath(const GtkTreePath *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkTreePath_option(const GtkTreePath *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkTreePath(ptr));
}


CAMLexport CAMLprim value ml_gtk_tree_path_new(value unit)
{
CAMLparam1(unit);

GtkTreePath *obj = gtk_tree_path_new();

CAMLreturn(Val_GtkTreePath(obj));
}
CAMLexport CAMLprim value ml_gtk_tree_path_new_first(value unit)
{
CAMLparam1(unit);

GtkTreePath *obj = gtk_tree_path_new_first();

CAMLreturn(Val_GtkTreePath(obj));
}
CAMLexport CAMLprim value ml_gtk_tree_path_new_from_string(value arg1)
{
CAMLparam1(arg1);

GtkTreePath *obj = gtk_tree_path_new_from_string(String_val(arg1));

CAMLreturn(Val_GtkTreePath(obj));
}
CAMLexport CAMLprim value ml_gtk_tree_path_up(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_path_up(GtkTreePath_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_to_string(value self)
{
CAMLparam1(self);

char* result = gtk_tree_path_to_string(GtkTreePath_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_prev(value self)
{
CAMLparam1(self);

gboolean result = gtk_tree_path_prev(GtkTreePath_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_prepend_index(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_path_prepend_index(GtkTreePath_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_path_next(value self)
{
CAMLparam1(self);

gtk_tree_path_next(GtkTreePath_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_path_is_descendant(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_path_is_descendant(GtkTreePath_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_is_ancestor(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_tree_path_is_ancestor(GtkTreePath_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_get_indices_with_depth(value self)
{
CAMLparam1(self);
int out1;

int* result = gtk_tree_path_get_indices_with_depth(GtkTreePath_val(self), &out1);
    int result_length = out1;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, Val_int(result[i]));
    }
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, ml_result);
    Store_field(ret, 1, Val_int(out1));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_tree_path_get_indices(value self)
{
CAMLparam1(self);

int* result = gtk_tree_path_get_indices(GtkTreePath_val(self));
CAMLreturn(Val_option(result, Val_int));
}

CAMLexport CAMLprim value ml_gtk_tree_path_get_depth(value self)
{
CAMLparam1(self);

int result = gtk_tree_path_get_depth(GtkTreePath_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_free(value self)
{
CAMLparam1(self);

gtk_tree_path_free(GtkTreePath_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_path_down(value self)
{
CAMLparam1(self);

gtk_tree_path_down(GtkTreePath_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tree_path_copy(value self)
{
CAMLparam1(self);

GtkTreePath* result = gtk_tree_path_copy(GtkTreePath_val(self));
CAMLreturn(Val_GtkTreePath(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_compare(value self, value arg1)
{
CAMLparam2(self, arg1);

int result = gtk_tree_path_compare(GtkTreePath_val(self), GtkTreePath_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_tree_path_append_index(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tree_path_append_index(GtkTreePath_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}
