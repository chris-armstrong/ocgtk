/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Editable */

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

/* Type-specific conversion macros for GtkEditable */
#ifndef Val_GtkEditable
#define GtkEditable_val(val) ((GtkEditable*)ext_of_val(val))
#define Val_GtkEditable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkEditable */


CAMLexport CAMLprim value ml_gtk_editable_set_width_chars(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_set_width_chars(GtkEditable_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_set_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_set_text(GtkEditable_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_set_position(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_set_position(GtkEditable_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_set_max_width_chars(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_set_max_width_chars(GtkEditable_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_set_enable_undo(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_set_enable_undo(GtkEditable_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_set_editable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_set_editable(GtkEditable_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_set_alignment(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_editable_set_alignment(GtkEditable_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_select_region(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_editable_select_region(GtkEditable_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_init_delegate(value self)
{
CAMLparam1(self);

gtk_editable_init_delegate(GtkEditable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_get_width_chars(value self)
{
CAMLparam1(self);

int result = gtk_editable_get_width_chars(GtkEditable_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_text(value self)
{
CAMLparam1(self);

const char* result = gtk_editable_get_text(GtkEditable_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_position(value self)
{
CAMLparam1(self);

int result = gtk_editable_get_position(GtkEditable_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_max_width_chars(value self)
{
CAMLparam1(self);

int result = gtk_editable_get_max_width_chars(GtkEditable_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_enable_undo(value self)
{
CAMLparam1(self);

gboolean result = gtk_editable_get_enable_undo(GtkEditable_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_editable(value self)
{
CAMLparam1(self);

gboolean result = gtk_editable_get_editable(GtkEditable_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_delegate(value self)
{
CAMLparam1(self);

GtkEditable* result = gtk_editable_get_delegate(GtkEditable_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_editable_get_alignment(value self)
{
CAMLparam1(self);

float result = gtk_editable_get_alignment(GtkEditable_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_editable_finish_delegate(value self)
{
CAMLparam1(self);

gtk_editable_finish_delegate(GtkEditable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_delete_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_editable_delete_text(GtkEditable_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_delete_selection(value self)
{
CAMLparam1(self);

gtk_editable_delete_selection(GtkEditable_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_editable_delegate_get_accessible_platform_state(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_editable_delegate_get_accessible_platform_state(GtkEditable_val(self), GtkAccessiblePlatformState_val(arg1));
CAMLreturn(Val_bool(result));
}
