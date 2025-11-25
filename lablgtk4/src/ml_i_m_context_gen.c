/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IMContext */

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

/* Type-specific conversion macros for GtkIMContext */
#ifndef Val_GtkIMContext
#define GtkIMContext_val(val) ((GtkIMContext*)ext_of_val(val))
#define Val_GtkIMContext(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkIMContext */


CAMLexport CAMLprim value ml_gtk_im_context_set_use_preedit(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_im_context_set_use_preedit(GtkIMContext_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_surrounding_with_selection(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_im_context_set_surrounding_with_selection(GtkIMContext_val(self), String_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_surrounding(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_im_context_set_surrounding(GtkIMContext_val(self), String_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_client_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_im_context_set_client_widget(GtkIMContext_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_reset(value self)
{
CAMLparam1(self);

gtk_im_context_reset(GtkIMContext_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_focus_out(value self)
{
CAMLparam1(self);

gtk_im_context_focus_out(GtkIMContext_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_focus_in(value self)
{
CAMLparam1(self);

gtk_im_context_focus_in(GtkIMContext_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_filter_keypress(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_im_context_filter_keypress(GtkIMContext_val(self), GdkEvent_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_im_context_delete_surrounding(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gtk_im_context_delete_surrounding(GtkIMContext_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_im_context_activate_osk(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_im_context_activate_osk(GtkIMContext_val(self), Option_val(arg1, GdkEvent_val, NULL));
CAMLreturn(Val_bool(result));
}
