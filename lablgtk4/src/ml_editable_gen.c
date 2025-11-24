/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Editable */

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

/* Type-specific conversion macros for GtkEditable */
#define GtkEditable_val(val) ((GtkEditable*)ext_of_val(val))
#define Val_GtkEditable(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_editable_set_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_set_position(GtkEditable_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_set_alignment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_set_alignment(GtkEditable_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_select_region(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_editable_select_region(GtkEditable_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_init_delegate(value self)
{
CAMLparam1(self);

gtk_editable_init_delegate(GtkEditable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_position(value self)
{
CAMLparam1(self);

int result = gtk_editable_get_position(GtkEditable_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_delegate(value self)
{
CAMLparam1(self);

GtkEditable* result = gtk_editable_get_delegate(GtkEditable_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_alignment(value self)
{
CAMLparam1(self);

float result = gtk_editable_get_alignment(GtkEditable_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_editable_finish_delegate(value self)
{
CAMLparam1(self);

gtk_editable_finish_delegate(GtkEditable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_delete_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_editable_delete_text(GtkEditable_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_delete_selection(value self)
{
CAMLparam1(self);

gtk_editable_delete_selection(GtkEditable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_delegate_get_accessible_platform_state(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_editable_delegate_get_accessible_platform_state(GtkEditable_val(self), GtkAccessiblePlatformState_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_cursor_position(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "cursor-position", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_get_editable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "editable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_editable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "editable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_enable_undo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-undo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_enable_undo(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-undo", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_max_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "max-width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_max_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_selection_bound(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "selection-bound", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_width_chars(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "width-chars", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_width_chars(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "width-chars", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "xalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_editable_set_xalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkEditable *obj = (GtkEditable *)GtkEditable_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "xalign", c_value, NULL);
CAMLreturn(Val_unit);
}
