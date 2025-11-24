/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IMContext */

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


CAMLexport CAMLprim value ml_gtk_im_context_set_use_preedit(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_im_context_set_use_preedit(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_surrounding_with_selection(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_im_context_set_surrounding_with_selection(GtkWidget_val(self), String_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_surrounding(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_im_context_set_surrounding(GtkWidget_val(self), String_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_cursor_location(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_im_context_set_cursor_location(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_client_widget(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_im_context_set_client_widget(GtkWidget_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_reset(value self)
{
CAMLparam1(self);


    gtk_im_context_reset(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_get_surrounding_with_selection(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_im_context_get_surrounding_with_selection(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_im_context_get_surrounding(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_im_context_get_surrounding(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_im_context_get_preedit_string(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_im_context_get_preedit_string(GtkWidget_val(self), arg1, arg2, arg3);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_focus_out(value self)
{
CAMLparam1(self);


    gtk_im_context_focus_out(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_focus_in(value self)
{
CAMLparam1(self);


    gtk_im_context_focus_in(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_filter_keypress(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_im_context_filter_keypress(GtkWidget_val(self), GdkEvent_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_im_context_filter_key_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5, value arg6, value arg7)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam3(arg5, arg6, arg7);


    gboolean result = gtk_im_context_filter_key(GtkWidget_val(self), Bool_val(arg1), arg2, arg3, arg4, Int_val(arg5), GdkModifierType_val(arg6), Int_val(arg7));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_im_context_filter_key_bytecode(value * argv, int argn)
{
return ml_gtk_im_context_filter_key_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
}

CAMLexport CAMLprim value ml_gtk_im_context_delete_surrounding(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_im_context_delete_surrounding(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_im_context_activate_osk(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_im_context_activate_osk(GtkWidget_val(self), (Is_some(arg1) ? GdkEvent_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_bool(result));
}
