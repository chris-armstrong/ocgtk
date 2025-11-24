/* GENERATED CODE - DO NOT EDIT */
/* C bindings for NotebookPage */

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

/* Type-specific conversion macros for GtkNotebookPage */
#define GtkNotebookPage_val(val) ((GtkNotebookPage*)ext_of_val(val))
#define Val_GtkNotebookPage(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_notebook_page_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_notebook_page_get_child(GtkNotebookPage_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_notebook_page_get_detachable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "detachable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_set_detachable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "detachable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_get_menu_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "menu-label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_set_menu_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "menu-label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_get_position(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "position", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_set_position(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "position", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_get_reorderable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "reorderable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_set_reorderable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "reorderable", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_get_tab_expand(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "tab-expand", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_set_tab_expand(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "tab-expand", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_get_tab_fill(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "tab-fill", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_set_tab_fill(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "tab-fill", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_get_tab_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "tab-label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_notebook_page_set_tab_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkNotebookPage *obj = (GtkNotebookPage *)GtkNotebookPage_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "tab-label", c_value, NULL);
CAMLreturn(Val_unit);
}
