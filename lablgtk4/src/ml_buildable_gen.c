/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Buildable */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkBuildable */
#ifndef Val_GtkBuildable
#define GtkBuildable_val(val) ((GtkBuildable*)ext_of_val(val))
#define Val_GtkBuildable(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkBuildable */


CAMLexport CAMLprim value ml_gtk_buildable_get_buildable_id(value self)
{
CAMLparam1(self);

const char* result = gtk_buildable_get_buildable_id(GtkBuildable_val(self));
CAMLreturn(Val_option_string(result));
}
