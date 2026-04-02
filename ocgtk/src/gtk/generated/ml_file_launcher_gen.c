/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileLauncher */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"


CAMLexport CAMLprim value ml_gtk_file_launcher_new(value arg1)
{
CAMLparam1(arg1);

GtkFileLauncher *obj = gtk_file_launcher_new(Option_val(arg1, GFile_val, NULL));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GtkFileLauncher(obj));
}
CAMLexport CAMLprim value ml_gtk_file_launcher_set_writable(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_launcher_set_writable(GtkFileLauncher_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_launcher_set_file(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_launcher_set_file(GtkFileLauncher_val(self), Option_val(arg1, GFile_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_launcher_set_always_ask(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_launcher_set_always_ask(GtkFileLauncher_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_launcher_open_containing_folder_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gtk_file_launcher_open_containing_folder_finish(GtkFileLauncher_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_file_launcher_launch_finish(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gtk_file_launcher_launch_finish(GtkFileLauncher_val(self), GAsyncResult_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_file_launcher_get_writable(value self)
{
CAMLparam1(self);

gboolean result = gtk_file_launcher_get_writable(GtkFileLauncher_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_file_launcher_get_file(value self)
{
CAMLparam1(self);

GFile* result = gtk_file_launcher_get_file(GtkFileLauncher_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GFile));
}

CAMLexport CAMLprim value ml_gtk_file_launcher_get_always_ask(value self)
{
CAMLparam1(self);

gboolean result = gtk_file_launcher_get_always_ask(GtkFileLauncher_val(self));
CAMLreturn(Val_bool(result));
}
