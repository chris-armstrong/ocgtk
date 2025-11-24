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
#define GtkApplicationWindow_val(val) ((GtkApplicationWindow*)ext_of_val(val))
#define Val_GtkApplicationWindow(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_application_window_new(value arg1)
{
CAMLparam1(arg1);
GtkApplicationWindow *obj = gtk_application_window_new(GtkWidget_val(arg1));
CAMLreturn(Val_GtkApplicationWindow(obj));
}

CAMLexport CAMLprim value ml_gtk_application_window_set_help_overlay(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_application_window_set_help_overlay(GtkApplicationWindow_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
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
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_application_window_get_show_menubar(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkApplicationWindow *obj = (GtkApplicationWindow *)GtkApplicationWindow_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-menubar", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_application_window_set_show_menubar(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkApplicationWindow *obj = (GtkApplicationWindow *)GtkApplicationWindow_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-menubar", c_value, NULL);
CAMLreturn(Val_unit);
}
