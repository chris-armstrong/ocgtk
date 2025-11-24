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


CAMLexport CAMLprim value ml_gtk_application_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkWidget *widget = gtk_application_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), arg2);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_application_uninhibit(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_application_uninhibit(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_set_menubar(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_application_set_menubar(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_set_accels_for_action(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_application_set_accels_for_action(GtkWidget_val(self), String_val(arg1), arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_remove_window(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_application_remove_window(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_list_action_descriptions(value self)
{
CAMLparam1(self);


    gtk_application_list_action_descriptions(GtkWidget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_inhibit(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    guint result = gtk_application_inhibit(GtkWidget_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), GtkApplicationInhibitFlags_val(arg2), (Is_some(arg3) ? String_val(Some_val(arg3)) : NULL));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_application_get_window_by_id(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkWindow* result = gtk_application_get_window_by_id(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_application_get_active_window(value self)
{
CAMLparam1(self);


    GtkWindow* result = gtk_application_get_active_window(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_application_get_actions_for_accel(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_application_get_actions_for_accel(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_get_accels_for_action(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_application_get_accels_for_action(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_add_window(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_application_add_window(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_get_register_session(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "register-session", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_application_set_register_session(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "register-session", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_get_screensaver_active(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "screensaver-active", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}
