/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleText */

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

/* Type-specific conversion macros for GtkAccessibleText */
#ifndef Val_GtkAccessibleText
#define GtkAccessibleText_val(val) ((GtkAccessibleText*)ext_of_val(val))
#define Val_GtkAccessibleText(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAccessibleText */


CAMLexport CAMLprim value ml_gtk_accessible_text_update_selection_bound(value self)
{
CAMLparam1(self);

gtk_accessible_text_update_selection_bound(GtkAccessibleText_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_text_update_contents(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_accessible_text_update_contents(GtkAccessibleText_val(self), GtkAccessibleTextContentChange_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_text_update_caret_position(value self)
{
CAMLparam1(self);

gtk_accessible_text_update_caret_position(GtkAccessibleText_val(self));
CAMLreturn(Val_unit);
}
