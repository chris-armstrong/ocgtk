/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRenderer */

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

/* Type-specific conversion macros for GtkCellRenderer */
#ifndef Val_GtkCellRenderer
#define GtkCellRenderer_val(val) ((GtkCellRenderer*)ext_of_val(val))
#define Val_GtkCellRenderer(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRenderer */


CAMLexport CAMLprim value ml_gtk_cell_renderer_stop_editing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_stop_editing(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_visible(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_set_visible(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_sensitive(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_set_sensitive(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_padding(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_renderer_set_padding(GtkCellRenderer_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_is_expander(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_set_is_expander(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_is_expanded(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_set_is_expanded(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_fixed_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_renderer_set_fixed_size(GtkCellRenderer_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_alignment(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_renderer_set_alignment(GtkCellRenderer_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_is_activatable(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_is_activatable(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_visible(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_get_visible(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_state(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GtkStateFlags result = gtk_cell_renderer_get_state(GtkCellRenderer_val(self), GtkWidget_option_val(arg1), GtkCellRendererState_val(arg2));
CAMLreturn(Val_GtkStateFlags(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_sensitive(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_get_sensitive(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_request_mode(value self)
{
CAMLparam1(self);

GtkSizeRequestMode result = gtk_cell_renderer_get_request_mode(GtkCellRenderer_val(self));
CAMLreturn(Val_GtkSizeRequestMode(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_preferred_size(value self, value arg1)
{
CAMLparam2(self, arg1);
GtkRequisition out2;
GtkRequisition out3;

gtk_cell_renderer_get_preferred_size(GtkCellRenderer_val(self), GtkWidget_val(arg1), &out2, &out3);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_GtkRequisition(out2));
    Store_field(ret, 1, Val_GtkRequisition(out3));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_is_expander(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_get_is_expander(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_is_expanded(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_get_is_expanded(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_cell_background(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRenderer *obj = (GtkCellRenderer *)GtkCellRenderer_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "cell-background");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_get_cell_background: property 'cell-background' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "cell-background", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_cell_background(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRenderer *obj = (GtkCellRenderer *)GtkCellRenderer_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "cell-background");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_set_cell_background: property 'cell-background' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "cell-background", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
