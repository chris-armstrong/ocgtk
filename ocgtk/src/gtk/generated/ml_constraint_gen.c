/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Constraint */

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


CAMLexport CAMLprim value ml_gtk_constraint_is_required(value self)
{
CAMLparam1(self);

gboolean result = gtk_constraint_is_required(GtkConstraint_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_is_constant(value self)
{
CAMLparam1(self);

gboolean result = gtk_constraint_is_constant(GtkConstraint_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_is_attached(value self)
{
CAMLparam1(self);

gboolean result = gtk_constraint_is_attached(GtkConstraint_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_get_target_attribute(value self)
{
CAMLparam1(self);

GtkConstraintAttribute result = gtk_constraint_get_target_attribute(GtkConstraint_val(self));
CAMLreturn(Val_GtkConstraintAttribute(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_get_target(value self)
{
CAMLparam1(self);

GtkConstraintTarget* result = gtk_constraint_get_target(GtkConstraint_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GtkConstraintTarget));
}

CAMLexport CAMLprim value ml_gtk_constraint_get_strength(value self)
{
CAMLparam1(self);

int result = gtk_constraint_get_strength(GtkConstraint_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_get_source_attribute(value self)
{
CAMLparam1(self);

GtkConstraintAttribute result = gtk_constraint_get_source_attribute(GtkConstraint_val(self));
CAMLreturn(Val_GtkConstraintAttribute(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_get_source(value self)
{
CAMLparam1(self);

GtkConstraintTarget* result = gtk_constraint_get_source(GtkConstraint_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GtkConstraintTarget));
}

CAMLexport CAMLprim value ml_gtk_constraint_get_relation(value self)
{
CAMLparam1(self);

GtkConstraintRelation result = gtk_constraint_get_relation(GtkConstraint_val(self));
CAMLreturn(Val_GtkConstraintRelation(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_get_multiplier(value self)
{
CAMLparam1(self);

double result = gtk_constraint_get_multiplier(GtkConstraint_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_constraint_get_constant(value self)
{
CAMLparam1(self);

double result = gtk_constraint_get_constant(GtkConstraint_val(self));
CAMLreturn(caml_copy_double(result));
}
