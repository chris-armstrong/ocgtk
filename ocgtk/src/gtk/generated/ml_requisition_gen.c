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
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"

/* Copy function for GtkRequisition (value-like record with copy method) */
value copy_GtkRequisition(const GtkRequisition *ptr)
{
  if (ptr == NULL) return Val_none;
  GtkRequisition *copy = g_boxed_copy(gtk_requisition_get_type(), ptr);
  return ml_gir_record_val_ptr_with_type(gtk_requisition_get_type(), copy);
}


CAMLexport CAMLprim value ml_gtk_requisition_new(value unit)
{
CAMLparam1(unit);

GtkRequisition *obj = gtk_requisition_new();

CAMLreturn(Val_GtkRequisition(obj));
}\
CAMLexport CAMLprim value ml_gtk_requisition_get_width(value self)
{
    CAMLparam1(self);
    GtkRequisition *rec = GtkRequisition_val(self);
    CAMLreturn(Val_int(rec->width));
}

\
CAMLexport CAMLprim value ml_gtk_requisition_get_height(value self)
{
    CAMLparam1(self);
    GtkRequisition *rec = GtkRequisition_val(self);
    CAMLreturn(Val_int(rec->height));
}

\
CAMLexport CAMLprim value ml_gtk_requisition_set_width(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRequisition *rec = GtkRequisition_val(self);
    rec->width = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_requisition_set_height(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRequisition *rec = GtkRequisition_val(self);
    rec->height = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_requisition_make(value v_width, value v_height)
{
    CAMLparam2(v_width, v_height);
    GtkRequisition *obj = g_new0(GtkRequisition, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->width = Int_val(v_width);
    obj->height = Int_val(v_height);
    CAMLreturn(Val_GtkRequisition(obj));
}


CAMLprim value ml_gtk_requisition_get_type(value unit)
{
  CAMLparam1(unit);
  CAMLreturn(Val_long(gtk_requisition_get_type()));
}
