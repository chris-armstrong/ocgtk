/* GENERATED CODE - DO NOT EDIT */
/* C bindings for StringList */

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

/* Type-specific conversion macros for GtkStringList */
#define GtkStringList_val(val) ((GtkStringList*)ext_of_val(val))
#define Val_GtkStringList(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_string_list_new(value arg1)
{
CAMLparam1(arg1);
GtkStringList *obj = gtk_string_list_new(arg1);
CAMLreturn(Val_GtkStringList(obj));
}

CAMLexport CAMLprim value ml_gtk_string_list_remove(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_string_list_remove(GtkStringList_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_get_string(value self, value arg1)
{
CAMLparam2(self, arg1);

const char* result = gtk_string_list_get_string(GtkStringList_val(self), Int_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_string_list_append(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_string_list_append(GtkStringList_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_string_list_get_n_items(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkStringList *obj = (GtkStringList *)GtkStringList_val(self);
guint prop_value;
g_object_get(G_OBJECT(obj), "n-items", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}
