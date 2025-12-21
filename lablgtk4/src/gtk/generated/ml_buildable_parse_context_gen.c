/* GENERATED CODE - DO NOT EDIT */
/* C bindings for BuildableParseContext */

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

/* Type-specific conversion macros for GtkBuildableParseContext */
#ifndef Val_GtkBuildableParseContext
#define GtkBuildableParseContext_val(val) ((GtkBuildableParseContext*)ext_of_val(val))
#define Val_GtkBuildableParseContext(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBuildableParseContext */


CAMLexport CAMLprim value ml_gtk_buildable_parse_context_get_position(value self)
{
CAMLparam1(self);
int out1;
int out2;

gtk_buildable_parse_context_get_position(GtkBuildableParseContext_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_int(out1));
    Store_field(ret, 1, Val_int(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_buildable_parse_context_get_element(value self)
{
CAMLparam1(self);

const char* result = gtk_buildable_parse_context_get_element(GtkBuildableParseContext_val(self));
CAMLreturn(Val_option_string(result));
}
