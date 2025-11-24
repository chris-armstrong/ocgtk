/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StyleContext */

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


CAMLexport CAMLprim value ml_gtk_style_context_set_state(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_set_state(GtkWidget_val(self), GtkStateFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_set_scale(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_set_scale(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_set_display(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_set_display(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_save(value self)
{
CAMLparam1(self);


    gtk_style_context_save(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_restore(value self)
{
CAMLparam1(self);


    gtk_style_context_restore(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_remove_provider(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_remove_provider(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_remove_class(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_remove_class(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_lookup_color(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_style_context_lookup_color(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_style_context_has_class(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_style_context_has_class(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_style_context_get_state(value self)
{
CAMLparam1(self);


    GtkStateFlags result = gtk_style_context_get_state(GtkWidget_val(self));
CAMLreturn(Val_GtkStateFlags(result));
}

CAMLexport CAMLprim value ml_gtk_style_context_get_scale(value self)
{
CAMLparam1(self);


    int result = gtk_style_context_get_scale(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_style_context_get_padding(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_get_padding(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_get_margin(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_get_margin(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_get_color(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_get_color(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_get_border(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_get_border(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_add_provider(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_style_context_add_provider(GtkWidget_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_add_class(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_style_context_add_class(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
