/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRenderer */

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

/* Type-specific conversion macros for GtkCellRenderer */
#ifndef Val_GtkCellRenderer
#define GtkCellRenderer_val(val) ((GtkCellRenderer*)ext_of_val(val))
#define Val_GtkCellRenderer(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkCellRenderer */


CAMLexport CAMLprim value ml_gtk_cell_renderer_stop_editing(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_stop_editing(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_visible(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_set_visible(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_sensitive(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_set_sensitive(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_padding(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_renderer_set_padding(GtkCellRenderer_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_is_expander(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_set_is_expander(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_is_expanded(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_cell_renderer_set_is_expanded(GtkCellRenderer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_fixed_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_renderer_set_fixed_size(GtkCellRenderer_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_alignment(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_cell_renderer_set_alignment(GtkCellRenderer_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_is_activatable(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_is_activatable(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_visible(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_get_visible(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_state(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GtkStateFlags result = gtk_cell_renderer_get_state(GtkCellRenderer_val(self), GtkWidget_option_val(arg1), GtkCellRendererState_val(arg2));
CAMLreturn(Val_GtkStateFlags(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_sensitive(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_get_sensitive(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_request_mode(value self)
{
CAMLparam1(self);

GtkSizeRequestMode result = gtk_cell_renderer_get_request_mode(GtkCellRenderer_val(self));
CAMLreturn(Val_GtkSizeRequestMode(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_preferred_size(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_cell_renderer_get_preferred_size(GtkCellRenderer_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), GtkWidget_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_is_expander(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_get_is_expander(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_is_expanded(value self)
{
CAMLparam1(self);

gboolean result = gtk_cell_renderer_get_is_expanded(GtkCellRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_get_cell_background(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRenderer *obj = (GtkCellRenderer *)GtkCellRenderer_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "cell-background", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_set_cell_background(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRenderer *obj = (GtkCellRenderer *)GtkCellRenderer_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "cell-background", c_value, NULL);
CAMLreturn(Val_unit);
}
