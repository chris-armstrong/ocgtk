/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererText */

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

/* Type-specific conversion macros for GtkCellRendererText */
#ifndef Val_GtkCellRendererText
#define GtkCellRendererText_val(val) ((GtkCellRendererText*)ext_of_val(val))
#define Val_GtkCellRendererText(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRendererText */


CAMLexport CAMLprim value ml_gtk_cell_renderer_text_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererText *obj = gtk_cell_renderer_text_new();
CAMLreturn(Val_GtkCellRendererText(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_fixed_height_from_font(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_text_set_fixed_height_from_font(GtkCellRendererText_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_align_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "align-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_align_set: property 'align-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "align-set", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_align_set(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "align-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_align_set: property 'align-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "align-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
