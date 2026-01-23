/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BuildableParseContext */

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

/* Conversion functions for GtkBuildableParseContext (opaque record with hidden fields) */
GtkBuildableParseContext *GtkBuildableParseContext_val(value v) {
  return *(GtkBuildableParseContext **)Data_custom_val(v);
}

value Val_GtkBuildableParseContext(const GtkBuildableParseContext *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkBuildableParseContext_option(const GtkBuildableParseContext *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkBuildableParseContext(ptr));
}


CAMLexport CAMLprim value ml_gtk_buildable_parse_context_get_position(value self)
{
CAMLparam1(self);
int out1;
int out2;

gtk_buildable_parse_context_get_position(GtkBuildableParseContext_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_int(out1));
    Store_field(ret, 1, Val_int(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_buildable_parse_context_get_element_stack(value self)
{
CAMLparam1(self);

GPtrArray* result = gtk_buildable_parse_context_get_element_stack(GtkBuildableParseContext_val(self));
    guint result_length = result->len;
    gpointer* result_pdata = result->pdata;
    CAMLlocal1(ml_result);
    ml_result = caml_alloc(result_length, 0);
    for (int i = 0; i < result_length; i++) {
      Store_field(ml_result, i, caml_copy_string((GPtrArray*)result_pdata[i]));
    }
CAMLreturn(ml_result);
}

CAMLexport CAMLprim value ml_gtk_buildable_parse_context_get_element(value self)
{
CAMLparam1(self);

const char* result = gtk_buildable_parse_context_get_element(GtkBuildableParseContext_val(self));
CAMLreturn(Val_option_string(result));
}
