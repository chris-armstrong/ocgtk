/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SearchBar */

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

/* Type-specific conversion macros for GtkSearchBar */
#ifndef Val_GtkSearchBar
#define GtkSearchBar_val(val) ((GtkSearchBar*)ext_of_val(val))
#define Val_GtkSearchBar(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSearchBar */


CAMLexport CAMLprim value ml_gtk_search_bar_new(value unit)
{
CAMLparam1(unit);
GtkSearchBar *obj = gtk_search_bar_new();
CAMLreturn(Val_GtkSearchBar(obj));
}

CAMLexport CAMLprim value ml_gtk_search_bar_set_show_close_button(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_bar_set_show_close_button(GtkSearchBar_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_bar_set_search_mode(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_bar_set_search_mode(GtkSearchBar_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_bar_set_key_capture_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_bar_set_key_capture_widget(GtkSearchBar_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_bar_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_bar_set_child(GtkSearchBar_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_search_bar_get_show_close_button(value self)
{
CAMLparam1(self);

gboolean result = gtk_search_bar_get_show_close_button(GtkSearchBar_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_search_bar_get_search_mode(value self)
{
CAMLparam1(self);

gboolean result = gtk_search_bar_get_search_mode(GtkSearchBar_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_search_bar_get_key_capture_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_search_bar_get_key_capture_widget(GtkSearchBar_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_search_bar_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_search_bar_get_child(GtkSearchBar_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_search_bar_connect_entry(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_search_bar_connect_entry(GtkSearchBar_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}
