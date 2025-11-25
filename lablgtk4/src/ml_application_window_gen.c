/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ApplicationWindow */

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

/* Type-specific conversion macros for GtkApplicationWindow */
#ifndef Val_GtkApplicationWindow
#define GtkApplicationWindow_val(val) ((GtkApplicationWindow*)ext_of_val(val))
#define Val_GtkApplicationWindow(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkApplicationWindow */


CAMLexport CAMLprim value ml_gtk_application_window_new(value arg1)
{
CAMLparam1(arg1);
GtkApplicationWindow *obj = gtk_application_window_new(GtkApplication_val(arg1));
CAMLreturn(Val_GtkApplicationWindow(obj));
}

CAMLexport CAMLprim value ml_gtk_application_window_set_show_menubar(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_application_window_set_show_menubar(GtkApplicationWindow_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_window_set_help_overlay(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_application_window_set_help_overlay(GtkApplicationWindow_val(self), (Is_some(arg1) ? GtkShortcutsWindow_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_application_window_get_show_menubar(value self)
{
CAMLparam1(self);

gboolean result = gtk_application_window_get_show_menubar(GtkApplicationWindow_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_application_window_get_id(value self)
{
CAMLparam1(self);

guint result = gtk_application_window_get_id(GtkApplicationWindow_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_application_window_get_help_overlay(value self)
{
CAMLparam1(self);

GtkShortcutsWindow* result = gtk_application_window_get_help_overlay(GtkApplicationWindow_val(self));
CAMLreturn(Val_GtkShortcutsWindow(result));
}
