/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListBoxRow */

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

/* Type-specific conversion macros for GtkListBoxRow */
#define GtkListBoxRow_val(val) ((GtkListBoxRow*)ext_of_val(val))
#define Val_GtkListBoxRow(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_list_box_row_new(value unit)
{
CAMLparam1(unit);
GtkListBoxRow *obj = gtk_list_box_row_new();
CAMLreturn(Val_GtkListBoxRow(obj));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_set_header(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_row_set_header(GtkListBoxRow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_box_row_set_child(GtkListBoxRow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_is_selected(value self)
{
CAMLparam1(self);

gboolean result = gtk_list_box_row_is_selected(GtkListBoxRow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_index(value self)
{
CAMLparam1(self);

int result = gtk_list_box_row_get_index(GtkListBoxRow_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_header(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_list_box_row_get_header(GtkListBoxRow_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_list_box_row_get_child(GtkListBoxRow_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_list_box_row_changed(value self)
{
CAMLparam1(self);

gtk_list_box_row_changed(GtkListBoxRow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_activatable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListBoxRow *obj = (GtkListBoxRow *)GtkListBoxRow_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "activatable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_set_activatable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkListBoxRow *obj = (GtkListBoxRow *)GtkListBoxRow_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "activatable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_get_selectable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkListBoxRow *obj = (GtkListBoxRow *)GtkListBoxRow_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "selectable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_list_box_row_set_selectable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkListBoxRow *obj = (GtkListBoxRow *)GtkListBoxRow_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "selectable", c_value, NULL);
CAMLreturn(Val_unit);
}
