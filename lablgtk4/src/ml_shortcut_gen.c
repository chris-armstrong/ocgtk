/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Shortcut */

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


CAMLexport CAMLprim value ml_gtk_shortcut_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_shortcut_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_shortcut_new_with_arguments(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkWidget *widget = gtk_shortcut_new_with_arguments((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), (Is_some(arg3) ? String_val(Some_val(arg3)) : NULL), arg4);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_shortcut_set_trigger(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_shortcut_set_trigger(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_set_arguments(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_shortcut_set_arguments(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_set_action(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_shortcut_set_action(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_shortcut_get_trigger(value self)
{
CAMLparam1(self);


    GtkShortcutTrigger* result = gtk_shortcut_get_trigger(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_shortcut_get_action(value self)
{
CAMLparam1(self);


    GtkShortcutAction* result = gtk_shortcut_get_action(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
