/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Builder */

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

/* Type-specific conversion macros for GtkBuilder */
#ifndef Val_GtkBuilder
#define GtkBuilder_val(val) ((GtkBuilder*)ext_of_val(val))
#define Val_GtkBuilder(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBuilder */


CAMLexport CAMLprim value ml_gtk_builder_new(value unit)
{
CAMLparam1(unit);
GtkBuilder *obj = gtk_builder_new();
CAMLreturn(Val_GtkBuilder(obj));
}

CAMLexport CAMLprim value ml_gtk_builder_new_from_file(value arg1)
{
CAMLparam1(arg1);
GtkBuilder *obj = gtk_builder_new_from_file(String_val(arg1));
CAMLreturn(Val_GtkBuilder(obj));
}

CAMLexport CAMLprim value ml_gtk_builder_new_from_resource(value arg1)
{
CAMLparam1(arg1);
GtkBuilder *obj = gtk_builder_new_from_resource(String_val(arg1));
CAMLreturn(Val_GtkBuilder(obj));
}

CAMLexport CAMLprim value ml_gtk_builder_new_from_string(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkBuilder *obj = gtk_builder_new_from_string(String_val(arg1), arg2);
CAMLreturn(Val_GtkBuilder(obj));
}

CAMLexport CAMLprim value ml_gtk_builder_set_translation_domain(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_builder_set_translation_domain(GtkBuilder_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_builder_set_scope(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_builder_set_scope(GtkBuilder_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_builder_get_translation_domain(value self)
{
CAMLparam1(self);

const char* result = gtk_builder_get_translation_domain(GtkBuilder_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_builder_get_scope(value self)
{
CAMLparam1(self);

GtkBuilderScope* result = gtk_builder_get_scope(GtkBuilder_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_builder_add_from_resource(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gtk_builder_add_from_resource(GtkBuilder_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_builder_add_from_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gtk_builder_add_from_file(GtkBuilder_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}
