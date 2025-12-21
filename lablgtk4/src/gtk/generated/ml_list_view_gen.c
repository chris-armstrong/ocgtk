/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListView */

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

/* Type-specific conversion macros for GtkListView */
#ifndef Val_GtkListView
#define GtkListView_val(val) ((GtkListView*)ext_of_val(val))
#define Val_GtkListView(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkListView */


CAMLexport CAMLprim value ml_gtk_list_view_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkListView *obj = gtk_list_view_new(arg1, Option_val(arg2, GtkListItemFactory_val, NULL));
CAMLreturn(Val_GtkListView(obj));
}

CAMLexport CAMLprim value ml_gtk_list_view_set_tab_behavior(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_view_set_tab_behavior(GtkListView_val(self), GtkListTabBehavior_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_view_set_single_click_activate(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_view_set_single_click_activate(GtkListView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_view_set_show_separators(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_view_set_show_separators(GtkListView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_view_set_header_factory(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_view_set_header_factory(GtkListView_val(self), Option_val(arg1, GtkListItemFactory_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_view_set_factory(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_view_set_factory(GtkListView_val(self), Option_val(arg1, GtkListItemFactory_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_view_set_enable_rubberband(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_view_set_enable_rubberband(GtkListView_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_view_get_tab_behavior(value self)
{
CAMLparam1(self);

GtkListTabBehavior result = gtk_list_view_get_tab_behavior(GtkListView_val(self));
CAMLreturn(Val_GtkListTabBehavior(result));
}

CAMLexport CAMLprim value ml_gtk_list_view_get_single_click_activate(value self)
{
CAMLparam1(self);

gboolean result = gtk_list_view_get_single_click_activate(GtkListView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_view_get_show_separators(value self)
{
CAMLparam1(self);

gboolean result = gtk_list_view_get_show_separators(GtkListView_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_list_view_get_header_factory(value self)
{
CAMLparam1(self);

GtkListItemFactory* result = gtk_list_view_get_header_factory(GtkListView_val(self));
CAMLreturn(Val_option(result, Val_GtkListItemFactory));
}

CAMLexport CAMLprim value ml_gtk_list_view_get_factory(value self)
{
CAMLparam1(self);

GtkListItemFactory* result = gtk_list_view_get_factory(GtkListView_val(self));
CAMLreturn(Val_option(result, Val_GtkListItemFactory));
}

CAMLexport CAMLprim value ml_gtk_list_view_get_enable_rubberband(value self)
{
CAMLparam1(self);

gboolean result = gtk_list_view_get_enable_rubberband(GtkListView_val(self));
CAMLreturn(Val_bool(result));
}
