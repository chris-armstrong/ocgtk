/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Requisition */

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

/* Type-specific conversion macros for GtkRequisition */
#ifndef Val_GtkRequisition
#define GtkRequisition_val(val) ((GtkRequisition*)ext_of_val(val))
#define Val_GtkRequisition(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkRequisition */


CAMLexport CAMLprim value ml_gtk_requisition_new(value unit)
{
CAMLparam1(unit);
GtkRequisition *obj = gtk_requisition_new();
CAMLreturn(Val_GtkRequisition(obj));
}

CAMLexport CAMLprim value ml_gtk_requisition_free(value self)
{
CAMLparam1(self);

gtk_requisition_free(GtkRequisition_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_requisition_copy(value self)
{
CAMLparam1(self);

GtkRequisition* result = gtk_requisition_copy(GtkRequisition_val(self));
CAMLreturn(Val_GtkRequisition(result));
}
