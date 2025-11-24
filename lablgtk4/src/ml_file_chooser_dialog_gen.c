/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileChooserDialog */

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

/* Type-specific conversion macros for GtkFileChooserDialog */
#define GtkFileChooserDialog_val(val) ((GtkFileChooserDialog*)ext_of_val(val))
#define Val_GtkFileChooserDialog(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_file_chooser_dialog_new(value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(arg1, arg2, arg3, arg4, arg5);
GtkFileChooserDialog *obj = gtk_file_chooser_dialog_new((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), GtkFileChooserAction_val(arg3), (Is_some(arg4) ? String_val(Some_val(arg4)) : NULL), arg5);
CAMLreturn(Val_GtkFileChooserDialog(obj));
}
