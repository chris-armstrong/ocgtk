/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Border */

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
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"

/* Copy function for GtkBorder (value-like record with copy method) */
value copy_GtkBorder(const GtkBorder *ptr)
{
  if (ptr == NULL) return Val_none;
  GtkBorder *copy = gtk_border_copy((GtkBorder*)ptr);
  return ml_gir_record_val_ptr_with_type(gtk_border_get_type(), copy);
}


CAMLexport CAMLprim value ml_gtk_border_new(value unit)
{
CAMLparam1(unit);

GtkBorder *obj = gtk_border_new();

CAMLreturn(Val_GtkBorder(obj));
}\
CAMLexport CAMLprim value ml_gtk_border_get_left(value self)
{
    CAMLparam1(self);
    GtkBorder *rec = GtkBorder_val(self);
    CAMLreturn(Val_int16(rec->left));
}

\
CAMLexport CAMLprim value ml_gtk_border_get_right(value self)
{
    CAMLparam1(self);
    GtkBorder *rec = GtkBorder_val(self);
    CAMLreturn(Val_int16(rec->right));
}

\
CAMLexport CAMLprim value ml_gtk_border_get_top(value self)
{
    CAMLparam1(self);
    GtkBorder *rec = GtkBorder_val(self);
    CAMLreturn(Val_int16(rec->top));
}

\
CAMLexport CAMLprim value ml_gtk_border_get_bottom(value self)
{
    CAMLparam1(self);
    GtkBorder *rec = GtkBorder_val(self);
    CAMLreturn(Val_int16(rec->bottom));
}

\
CAMLexport CAMLprim value ml_gtk_border_set_left(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkBorder *rec = GtkBorder_val(self);
    rec->left = Int16_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_border_set_right(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkBorder *rec = GtkBorder_val(self);
    rec->right = Int16_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_border_set_top(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkBorder *rec = GtkBorder_val(self);
    rec->top = Int16_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_border_set_bottom(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkBorder *rec = GtkBorder_val(self);
    rec->bottom = Int16_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_border_make(value v_left, value v_right, value v_top, value v_bottom)
{
    CAMLparam4(v_left, v_right, v_top, v_bottom);
    GtkBorder *obj = g_new0(GtkBorder, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->left = Int16_val(v_left);
    obj->right = Int16_val(v_right);
    obj->top = Int16_val(v_top);
    obj->bottom = Int16_val(v_bottom);
    CAMLreturn(Val_GtkBorder(obj));
}

