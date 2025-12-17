/* GENERATED CODE - DO NOT EDIT */
/* C bindings for WidgetClass */

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

/* Type-specific conversion macros for GtkWidgetClass */
#ifndef Val_GtkWidgetClass
#define GtkWidgetClass_val(val) ((GtkWidgetClass*)ext_of_val(val))
#define Val_GtkWidgetClass(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkWidgetClass */


CAMLexport CAMLprim value ml_gtk_widget_class_set_template_scope(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_widget_class_set_template_scope(GtkWidgetClass_val(self), GtkBuilderScope_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_widget_class_set_template_from_resource(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_widget_class_set_template_from_resource(GtkWidgetClass_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_widget_class_set_css_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_widget_class_set_css_name(GtkWidgetClass_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_widget_class_set_activate_signal_from_name(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_widget_class_set_activate_signal_from_name(GtkWidgetClass_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_widget_class_set_activate_signal(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_widget_class_set_activate_signal(GtkWidgetClass_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_widget_class_set_accessible_role(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_widget_class_set_accessible_role(GtkWidgetClass_val(self), GtkAccessibleRole_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_widget_class_install_property_action(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_widget_class_install_property_action(GtkWidgetClass_val(self), String_val(arg1), String_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_widget_class_get_css_name(value self)
{
CAMLparam1(self);

const char* result = gtk_widget_class_get_css_name(GtkWidgetClass_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_widget_class_get_activate_signal(value self)
{
CAMLparam1(self);

guint result = gtk_widget_class_get_activate_signal(GtkWidgetClass_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_widget_class_get_accessible_role(value self)
{
CAMLparam1(self);

GtkAccessibleRole result = gtk_widget_class_get_accessible_role(GtkWidgetClass_val(self));
CAMLreturn(Val_GtkAccessibleRole(result));
}

CAMLexport CAMLprim value ml_gtk_widget_class_add_shortcut(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_widget_class_add_shortcut(GtkWidgetClass_val(self), GtkShortcut_val(arg1));
CAMLreturn(Val_unit);
}
