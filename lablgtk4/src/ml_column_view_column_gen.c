/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColumnViewColumn */

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

/* Type-specific conversion macros for GtkColumnViewColumn */
#define GtkColumnViewColumn_val(val) ((GtkColumnViewColumn*)ext_of_val(val))
#define Val_GtkColumnViewColumn(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_column_view_column_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkColumnViewColumn *obj = gtk_column_view_column_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkColumnViewColumn(obj));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_sorter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_sorter(GtkColumnViewColumn_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_factory(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_column_view_column_set_factory(GtkColumnViewColumn_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_sorter(value self)
{
CAMLparam1(self);

GtkSorter* result = gtk_column_view_column_get_sorter(GtkColumnViewColumn_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_factory(value self)
{
CAMLparam1(self);

GtkListItemFactory* result = gtk_column_view_column_get_factory(GtkColumnViewColumn_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_column_view(value self)
{
CAMLparam1(self);

GtkColumnView* result = gtk_column_view_column_get_column_view(GtkColumnViewColumn_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_expand(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "expand", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_expand(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "expand", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_fixed_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "fixed-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_fixed_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "fixed-width", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_id(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "id", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_id(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "id", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_resizable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "resizable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_resizable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "resizable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_get_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_column_view_column_set_visible(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColumnViewColumn *obj = (GtkColumnViewColumn *)GtkColumnViewColumn_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visible", c_value, NULL);
CAMLreturn(Val_unit);
}
