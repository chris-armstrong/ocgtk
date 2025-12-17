/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Window */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkWindow */
#ifndef Val_GtkWindow
#define GtkWindow_val(val) ((GtkWindow*)ext_of_val(val))
#define Val_GtkWindow(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkWindow */


CAMLexport CAMLprim value ml_gtk_window_new(value unit)
{
CAMLparam1(unit);
GtkWindow *obj = gtk_window_new();
CAMLreturn(Val_GtkWindow(obj));
}

CAMLexport CAMLprim value ml_gtk_window_unminimize(value self)
{
CAMLparam1(self);

gtk_window_unminimize(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_unmaximize(value self)
{
CAMLparam1(self);

gtk_window_unmaximize(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_unfullscreen(value self)
{
CAMLparam1(self);

gtk_window_unfullscreen(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_transient_for(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_transient_for(GtkWindow_val(self), Option_val(arg1, GtkWindow_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_titlebar(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_titlebar(GtkWindow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_title(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_title(GtkWindow_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_startup_id(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_startup_id(GtkWindow_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_resizable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_resizable(GtkWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_modal(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_modal(GtkWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_mnemonics_visible(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_mnemonics_visible(GtkWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_icon_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_icon_name(GtkWindow_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_hide_on_close(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_hide_on_close(GtkWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_handle_menubar_accel(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_handle_menubar_accel(GtkWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_focus_visible(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_focus_visible(GtkWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_focus(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_focus(GtkWindow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_destroy_with_parent(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_destroy_with_parent(GtkWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_deletable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_deletable(GtkWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_default_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_default_widget(GtkWindow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_default_size(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_window_set_default_size(GtkWindow_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_decorated(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_decorated(GtkWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_child(GtkWindow_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_set_application(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_window_set_application(GtkWindow_val(self), Option_val(arg1, GtkApplication_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_present(value self)
{
CAMLparam1(self);

gtk_window_present(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_minimize(value self)
{
CAMLparam1(self);

gtk_window_minimize(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_maximize(value self)
{
CAMLparam1(self);

gtk_window_maximize(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_is_suspended(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_is_suspended(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_is_maximized(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_is_maximized(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_is_fullscreen(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_is_fullscreen(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_is_active(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_is_active(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_has_group(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_has_group(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_transient_for(value self)
{
CAMLparam1(self);

GtkWindow* result = gtk_window_get_transient_for(GtkWindow_val(self));
CAMLreturn(Val_option(result, Val_GtkWindow));
}

CAMLexport CAMLprim value ml_gtk_window_get_titlebar(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_window_get_titlebar(GtkWindow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_title(value self)
{
CAMLparam1(self);

const char* result = gtk_window_get_title(GtkWindow_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_resizable(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_get_resizable(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_modal(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_get_modal(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_mnemonics_visible(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_get_mnemonics_visible(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_icon_name(value self)
{
CAMLparam1(self);

const char* result = gtk_window_get_icon_name(GtkWindow_val(self));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_hide_on_close(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_get_hide_on_close(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_handle_menubar_accel(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_get_handle_menubar_accel(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_group(value self)
{
CAMLparam1(self);

GtkWindowGroup* result = gtk_window_get_group(GtkWindow_val(self));
CAMLreturn(Val_GtkWindowGroup(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_focus_visible(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_get_focus_visible(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_focus(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_window_get_focus(GtkWindow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_destroy_with_parent(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_get_destroy_with_parent(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_deletable(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_get_deletable(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_default_widget(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_window_get_default_widget(GtkWindow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_decorated(value self)
{
CAMLparam1(self);

gboolean result = gtk_window_get_decorated(GtkWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_child(value self)
{
CAMLparam1(self);

GtkWidget* result = gtk_window_get_child(GtkWindow_val(self));
CAMLreturn(Val_GtkWidget_option(result));
}

CAMLexport CAMLprim value ml_gtk_window_get_application(value self)
{
CAMLparam1(self);

GtkApplication* result = gtk_window_get_application(GtkWindow_val(self));
CAMLreturn(Val_option(result, Val_GtkApplication));
}

CAMLexport CAMLprim value ml_gtk_window_fullscreen(value self)
{
CAMLparam1(self);

gtk_window_fullscreen(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_destroy(value self)
{
CAMLparam1(self);

gtk_window_destroy(GtkWindow_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_window_close(value self)
{
CAMLparam1(self);

gtk_window_close(GtkWindow_val(self));
CAMLreturn(Val_unit);
}
