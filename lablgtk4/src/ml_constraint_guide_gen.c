/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ConstraintGuide */

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

/* Type-specific conversion macros for GtkConstraintGuide */
#ifndef Val_GtkConstraintGuide
#define GtkConstraintGuide_val(val) ((GtkConstraintGuide*)ext_of_val(val))
#define Val_GtkConstraintGuide(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkConstraintGuide */


CAMLexport CAMLprim value ml_gtk_constraint_guide_new(value unit)
{
CAMLparam1(unit);
GtkConstraintGuide *obj = gtk_constraint_guide_new();
CAMLreturn(Val_GtkConstraintGuide(obj));
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_strength(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_constraint_guide_set_strength(GtkConstraintGuide_val(self), GtkConstraintStrength_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_nat_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_constraint_guide_set_nat_size(GtkConstraintGuide_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_constraint_guide_set_name(GtkConstraintGuide_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_min_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_constraint_guide_set_min_size(GtkConstraintGuide_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_set_max_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_constraint_guide_set_max_size(GtkConstraintGuide_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_strength(value self)
{
CAMLparam1(self);

GtkConstraintStrength result = gtk_constraint_guide_get_strength(GtkConstraintGuide_val(self));
CAMLreturn(Val_GtkConstraintStrength(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_guide_get_name(value self)
{
CAMLparam1(self);

const char* result = gtk_constraint_guide_get_name(GtkConstraintGuide_val(self));
CAMLreturn(Val_option_string(result));
}
