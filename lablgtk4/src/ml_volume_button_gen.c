/* GENERATED CODE - DO NOT EDIT */
/* C bindings for VolumeButton */

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

/* Type-specific conversion macros for GtkVolumeButton */
#ifndef Val_GtkVolumeButton
#define GtkVolumeButton_val(val) ((GtkVolumeButton*)ext_of_val(val))
#define Val_GtkVolumeButton(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkVolumeButton */


CAMLexport CAMLprim value ml_gtk_volume_button_new(value unit)
{
CAMLparam1(unit);
GtkVolumeButton *obj = gtk_volume_button_new();
CAMLreturn(Val_GtkVolumeButton(obj));
}
