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
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_cell_renderer_text_new(value unit)
{
CAMLparam1(unit);

GtkCellRendererText *obj = gtk_cell_renderer_text_new();
if (obj) g_object_ref_sink(obj);

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
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "align-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_align_set: property 'align-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "align-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_align_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "align-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_align_set: property 'align-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "align-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_background(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "background");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_background: property 'background' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "background", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_background(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "background");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_background: property 'background' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "background", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_background_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "background-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_background_set: property 'background-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "background-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_background_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "background-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_background_set: property 'background-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "background-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_editable(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "editable");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_editable: property 'editable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "editable", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_editable(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "editable");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_editable: property 'editable' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "editable", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_editable_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "editable-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_editable_set: property 'editable-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "editable-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_editable_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "editable-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_editable_set: property 'editable-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "editable-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_ellipsize_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "ellipsize-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_ellipsize_set: property 'ellipsize-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "ellipsize-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_ellipsize_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "ellipsize-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_ellipsize_set: property 'ellipsize-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "ellipsize-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_family(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "family");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_family: property 'family' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "family", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_family(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "family");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_family: property 'family' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "family", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_family_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "family-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_family_set: property 'family-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "family-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_family_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "family-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_family_set: property 'family-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "family-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_font(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "font");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_font: property 'font' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "font", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_font(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "font");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_font: property 'font' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "font", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_foreground(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "foreground");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_foreground: property 'foreground' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "foreground", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_foreground(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "foreground");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_foreground: property 'foreground' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "foreground", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_foreground_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "foreground-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_foreground_set: property 'foreground-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "foreground-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_foreground_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "foreground-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_foreground_set: property 'foreground-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "foreground-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_language(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "language");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_language: property 'language' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "language", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_language(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "language");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_language: property 'language' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "language", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_language_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "language-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_language_set: property 'language-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "language-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_language_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "language-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_language_set: property 'language-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "language-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_markup(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "markup");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_markup: property 'markup' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "markup", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_markup(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "markup");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_markup: property 'markup' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "markup", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_max_width_chars(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-width-chars");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_max_width_chars: property 'max-width-chars' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "max-width-chars", &prop_gvalue);
          prop_value = g_value_get_int(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_max_width_chars(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-width-chars");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_max_width_chars: property 'max-width-chars' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "max-width-chars", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_placeholder_text(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "placeholder-text");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_placeholder_text: property 'placeholder-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "placeholder-text", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_placeholder_text(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "placeholder-text");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_placeholder_text: property 'placeholder-text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "placeholder-text", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_rise(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "rise");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_rise: property 'rise' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "rise", &prop_gvalue);
          prop_value = g_value_get_int(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_rise(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "rise");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_rise: property 'rise' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "rise", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_rise_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "rise-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_rise_set: property 'rise-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "rise-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_rise_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "rise-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_rise_set: property 'rise-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "rise-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_scale(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gdouble prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "scale");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_scale: property 'scale' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "scale", &prop_gvalue);
          prop_value = g_value_get_double(&prop_gvalue);

      result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_scale(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gdouble c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "scale");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_scale: property 'scale' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_double(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "scale", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_scale_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "scale-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_scale_set: property 'scale-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "scale-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_scale_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "scale-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_scale_set: property 'scale-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "scale-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_single_paragraph_mode(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "single-paragraph-mode");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_single_paragraph_mode: property 'single-paragraph-mode' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "single-paragraph-mode", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_single_paragraph_mode(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "single-paragraph-mode");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_single_paragraph_mode: property 'single-paragraph-mode' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "single-paragraph-mode", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_size(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "size");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_size: property 'size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "size", &prop_gvalue);
          prop_value = g_value_get_int(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_size(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "size");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_size: property 'size' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "size", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_size_points(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gdouble prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "size-points");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_size_points: property 'size-points' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "size-points", &prop_gvalue);
          prop_value = g_value_get_double(&prop_gvalue);

      result = caml_copy_double(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_size_points(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gdouble c_value = Double_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "size-points");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_size_points: property 'size-points' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_double(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "size-points", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_size_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "size-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_size_set: property 'size-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "size-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_size_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "size-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_size_set: property 'size-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "size-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_stretch_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "stretch-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_stretch_set: property 'stretch-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "stretch-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_stretch_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "stretch-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_stretch_set: property 'stretch-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "stretch-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_strikethrough(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "strikethrough");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_strikethrough: property 'strikethrough' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "strikethrough", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_strikethrough(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "strikethrough");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_strikethrough: property 'strikethrough' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "strikethrough", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_strikethrough_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "strikethrough-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_strikethrough_set: property 'strikethrough-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "strikethrough-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_strikethrough_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "strikethrough-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_strikethrough_set: property 'strikethrough-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "strikethrough-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_style_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "style-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_style_set: property 'style-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "style-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_style_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "style-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_style_set: property 'style-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "style-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_text(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_text: property 'text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "text", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_text(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "text");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_text: property 'text' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "text", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_underline_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "underline-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_underline_set: property 'underline-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "underline-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_underline_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "underline-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_underline_set: property 'underline-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "underline-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_variant_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "variant-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_variant_set: property 'variant-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "variant-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_variant_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "variant-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_variant_set: property 'variant-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "variant-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_weight(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "weight");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_weight: property 'weight' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "weight", &prop_gvalue);
          prop_value = g_value_get_int(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_weight(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "weight");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_weight: property 'weight' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "weight", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_weight_set(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "weight-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_weight_set: property 'weight-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "weight-set", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_weight_set(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gboolean *c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "weight-set");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_weight_set: property 'weight-set' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "weight-set", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_width_chars(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "width-chars");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_width_chars: property 'width-chars' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "width-chars", &prop_gvalue);
          prop_value = g_value_get_int(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_width_chars(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "width-chars");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_width_chars: property 'width-chars' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "width-chars", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_get_wrap_width(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "wrap-width");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_get_wrap_width: property 'wrap-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "wrap-width", &prop_gvalue);
          prop_value = g_value_get_int(&prop_gvalue);

      result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_cell_renderer_text_set_wrap_width(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkCellRendererText *obj = (GtkCellRendererText *)GtkCellRendererText_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "wrap-width");
if (pspec == NULL) caml_failwith("ml_gtk_cell_renderer_text_set_wrap_width: property 'wrap-width' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "wrap-width", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}
