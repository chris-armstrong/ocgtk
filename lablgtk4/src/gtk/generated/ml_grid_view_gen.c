/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GridView */

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

/* Type-specific conversion macros for GtkGridView */
#ifndef Val_GtkGridView
#define GtkGridView_val(val) ((GtkGridView*)ext_of_val(val))
#define Val_GtkGridView(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkGridView */


CAMLexport CAMLprim value ml_gtk_grid_view_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkGridView *obj = gtk_grid_view_new(Option_val(arg1, GtkSelectionModel_val, NULL), Option_val(arg2, GtkListItemFactory_val, NULL));
CAMLreturn(Val_GtkGridView(obj));
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_tab_behavior(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_view_set_tab_behavior(GtkGridView_val(self), GtkListTabBehavior_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_model(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_view_set_model(GtkGridView_val(self), Option_val(arg1, GtkSelectionModel_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_factory(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_grid_view_set_factory(GtkGridView_val(self), Option_val(arg1, GtkListItemFactory_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_scroll_to(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_grid_view_scroll_to(GtkGridView_val(self), Int_val(arg1), GtkListScrollFlags_val(arg2), Option_val(arg3, GtkScrollInfo_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_tab_behavior(value self)
{
CAMLparam1(self);

GtkListTabBehavior result = gtk_grid_view_get_tab_behavior(GtkGridView_val(self));
CAMLreturn(Val_GtkListTabBehavior(result));
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_model(value self)
{
CAMLparam1(self);

GtkSelectionModel* result = gtk_grid_view_get_model(GtkGridView_val(self));
CAMLreturn(Val_option(result, Val_GtkSelectionModel));
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_factory(value self)
{
CAMLparam1(self);

GtkListItemFactory* result = gtk_grid_view_get_factory(GtkGridView_val(self));
CAMLreturn(Val_option(result, Val_GtkListItemFactory));
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_enable_rubberband(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "enable-rubberband");
if (pspec == NULL) caml_failwith("ml_gtk_grid_view_get_enable_rubberband: property 'enable-rubberband' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "enable-rubberband", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_enable_rubberband(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "enable-rubberband");
if (pspec == NULL) caml_failwith("ml_gtk_grid_view_set_enable_rubberband: property 'enable-rubberband' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "enable-rubberband", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_max_columns(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-columns");
if (pspec == NULL) caml_failwith("ml_gtk_grid_view_get_max_columns: property 'max-columns' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "max-columns", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_max_columns(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "max-columns");
if (pspec == NULL) caml_failwith("ml_gtk_grid_view_set_max_columns: property 'max-columns' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "max-columns", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_min_columns(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
    guint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-columns");
if (pspec == NULL) caml_failwith("ml_gtk_grid_view_get_min_columns: property 'min-columns' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "min-columns", &prop_gvalue);
    prop_value = (guint)g_value_get_uint(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_min_columns(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
    guint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "min-columns");
if (pspec == NULL) caml_failwith("ml_gtk_grid_view_set_min_columns: property 'min-columns' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_uint(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "min-columns", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_single_click_activate(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "single-click-activate");
if (pspec == NULL) caml_failwith("ml_gtk_grid_view_get_single_click_activate: property 'single-click-activate' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "single-click-activate", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_single_click_activate(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "single-click-activate");
if (pspec == NULL) caml_failwith("ml_gtk_grid_view_set_single_click_activate: property 'single-click-activate' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "single-click-activate", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
