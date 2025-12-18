/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EditableLabel */

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

/* Type-specific conversion macros for GtkEditableLabel */
#ifndef Val_GtkEditableLabel
#define GtkEditableLabel_val(val) ((GtkEditableLabel*)ext_of_val(val))
#define Val_GtkEditableLabel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEditableLabel */


CAMLexport CAMLprim value ml_gtk_editable_label_new(value arg1)
{
CAMLparam1(arg1);
GtkEditableLabel *obj = gtk_editable_label_new(String_val(arg1));
CAMLreturn(Val_GtkEditableLabel(obj));
}

CAMLexport CAMLprim value ml_gtk_editable_label_stop_editing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_label_stop_editing(GtkEditableLabel_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_label_start_editing(value self)
{
CAMLparam1(self);

gtk_editable_label_start_editing(GtkEditableLabel_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_label_get_editing(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEditableLabel *obj = (GtkEditableLabel *)GtkEditableLabel_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "editing");
if (pspec == NULL) caml_failwith("ml_gtk_editable_label_get_editing: property 'editing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "editing", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_label_set_editing(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkEditableLabel *obj = (GtkEditableLabel *)GtkEditableLabel_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "editing");
if (pspec == NULL) caml_failwith("ml_gtk_editable_label_set_editing: property 'editing' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "editing", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
