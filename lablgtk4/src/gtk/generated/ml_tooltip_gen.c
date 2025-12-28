/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Tooltip */

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


CAMLexport CAMLprim value ml_gtk_tooltip_set_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tooltip_set_text(GtkTooltip_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tooltip_set_markup(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tooltip_set_markup(GtkTooltip_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tooltip_set_icon_from_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tooltip_set_icon_from_icon_name(GtkTooltip_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tooltip_set_custom(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_tooltip_set_custom(GtkTooltip_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}
