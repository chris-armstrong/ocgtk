/* GENERATED CODE - DO NOT EDIT */
/* C bindings for MapListModel */

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

/* Type-specific conversion macros for GtkMapListModel */
#ifndef Val_GtkMapListModel
#define GtkMapListModel_val(val) ((GtkMapListModel*)ext_of_val(val))
#define Val_GtkMapListModel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkMapListModel */


CAMLexport CAMLprim value ml_gtk_map_list_model_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkMapListModel *obj = gtk_map_list_model_new(arg1, arg2, arg3, arg4);
CAMLreturn(Val_GtkMapListModel(obj));
}

CAMLexport CAMLprim value ml_gtk_map_list_model_has_map(value self)
{
CAMLparam1(self);

gboolean result = gtk_map_list_model_has_map(GtkMapListModel_val(self));
CAMLreturn(Val_bool(result));
}
