/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Tooltip */

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


CAMLexport CAMLprim value ml_gtk_tooltip_set_tip_area(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tooltip_set_tip_area(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tooltip_set_text(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tooltip_set_text(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tooltip_set_markup(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tooltip_set_markup(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tooltip_set_icon_from_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tooltip_set_icon_from_icon_name(GtkWidget_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tooltip_set_icon_from_gicon(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tooltip_set_icon_from_gicon(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tooltip_set_icon(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tooltip_set_icon(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_tooltip_set_custom(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_tooltip_set_custom(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}
