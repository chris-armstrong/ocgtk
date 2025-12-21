/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ListHeader */

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

/* Type-specific conversion macros for GtkListHeader */
#ifndef Val_GtkListHeader
#define GtkListHeader_val(val) ((GtkListHeader*)ext_of_val(val))
#define Val_GtkListHeader(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkListHeader */


CAMLexport CAMLprim value ml_gtk_list_header_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_list_header_set_child(GtkListHeader_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_list_header_get_start(value self)
{
CAMLparam1(self);

guint result = gtk_list_header_get_start(GtkListHeader_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_list_header_get_n_items(value self)
{
CAMLparam1(self);

guint result = gtk_list_header_get_n_items(GtkListHeader_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_list_header_get_end(value self)
{
CAMLparam1(self);

guint result = gtk_list_header_get_end(GtkListHeader_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_list_header_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_list_header_get_child(GtkListHeader_val(self));
CAMLreturn(Val_option(result, Val_GtkWidget));
}
