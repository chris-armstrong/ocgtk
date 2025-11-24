/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileChooser */

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

/* Type-specific conversion macros for GtkFileChooser */
#define GtkFileChooser_val(val) ((GtkFileChooser*)ext_of_val(val))
#define Val_GtkFileChooser(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_file_chooser_set_filter(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_set_filter(GtkFileChooser_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_current_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_set_current_name(GtkFileChooser_val(self), String_val(arg1));
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

gtk_file_chooser_remove_filter(GtkFileChooser_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_remove_choice(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_file_chooser_remove_choice(GtkFileChooser_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_filter(value self)
{
CAMLparam1(self);

GtkFileFilter* result = gtk_file_chooser_get_filter(GtkFileChooser_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_choice(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = gtk_file_chooser_get_choice(GtkFileChooser_val(self), String_val(arg1));
CAMLreturn(caml_copy_string(result));
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

gtk_file_chooser_add_filter(GtkFileChooser_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_create_folders(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileChooser *obj = (GtkFileChooser *)GtkFileChooser_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "create-folders", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_create_folders(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileChooser *obj = (GtkFileChooser *)GtkFileChooser_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "create-folders", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_get_select_multiple(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileChooser *obj = (GtkFileChooser *)GtkFileChooser_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "select-multiple", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_set_select_multiple(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileChooser *obj = (GtkFileChooser *)GtkFileChooser_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "select-multiple", c_value, NULL);
CAMLreturn(Val_unit);
}
