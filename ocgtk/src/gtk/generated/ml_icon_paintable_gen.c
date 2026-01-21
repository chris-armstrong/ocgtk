/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IconPaintable */

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


CAMLexport CAMLprim value ml_gtk_icon_paintable_is_symbolic(value self)
{
CAMLparam1(self);

gboolean result = gtk_icon_paintable_is_symbolic(GtkIconPaintable_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_paintable_get_icon_name(value self)
{
CAMLparam1(self);

const char* result = gtk_icon_paintable_get_icon_name(GtkIconPaintable_val(self));
CAMLreturn(Val_option_string(result));
}
