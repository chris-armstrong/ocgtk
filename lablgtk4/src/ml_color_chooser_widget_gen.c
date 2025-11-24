/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorChooserWidget */

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

/* Type-specific conversion macros for GtkColorChooserWidget */
#define GtkColorChooserWidget_val(val) ((GtkColorChooserWidget*)ext_of_val(val))
#define Val_GtkColorChooserWidget(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_color_chooser_widget_new(value unit)
{
CAMLparam1(unit);
GtkColorChooserWidget *obj = gtk_color_chooser_widget_new();
CAMLreturn(Val_GtkColorChooserWidget(obj));
}

CAMLexport CAMLprim value ml_gtk_color_chooser_widget_get_show_editor(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColorChooserWidget *obj = (GtkColorChooserWidget *)GtkColorChooserWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-editor", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_widget_set_show_editor(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColorChooserWidget *obj = (GtkColorChooserWidget *)GtkColorChooserWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-editor", c_value, NULL);
CAMLreturn(Val_unit);
}
