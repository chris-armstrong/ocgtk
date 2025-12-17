/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Paned */

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

/* Type-specific conversion macros for GtkPaned */
#ifndef Val_GtkPaned
#define GtkPaned_val(val) ((GtkPaned*)ext_of_val(val))
#define Val_GtkPaned(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPaned */


CAMLexport CAMLprim value ml_gtk_paned_new(value arg1)
{
CAMLparam1(arg1);
GtkPaned *obj = gtk_paned_new(GtkOrientation_val(arg1));
CAMLreturn(Val_GtkPaned(obj));
}

CAMLexport CAMLprim value ml_gtk_paned_set_wide_handle(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_paned_set_wide_handle(GtkPaned_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_paned_set_start_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_paned_set_start_child(GtkPaned_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_paned_set_shrink_start_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_paned_set_shrink_start_child(GtkPaned_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_paned_set_shrink_end_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_paned_set_shrink_end_child(GtkPaned_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_paned_set_resize_start_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_paned_set_resize_start_child(GtkPaned_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_paned_set_resize_end_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_paned_set_resize_end_child(GtkPaned_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_paned_set_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_paned_set_position(GtkPaned_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_paned_set_end_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_paned_set_end_child(GtkPaned_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_paned_get_wide_handle(value self)
{
CAMLparam1(self);

gboolean result = gtk_paned_get_wide_handle(GtkPaned_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_paned_get_start_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_paned_get_start_child(GtkPaned_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_paned_get_shrink_start_child(value self)
{
CAMLparam1(self);

gboolean result = gtk_paned_get_shrink_start_child(GtkPaned_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_paned_get_shrink_end_child(value self)
{
CAMLparam1(self);

gboolean result = gtk_paned_get_shrink_end_child(GtkPaned_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_paned_get_resize_start_child(value self)
{
CAMLparam1(self);

gboolean result = gtk_paned_get_resize_start_child(GtkPaned_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_paned_get_resize_end_child(value self)
{
CAMLparam1(self);

gboolean result = gtk_paned_get_resize_end_child(GtkPaned_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_paned_get_position(value self)
{
CAMLparam1(self);

int result = gtk_paned_get_position(GtkPaned_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_paned_get_end_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_paned_get_end_child(GtkPaned_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}
