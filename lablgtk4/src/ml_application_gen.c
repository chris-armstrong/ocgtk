/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Application */

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

/* Type-specific conversion macros for GtkApplication */
#ifndef Val_GtkApplication
#define GtkApplication_val(val) ((GtkApplication*)ext_of_val(val))
#define Val_GtkApplication(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkApplication */


CAMLexport CAMLprim value ml_gtk_application_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkApplication *obj = gtk_application_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), arg2);
CAMLreturn(Val_GtkApplication(obj));
}

CAMLexport CAMLprim value ml_gtk_application_uninhibit(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_application_uninhibit(GtkApplication_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_remove_window(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_application_remove_window(GtkApplication_val(self), GtkWindow_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_list_action_descriptions(value self)
{
CAMLparam1(self);

gtk_application_list_action_descriptions(GtkApplication_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_inhibit(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

guint result = gtk_application_inhibit(GtkApplication_val(self), (Is_some(arg1) ? GtkWindow_val(Some_val(arg1)) : NULL), GtkApplicationInhibitFlags_val(arg2), (Is_some(arg3) ? String_val(Some_val(arg3)) : NULL));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_application_get_window_by_id(value self, value arg1)
{
CAMLparam2(self, arg1);

GtkWindow* result = gtk_application_get_window_by_id(GtkApplication_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWindow(result));
}

CAMLexport CAMLprim value ml_gtk_application_get_active_window(value self)
{
CAMLparam1(self);

GtkWindow* result = gtk_application_get_active_window(GtkApplication_val(self));
CAMLreturn(Val_GtkWindow(result));
}

CAMLexport CAMLprim value ml_gtk_application_get_actions_for_accel(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_application_get_actions_for_accel(GtkApplication_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_get_accels_for_action(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_application_get_accels_for_action(GtkApplication_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_add_window(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_application_add_window(GtkApplication_val(self), GtkWindow_val(arg1));
CAMLreturn(Val_unit);
}
