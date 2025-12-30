/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ApplicationCommandLine */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_g_application_command_line_set_exit_status(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_command_line_set_exit_status(GApplicationCommandLine_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_command_line_printerr_literal(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_command_line_printerr_literal(GApplicationCommandLine_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_command_line_print_literal(value self, value arg1)
{
CAMLparam2(self, arg1);

g_application_command_line_print_literal(GApplicationCommandLine_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_command_line_getenv(value self, value arg1)
{
CAMLparam2(self, arg1);

const gchar* result = g_application_command_line_getenv(GApplicationCommandLine_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}

CAMLexport CAMLprim value ml_g_application_command_line_get_stdin(value self)
{
CAMLparam1(self);

GInputStream* result = g_application_command_line_get_stdin(GApplicationCommandLine_val(self));
CAMLreturn(Val_option(result, Val_GInputStream));
}

CAMLexport CAMLprim value ml_g_application_command_line_get_is_remote(value self)
{
CAMLparam1(self);

gboolean result = g_application_command_line_get_is_remote(GApplicationCommandLine_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_application_command_line_get_exit_status(value self)
{
CAMLparam1(self);

int result = g_application_command_line_get_exit_status(GApplicationCommandLine_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_application_command_line_get_cwd(value self)
{
CAMLparam1(self);

const gchar* result = g_application_command_line_get_cwd(GApplicationCommandLine_val(self));
CAMLreturn(Val_option(result, caml_copy_string));
}

CAMLexport CAMLprim value ml_g_application_command_line_done(value self)
{
CAMLparam1(self);

g_application_command_line_done(GApplicationCommandLine_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_application_command_line_create_file_for_arg(value self, value arg1)
{
CAMLparam2(self, arg1);

GFile* result = g_application_command_line_create_file_for_arg(GApplicationCommandLine_val(self), String_val(arg1));
CAMLreturn(Val_GFile(result));
}
