/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileChooser */

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

/* Type-specific conversion macros for GtkFileChooser */
#ifndef Val_GtkFileChooser
#define GtkFileChooser_val(val) ((GtkFileChooser*)ext_of_val(val))
#define Val_GtkFileChooser(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFileChooser */


CAMLexport CAMLprim value ml_gtk_file_chooser_set_select_multiple(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_set_select_multiple(GtkFileChooser_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_set_filter(GtkFileChooser_val(self), GtkFileFilter_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_current_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_set_current_name(GtkFileChooser_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_create_folders(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_set_create_folders(GtkFileChooser_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_choice(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_file_chooser_set_choice(GtkFileChooser_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_action(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_set_action(GtkFileChooser_val(self), GtkFileChooserAction_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_remove_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_remove_filter(GtkFileChooser_val(self), GtkFileFilter_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_remove_choice(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_remove_choice(GtkFileChooser_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_select_multiple(value self)
{
CAMLparam1(self);

gboolean result = gtk_file_chooser_get_select_multiple(GtkFileChooser_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_filter(value self)
{
CAMLparam1(self);

GtkFileFilter* result = gtk_file_chooser_get_filter(GtkFileChooser_val(self));
CAMLreturn(Val_option(result, Val_GtkFileFilter));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_create_folders(value self)
{
CAMLparam1(self);

gboolean result = gtk_file_chooser_get_create_folders(GtkFileChooser_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_choice(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = gtk_file_chooser_get_choice(GtkFileChooser_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_action(value self)
{
CAMLparam1(self);

GtkFileChooserAction result = gtk_file_chooser_get_action(GtkFileChooser_val(self));
CAMLreturn(Val_GtkFileChooserAction(result));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_add_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_add_filter(GtkFileChooser_val(self), GtkFileFilter_val(arg1));
CAMLreturn(Val_unit);
}
