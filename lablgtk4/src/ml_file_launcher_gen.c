/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileLauncher */

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

/* Type-specific conversion macros for GtkFileLauncher */
#define GtkFileLauncher_val(val) ((GtkFileLauncher*)ext_of_val(val))
#define Val_GtkFileLauncher(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_file_launcher_new(value arg1)
{
CAMLparam1(arg1);
GtkFileLauncher *obj = gtk_file_launcher_new(arg1);
CAMLreturn(Val_GtkFileLauncher(obj));
}

CAMLexport CAMLprim value ml_gtk_file_launcher_get_always_ask(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileLauncher *obj = (GtkFileLauncher *)GtkFileLauncher_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "always-ask", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_launcher_set_always_ask(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileLauncher *obj = (GtkFileLauncher *)GtkFileLauncher_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "always-ask", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_launcher_get_writable(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileLauncher *obj = (GtkFileLauncher *)GtkFileLauncher_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "writable", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_launcher_set_writable(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileLauncher *obj = (GtkFileLauncher *)GtkFileLauncher_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "writable", c_value, NULL);
CAMLreturn(Val_unit);
}
