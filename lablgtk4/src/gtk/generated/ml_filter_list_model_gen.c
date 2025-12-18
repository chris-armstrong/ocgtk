/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FilterListModel */

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

/* Type-specific conversion macros for GtkFilterListModel */
#ifndef Val_GtkFilterListModel
#define GtkFilterListModel_val(val) ((GtkFilterListModel*)ext_of_val(val))
#define Val_GtkFilterListModel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFilterListModel */


CAMLexport CAMLprim value ml_gtk_filter_list_model_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkFilterListModel *obj = gtk_filter_list_model_new(arg1, Option_val(arg2, GtkFilter_val, NULL));
CAMLreturn(Val_GtkFilterListModel(obj));
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_set_incremental(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_filter_list_model_set_incremental(GtkFilterListModel_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_set_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_filter_list_model_set_filter(GtkFilterListModel_val(self), Option_val(arg1, GtkFilter_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_pending(value self)
{
CAMLparam1(self);

guint result = gtk_filter_list_model_get_pending(GtkFilterListModel_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_incremental(value self)
{
CAMLparam1(self);

gboolean result = gtk_filter_list_model_get_incremental(GtkFilterListModel_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_filter_list_model_get_filter(value self)
{
CAMLparam1(self);

GtkFilter* result = gtk_filter_list_model_get_filter(GtkFilterListModel_val(self));
CAMLreturn(Val_option(result, Val_GtkFilter));
}
