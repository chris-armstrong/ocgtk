/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Bitset */

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

/* Type-specific conversion macros for GtkBitset */
#ifndef Val_GtkBitset
#define GtkBitset_val(val) ((GtkBitset*)ext_of_val(val))
#define Val_GtkBitset(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBitset */


CAMLexport CAMLprim value ml_gtk_bitset_new_empty(value unit)
{
CAMLparam1(unit);
GtkBitset *obj = gtk_bitset_new_empty();
CAMLreturn(Val_GtkBitset(obj));
}

CAMLexport CAMLprim value ml_gtk_bitset_new_range(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBitset *obj = gtk_bitset_new_range(Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_GtkBitset(obj));
}

CAMLexport CAMLprim value ml_gtk_bitset_unref(value self)
{
CAMLparam1(self);

gtk_bitset_unref(GtkBitset_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_union(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bitset_union(GtkBitset_val(self), GtkBitset_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_subtract(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bitset_subtract(GtkBitset_val(self), GtkBitset_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_splice(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_bitset_splice(GtkBitset_val(self), Int_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_shift_right(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bitset_shift_right(GtkBitset_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_shift_left(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bitset_shift_left(GtkBitset_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_remove_rectangle(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_bitset_remove_rectangle(GtkBitset_val(self), Int_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_remove_range_closed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_bitset_remove_range_closed(GtkBitset_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_remove_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_bitset_remove_range(GtkBitset_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_remove_all(value self)
{
CAMLparam1(self);

gtk_bitset_remove_all(GtkBitset_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_bitset_remove(GtkBitset_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_ref(value self)
{
CAMLparam1(self);

GtkBitset* result = gtk_bitset_ref(GtkBitset_val(self));
CAMLreturn(Val_GtkBitset(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_is_empty(value self)
{
CAMLparam1(self);

gboolean result = gtk_bitset_is_empty(GtkBitset_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_intersect(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bitset_intersect(GtkBitset_val(self), GtkBitset_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_get_nth(value self, value arg1)
{
CAMLparam2(self, arg1);

guint result = gtk_bitset_get_nth(GtkBitset_val(self), Int_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_get_minimum(value self)
{
CAMLparam1(self);

guint result = gtk_bitset_get_minimum(GtkBitset_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_get_maximum(value self)
{
CAMLparam1(self);

guint result = gtk_bitset_get_maximum(GtkBitset_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_equals(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_bitset_equals(GtkBitset_val(self), GtkBitset_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_difference(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_bitset_difference(GtkBitset_val(self), GtkBitset_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_copy(value self)
{
CAMLparam1(self);

GtkBitset* result = gtk_bitset_copy(GtkBitset_val(self));
CAMLreturn(Val_GtkBitset(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_contains(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_bitset_contains(GtkBitset_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_bitset_add_rectangle(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_bitset_add_rectangle(GtkBitset_val(self), Int_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_add_range_closed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_bitset_add_range_closed(GtkBitset_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_add_range(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_bitset_add_range(GtkBitset_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_bitset_add(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_bitset_add(GtkBitset_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}
