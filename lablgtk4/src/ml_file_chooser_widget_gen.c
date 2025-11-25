/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileChooserWidget */

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

/* Type-specific conversion macros for GtkFileChooserWidget */
#ifndef Val_GtkFileChooserWidget
#define GtkFileChooserWidget_val(val) ((GtkFileChooserWidget*)ext_of_val(val))
#define Val_GtkFileChooserWidget(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkFileChooserWidget */


CAMLexport CAMLprim value ml_gtk_file_chooser_widget_new(value arg1)
{
CAMLparam1(arg1);
GtkFileChooserWidget *obj = gtk_file_chooser_widget_new(GtkFileChooserAction_val(arg1));
CAMLreturn(Val_GtkFileChooserWidget(obj));
}

CAMLexport CAMLprim value ml_gtk_file_chooser_widget_get_search_mode(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkFileChooserWidget *obj = (GtkFileChooserWidget *)GtkFileChooserWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "search-mode", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_file_chooser_widget_set_search_mode(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkFileChooserWidget *obj = (GtkFileChooserWidget *)GtkFileChooserWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "search-mode", c_value, NULL);
CAMLreturn(Val_unit);
}
