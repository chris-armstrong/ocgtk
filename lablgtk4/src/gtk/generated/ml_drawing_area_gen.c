/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DrawingArea */

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

/* Type-specific conversion macros for GtkDrawingArea */
#ifndef Val_GtkDrawingArea
#define GtkDrawingArea_val(val) ((GtkDrawingArea*)ext_of_val(val))
#define Val_GtkDrawingArea(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkDrawingArea */


CAMLexport CAMLprim value ml_gtk_drawing_area_new(value unit)
{
CAMLparam1(unit);
GtkDrawingArea *obj = gtk_drawing_area_new();
CAMLreturn(Val_GtkDrawingArea(obj));
}

CAMLexport CAMLprim value ml_gtk_drawing_area_set_content_width(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drawing_area_set_content_width(GtkDrawingArea_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drawing_area_set_content_height(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drawing_area_set_content_height(GtkDrawingArea_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drawing_area_get_content_width(value self)
{
CAMLparam1(self);

int result = gtk_drawing_area_get_content_width(GtkDrawingArea_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_drawing_area_get_content_height(value self)
{
CAMLparam1(self);

int result = gtk_drawing_area_get_content_height(GtkDrawingArea_val(self));
CAMLreturn(Val_int(result));
}
