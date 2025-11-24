/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ComboBoxText */

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

/* Type-specific conversion macros for GtkComboBoxText */
#define GtkComboBoxText_val(val) ((GtkComboBoxText*)ext_of_val(val))
#define Val_GtkComboBoxText(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_combo_box_text_new(value unit)
{
CAMLparam1(unit);
GtkComboBoxText *obj = gtk_combo_box_text_new();
CAMLreturn(Val_GtkComboBoxText(obj));
}

CAMLexport CAMLprim value ml_gtk_combo_box_text_new_with_entry(value unit)
{
CAMLparam1(unit);
GtkComboBoxText *obj = gtk_combo_box_text_new_with_entry();
CAMLreturn(Val_GtkComboBoxText(obj));
}

CAMLexport CAMLprim value ml_gtk_combo_box_text_remove_all(value self)
{
CAMLparam1(self);

gtk_combo_box_text_remove_all(GtkComboBoxText_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_text_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_combo_box_text_remove(GtkComboBoxText_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_text_prepend_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_combo_box_text_prepend_text(GtkComboBoxText_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_text_prepend(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_combo_box_text_prepend(GtkComboBoxText_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_text_insert_text(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_combo_box_text_insert_text(GtkComboBoxText_val(self), Int_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_text_insert(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_combo_box_text_insert(GtkComboBoxText_val(self), Int_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL), String_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_text_append_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_combo_box_text_append_text(GtkComboBoxText_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_combo_box_text_append(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_combo_box_text_append(GtkComboBoxText_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), String_val(arg2));
CAMLreturn(Val_unit);
}
