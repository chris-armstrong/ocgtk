/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FlowBoxChild */

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

/* Type-specific conversion macros for GtkFlowBoxChild */
#ifndef Val_GtkFlowBoxChild
#define GtkFlowBoxChild_val(val) ((GtkFlowBoxChild*)ext_of_val(val))
#define Val_GtkFlowBoxChild(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFlowBoxChild */


CAMLexport CAMLprim value ml_gtk_flow_box_child_new(value unit)
{
CAMLparam1(unit);
GtkFlowBoxChild *obj = gtk_flow_box_child_new();
CAMLreturn(Val_GtkFlowBoxChild(obj));
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_flow_box_child_set_child(GtkFlowBoxChild_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_is_selected(value self)
{
CAMLparam1(self);

gboolean result = gtk_flow_box_child_is_selected(GtkFlowBoxChild_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_get_index(value self)
{
CAMLparam1(self);

int result = gtk_flow_box_child_get_index(GtkFlowBoxChild_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_flow_box_child_get_child(GtkFlowBoxChild_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}

CAMLexport CAMLprim value ml_gtk_flow_box_child_changed(value self)
{
CAMLparam1(self);

gtk_flow_box_child_changed(GtkFlowBoxChild_val(self));
CAMLreturn(Val_unit);
}
