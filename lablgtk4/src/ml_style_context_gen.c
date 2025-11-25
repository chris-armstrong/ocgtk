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

/* Type-specific conversion macros for GtkStyleContext */
#ifndef Val_GtkStyleContext
#define GtkStyleContext_val(val) ((GtkStyleContext*)ext_of_val(val))
#define Val_GtkStyleContext(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkStyleContext */


CAMLexport CAMLprim value ml_gtk_style_context_set_state(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_style_context_set_state(GtkStyleContext_val(self), GtkStateFlags_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_set_scale(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_style_context_set_scale(GtkStyleContext_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_save(value self)
{
CAMLparam1(self);

gtk_style_context_save(GtkStyleContext_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_restore(value self)
{
CAMLparam1(self);

gtk_style_context_restore(GtkStyleContext_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_remove_provider(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_style_context_remove_provider(GtkStyleContext_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_remove_class(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_style_context_remove_class(GtkStyleContext_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_has_class(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_style_context_has_class(GtkStyleContext_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_style_context_get_state(value self)
{
CAMLparam1(self);

GtkStateFlags result = gtk_style_context_get_state(GtkStyleContext_val(self));
CAMLreturn(Val_GtkStateFlags(result));
}

CAMLexport CAMLprim value ml_gtk_style_context_get_scale(value self)
{
CAMLparam1(self);

int result = gtk_style_context_get_scale(GtkStyleContext_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_style_context_get_padding(value self)
{
CAMLparam1(self);
GtkBorder out1;

gtk_style_context_get_padding(GtkStyleContext_val(self), &out1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_get_margin(value self)
{
CAMLparam1(self);
GtkBorder out1;

gtk_style_context_get_margin(GtkStyleContext_val(self), &out1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_get_border(value self)
{
CAMLparam1(self);
GtkBorder out1;

gtk_style_context_get_border(GtkStyleContext_val(self), &out1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_add_provider(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_style_context_add_provider(GtkStyleContext_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_style_context_add_class(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_style_context_add_class(GtkStyleContext_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}
