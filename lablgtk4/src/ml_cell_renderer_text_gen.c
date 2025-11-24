/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererText */

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

/* Type-specific conversion macros for GtkCellRendererText */
#define GtkCellRendererText_val(val) ((GtkCellRendererText*)ext_of_val(val))
#define Val_GtkCellRendererText(obj) ((value)(val_of_ext(obj)))


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
g_object_get(G_OBJECT(obj), "align-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_align_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "align-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_background(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "background", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_background(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "background", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_background_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "background-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_background_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "background-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_editable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_editable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_editable_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_editable_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_ellipsize_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "ellipsize-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_ellipsize_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "ellipsize-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_family(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "family", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_family(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "family", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_family_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "family-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_family_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "family-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_font(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "font", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_font(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "font", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_foreground(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "foreground", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_foreground(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "foreground", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_foreground_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "foreground-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_foreground_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "foreground-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_language(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "language", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_language(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "language", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_language_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "language-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_language_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "language-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_markup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "markup", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_markup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "markup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_max_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_max_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_placeholder_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "placeholder-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_placeholder_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "placeholder-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_rise(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "rise", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_rise(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "rise", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_rise_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "rise-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_rise_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "rise-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_scale(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "scale", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_scale(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "scale", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_scale_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "scale-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_scale_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "scale-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_single_paragraph_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "single-paragraph-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_single_paragraph_mode(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "single-paragraph-mode", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_size(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "size", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_size(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "size", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_size_points(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gdouble prop_value;
g_object_get(G_OBJECT(obj), "size-points", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_size_points(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gdouble c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "size-points", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_size_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "size-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_size_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "size-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_stretch_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "stretch-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_stretch_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "stretch-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_strikethrough(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "strikethrough", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_strikethrough(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "strikethrough", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_strikethrough_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "strikethrough-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_strikethrough_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "strikethrough-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_style_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "style-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_style_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "style-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_underline_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "underline-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_underline_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "underline-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_variant_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "variant-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_variant_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "variant-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_weight(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "weight", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_weight(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "weight", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_weight_set(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "weight-set", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_weight_set(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "weight-set", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_wrap_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "wrap-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_wrap_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "wrap-width", c_value, NULL);
CAMLreturn(Val_unit);
}
