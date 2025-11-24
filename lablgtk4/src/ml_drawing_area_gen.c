/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DrawingArea */

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

/* Type-specific conversion macros for GtkDrawingArea */
#define GtkDrawingArea_val(val) ((GtkDrawingArea*)ext_of_val(val))
#define Val_GtkDrawingArea(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_drawing_area_new(value unit)
{
CAMLparam1(unit);
GtkDrawingArea *obj = gtk_drawing_area_new();
CAMLreturn(Val_GtkDrawingArea(obj));
}

CAMLexport CAMLprim value ml_gtk_drawing_area_get_content_height(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDrawingArea *obj = (GtkDrawingArea *)GtkDrawingArea_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "content-height", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drawing_area_set_content_height(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkDrawingArea *obj = (GtkDrawingArea *)GtkDrawingArea_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "content-height", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drawing_area_get_content_width(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDrawingArea *obj = (GtkDrawingArea *)GtkDrawingArea_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "content-width", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drawing_area_set_content_width(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkDrawingArea *obj = (GtkDrawingArea *)GtkDrawingArea_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "content-width", c_value, NULL);
CAMLreturn(Val_unit);
}
