/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ScrollInfo */

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

/* Type-specific conversion macros for GtkScrollInfo */
#ifndef Val_GtkScrollInfo
#define GtkScrollInfo_val(val) ((GtkScrollInfo*)ext_of_val(val))
#define Val_GtkScrollInfo(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkScrollInfo */


CAMLexport CAMLprim value ml_gtk_scroll_info_new(value unit)
{
CAMLparam1(unit);
GtkScrollInfo *obj = gtk_scroll_info_new();
CAMLreturn(Val_GtkScrollInfo(obj));
}

CAMLexport CAMLprim value ml_gtk_scroll_info_unref(value self)
{
CAMLparam1(self);

gtk_scroll_info_unref(GtkScrollInfo_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scroll_info_set_enable_vertical(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scroll_info_set_enable_vertical(GtkScrollInfo_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scroll_info_set_enable_horizontal(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_scroll_info_set_enable_horizontal(GtkScrollInfo_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_scroll_info_ref(value self)
{
CAMLparam1(self);

GtkScrollInfo* result = gtk_scroll_info_ref(GtkScrollInfo_val(self));
CAMLreturn(Val_GtkScrollInfo(result));
}

CAMLexport CAMLprim value ml_gtk_scroll_info_get_enable_vertical(value self)
{
CAMLparam1(self);

gboolean result = gtk_scroll_info_get_enable_vertical(GtkScrollInfo_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_scroll_info_get_enable_horizontal(value self)
{
CAMLparam1(self);

gboolean result = gtk_scroll_info_get_enable_horizontal(GtkScrollInfo_val(self));
CAMLreturn(Val_bool(result));
}
