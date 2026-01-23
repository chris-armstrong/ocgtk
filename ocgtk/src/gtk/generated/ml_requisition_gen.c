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
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Copy function for GtkRequisition (value-like record with copy method) */
value copy_GtkRequisition(const GtkRequisition *ptr) {
  if (ptr == NULL) return Val_none;
  GtkRequisition *copy = gtk_requisition_copy((GtkRequisition*)ptr);
  return ml_gir_record_val_ptr(g_new0(GtkRequisition, 1));
}


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
