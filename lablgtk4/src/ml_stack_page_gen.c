/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StackPage */

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

/* Type-specific conversion macros for GtkStackPage */
#define GtkStackPage_val(val) ((GtkStackPage*)ext_of_val(val))
#define Val_GtkStackPage(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_stack_page_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_stack_page_get_child(GtkStackPage_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_needs_attention(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "needs-attention", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_needs_attention(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "needs-attention", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_title(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "title", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_title(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "title", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_use_underline(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-underline", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_use_underline(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-underline", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_stack_page_get_visible(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "visible", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_stack_page_set_visible(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkStackPage *obj = (GtkStackPage *)GtkStackPage_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "visible", c_value, NULL);
CAMLreturn(Val_unit);
}
