/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextMark */

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

/* Type-specific conversion macros for GtkTextMark */
#define GtkTextMark_val(val) ((GtkTextMark*)ext_of_val(val))
#define Val_GtkTextMark(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_text_mark_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkTextMark *obj = gtk_text_mark_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), Bool_val(arg2));
CAMLreturn(Val_GtkTextMark(obj));
}

CAMLexport CAMLprim value ml_gtk_text_mark_set_visible(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_text_mark_set_visible(GtkTextMark_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_mark_get_visible(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_mark_get_visible(GtkTextMark_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_mark_get_deleted(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_mark_get_deleted(GtkTextMark_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_mark_get_buffer(value self)
{
CAMLparam1(self);

GtkTextBuffer* result = gtk_text_mark_get_buffer(GtkTextMark_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_mark_get_left_gravity(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTextMark *obj = (GtkTextMark *)GtkTextMark_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "left-gravity", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_mark_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTextMark *obj = (GtkTextMark *)GtkTextMark_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}
