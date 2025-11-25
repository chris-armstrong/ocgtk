/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DirectoryList */

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

/* Type-specific conversion macros for GtkDirectoryList */
#ifndef Val_GtkDirectoryList
#define GtkDirectoryList_val(val) ((GtkDirectoryList*)ext_of_val(val))
#define Val_GtkDirectoryList(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkDirectoryList */


CAMLexport CAMLprim value ml_gtk_directory_list_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkDirectoryList *obj = gtk_directory_list_new(String_option_val(arg1), arg2);
CAMLreturn(Val_GtkDirectoryList(obj));
}

CAMLexport CAMLprim value ml_gtk_directory_list_set_monitored(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_directory_list_set_monitored(GtkDirectoryList_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_directory_list_set_io_priority(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_directory_list_set_io_priority(GtkDirectoryList_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_directory_list_set_attributes(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_directory_list_set_attributes(GtkDirectoryList_val(self), String_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_directory_list_is_loading(value self)
{
CAMLparam1(self);

gboolean result = gtk_directory_list_is_loading(GtkDirectoryList_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_directory_list_get_monitored(value self)
{
CAMLparam1(self);

gboolean result = gtk_directory_list_get_monitored(GtkDirectoryList_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_directory_list_get_io_priority(value self)
{
CAMLparam1(self);

int result = gtk_directory_list_get_io_priority(GtkDirectoryList_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_directory_list_get_attributes(value self)
{
CAMLparam1(self);

const char* result = gtk_directory_list_get_attributes(GtkDirectoryList_val(self));
CAMLreturn(Val_option_string(result));
}
