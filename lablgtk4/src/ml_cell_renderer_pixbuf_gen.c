/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CellRendererPixbuf */

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

/* Type-specific conversion macros for GtkCellRendererPixbuf */
#define GtkCellRendererPixbuf_val(val) ((GtkCellRendererPixbuf*)ext_of_val(val))
#define Val_GtkCellRendererPixbuf(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_cell_renderer_pixbuf_new(value unit)
{
CAMLparam1(unit);
GtkCellRendererPixbuf *obj = gtk_cell_renderer_pixbuf_new();
CAMLreturn(Val_GtkCellRendererPixbuf(obj));
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_pixbuf_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkCellRendererPixbuf *obj = (GtkCellRendererPixbuf *)GtkCellRendererPixbuf_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_cell_renderer_pixbuf_set_icon_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkCellRendererPixbuf *obj = (GtkCellRendererPixbuf *)GtkCellRendererPixbuf_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "icon-name", c_value, NULL);
CAMLreturn(Val_unit);
}
