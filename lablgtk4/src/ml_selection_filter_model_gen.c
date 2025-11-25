/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SelectionFilterModel */

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

/* Type-specific conversion macros for GtkSelectionFilterModel */
#ifndef Val_GtkSelectionFilterModel
#define GtkSelectionFilterModel_val(val) ((GtkSelectionFilterModel*)ext_of_val(val))
#define Val_GtkSelectionFilterModel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSelectionFilterModel */


CAMLexport CAMLprim value ml_gtk_selection_filter_model_new(value arg1)
{
CAMLparam1(arg1);
GtkSelectionFilterModel *obj = gtk_selection_filter_model_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkSelectionFilterModel(obj));
}

CAMLexport CAMLprim value ml_gtk_selection_filter_model_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_selection_filter_model_set_model(GtkSelectionFilterModel_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_selection_filter_model_get_model(value self)
{
CAMLparam1(self);

GtkSelectionModel* result = gtk_selection_filter_model_get_model(GtkSelectionFilterModel_val(self));
CAMLreturn(Val_GtkWidget(result));
}
