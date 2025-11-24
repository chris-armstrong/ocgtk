/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererProgress */

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

/* Type-specific conversion macros for GtkCellRendererProgress */
#define GtkCellRendererProgress_val(val) ((GtkCellRendererProgress*)ext_of_val(val))
#define Val_GtkCellRendererProgress(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererProgress *obj = gtk_cell_renderer_progress_new();
CAMLreturn(Val_GtkCellRendererProgress(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_get_inverted(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "inverted", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_set_inverted(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "inverted", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_get_pulse(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "pulse", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_set_pulse(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "pulse", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_get_text_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "text-xalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_set_text_xalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "text-xalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_get_text_yalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "text-yalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_set_text_yalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "text-yalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_get_value(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "value", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_progress_set_value(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererProgress *obj = (GtkCellRendererProgress *)GtkCellRendererProgress_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "value", c_value, NULL);
CAMLreturn(Val_unit);
}
