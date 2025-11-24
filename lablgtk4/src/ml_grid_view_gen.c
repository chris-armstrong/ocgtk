/* GENERATED CODE - DO NOT EDIT */
/* C bindings for GridView */

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

/* Type-specific conversion macros for GtkGridView */
#define GtkGridView_val(val) ((GtkGridView*)ext_of_val(val))
#define Val_GtkGridView(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_grid_view_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkGridView *obj = gtk_grid_view_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
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


    gtk_grid_view_set_model(GtkGridView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_factory(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_grid_view_set_factory(GtkGridView_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_scroll_to(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_grid_view_scroll_to(GtkGridView_val(self), Int_val(arg1), GtkListScrollFlags_val(arg2), (Is_some(arg3) ? GtkWidget_val(Some_val(arg3)) : NULL));
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
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_factory(value self)
{
CAMLparam1(self);


    GtkListItemFactory* result = gtk_grid_view_get_factory(GtkGridView_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_enable_rubberband(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-rubberband", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_enable_rubberband(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-rubberband", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_max_columns(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "max-columns", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_max_columns(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "max-columns", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_min_columns(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "min-columns", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_min_columns(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
guint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "min-columns", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_grid_view_get_single_click_activate(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "single-click-activate", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_grid_view_set_single_click_activate(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkGridView *obj = (GtkGridView *)GtkGridView_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "single-click-activate", c_value, NULL);
CAMLreturn(Val_unit);
}
