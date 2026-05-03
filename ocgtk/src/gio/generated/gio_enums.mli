(* GENERATED CODE - DO NOT EDIT *)
(* Gio Enumeration and Bitfield Types *)

(* BusType - enumeration *)
type bustype = [
  (** An alias for the message bus that activated the process, if any. *)
  | `STARTER
  (** Not a message bus. *)
  | `NONE
  (** The system-wide message bus. *)
  | `SYSTEM
  (** The login session message bus. *)
  | `SESSION
]

val bustype_of_int : int -> bustype
val bustype_to_int : bustype -> int

(* ConverterResult - enumeration *)
type converterresult = [
  (** There was an error during conversion. *)
  | `ERROR
  (** Some data was consumed or produced *)
  | `CONVERTED
  (** The conversion is finished *)
  | `FINISHED
  (** Flushing is finished *)
  | `FLUSHED
]

val converterresult_of_int : int -> converterresult
val converterresult_to_int : converterresult -> int

(* CredentialsType - enumeration *)
type credentialstype = [
  (** Indicates an invalid native credential type. *)
  | `INVALID
  (** The native credentials type is a `struct ucred`. *)
  | `LINUX_UCRED
  (** The native credentials type is a `struct cmsgcred`. *)
  | `FREEBSD_CMSGCRED
  (** The native credentials type is a `struct sockpeercred`. Added in 2.30. *)
  | `OPENBSD_SOCKPEERCRED
  (** The native credentials type is a `ucred_t`. Added in 2.40. *)
  | `SOLARIS_UCRED
  (** The native credentials type is a `struct unpcbid`. Added in 2.42. *)
  | `NETBSD_UNPCBID
  (** The native credentials type is a `struct xucred`. Added in 2.66. *)
  | `APPLE_XUCRED
  (** The native credentials type is a PID `DWORD`. Added in 2.72. *)
  | `WIN32_PID
]

val credentialstype_of_int : int -> credentialstype
val credentialstype_to_int : credentialstype -> int

(* DBusError - enumeration *)
type dbuserror = [
  (** A generic error; "something went wrong" - see the error message for
more. *)
  | `FAILED
  (** There was not enough memory to complete an operation. *)
  | `NO_MEMORY
  (** The bus doesn't know how to launch a service to supply the bus name
you wanted. *)
  | `SERVICE_UNKNOWN
  (** The bus name you referenced doesn't exist (i.e. no application owns
it). *)
  | `NAME_HAS_NO_OWNER
  (** No reply to a message expecting one, usually means a timeout occurred. *)
  | `NO_REPLY
  (** Something went wrong reading or writing to a socket, for example. *)
  | `IO_ERROR
  (** A D-Bus bus address was malformed. *)
  | `BAD_ADDRESS
  (** Requested operation isn't supported (like ENOSYS on UNIX). *)
  | `NOT_SUPPORTED
  (** Some limited resource is exhausted. *)
  | `LIMITS_EXCEEDED
  (** Security restrictions don't allow doing what you're trying to do. *)
  | `ACCESS_DENIED
  (** Authentication didn't work. *)
  | `AUTH_FAILED
  (** Unable to connect to server (probably caused by ECONNREFUSED on a
socket). *)
  | `NO_SERVER
  (** Certain timeout errors, possibly ETIMEDOUT on a socket.  Note that
%G_DBUS_ERROR_NO_REPLY is used for message reply timeouts. Warning:
this is confusingly-named given that %G_DBUS_ERROR_TIMED_OUT also
exists. We can't fix it for compatibility reasons so just be
careful. *)
  | `TIMEOUT
  (** No network access (probably ENETUNREACH on a socket). *)
  | `NO_NETWORK
  (** Can't bind a socket since its address is in use (i.e. EADDRINUSE). *)
  | `ADDRESS_IN_USE
  (** The connection is disconnected and you're trying to use it. *)
  | `DISCONNECTED
  (** Invalid arguments passed to a method call. *)
  | `INVALID_ARGS
  (** Missing file. *)
  | `FILE_NOT_FOUND
  (** Existing file and the operation you're using does not silently overwrite. *)
  | `FILE_EXISTS
  (** Method name you invoked isn't known by the object you invoked it on. *)
  | `UNKNOWN_METHOD
  (** Certain timeout errors, e.g. while starting a service. Warning: this is
confusingly-named given that %G_DBUS_ERROR_TIMEOUT also exists. We
can't fix it for compatibility reasons so just be careful. *)
  | `TIMED_OUT
  (** Tried to remove or modify a match rule that didn't exist. *)
  | `MATCH_RULE_NOT_FOUND
  (** The match rule isn't syntactically valid. *)
  | `MATCH_RULE_INVALID
  (** While starting a new process, the exec() call failed. *)
  | `SPAWN_EXEC_FAILED
  (** While starting a new process, the fork() call failed. *)
  | `SPAWN_FORK_FAILED
  (** While starting a new process, the child exited with a status code. *)
  | `SPAWN_CHILD_EXITED
  (** While starting a new process, the child exited on a signal. *)
  | `SPAWN_CHILD_SIGNALED
  (** While starting a new process, something went wrong. *)
  | `SPAWN_FAILED
  (** We failed to setup the environment correctly. *)
  | `SPAWN_SETUP_FAILED
  (** We failed to setup the config parser correctly. *)
  | `SPAWN_CONFIG_INVALID
  (** Bus name was not valid. *)
  | `SPAWN_SERVICE_INVALID
  (** Service file not found in system-services directory. *)
  | `SPAWN_SERVICE_NOT_FOUND
  (** Permissions are incorrect on the setuid helper. *)
  | `SPAWN_PERMISSIONS_INVALID
  (** Service file invalid (Name, User or Exec missing). *)
  | `SPAWN_FILE_INVALID
  (** Tried to get a UNIX process ID and it wasn't available. *)
  | `SPAWN_NO_MEMORY
  (** Tried to get a UNIX process ID and it wasn't available. *)
  | `UNIX_PROCESS_ID_UNKNOWN
  (** A type signature is not valid. *)
  | `INVALID_SIGNATURE
  (** A file contains invalid syntax or is otherwise broken. *)
  | `INVALID_FILE_CONTENT
  (** Asked for SELinux security context and it wasn't available. *)
  | `SELINUX_SECURITY_CONTEXT_UNKNOWN
  (** Asked for ADT audit data and it wasn't available. *)
  | `ADT_AUDIT_DATA_UNKNOWN
  (** There's already an object with the requested object path. *)
  | `OBJECT_PATH_IN_USE
  (** Object you invoked a method on isn't known. Since 2.42 *)
  | `UNKNOWN_OBJECT
  (** Interface you invoked a method on isn't known by the object. Since 2.42 *)
  | `UNKNOWN_INTERFACE
  (** Property you tried to access isn't known by the object. Since 2.42 *)
  | `UNKNOWN_PROPERTY
  (** Property you tried to set is read-only. Since 2.42 *)
  | `PROPERTY_READ_ONLY
]

val dbuserror_of_int : int -> dbuserror
val dbuserror_to_int : dbuserror -> int

(* DBusMessageByteOrder - enumeration *)
type dbusmessagebyteorder = [
  (** The byte order is big endian. *)
  | `BIG_ENDIAN
  (** The byte order is little endian. *)
  | `LITTLE_ENDIAN
]

val dbusmessagebyteorder_of_int : int -> dbusmessagebyteorder
val dbusmessagebyteorder_to_int : dbusmessagebyteorder -> int

(* DBusMessageHeaderField - enumeration *)
type dbusmessageheaderfield = [
  (** Not a valid header field. *)
  | `INVALID
  (** The object path. *)
  | `PATH
  (** The interface name. *)
  | `INTERFACE
  (** The method or signal name. *)
  | `MEMBER
  (** The name of the error that occurred. *)
  | `ERROR_NAME
  (** The serial number the message is a reply to. *)
  | `REPLY_SERIAL
  (** The name the message is intended for. *)
  | `DESTINATION
  (** Unique name of the sender of the message (filled in by the bus). *)
  | `SENDER
  (** The signature of the message body. *)
  | `SIGNATURE
  (** The number of UNIX file descriptors that accompany the message. *)
  | `NUM_UNIX_FDS
]

val dbusmessageheaderfield_of_int : int -> dbusmessageheaderfield
val dbusmessageheaderfield_to_int : dbusmessageheaderfield -> int

(* DBusMessageType - enumeration *)
type dbusmessagetype = [
  (** Message is of invalid type. *)
  | `INVALID
  (** Method call. *)
  | `METHOD_CALL
  (** Method reply. *)
  | `METHOD_RETURN
  (** Error reply. *)
  | `ERROR
  (** Signal emission. *)
  | `SIGNAL
]

val dbusmessagetype_of_int : int -> dbusmessagetype
val dbusmessagetype_to_int : dbusmessagetype -> int

(* DataStreamByteOrder - enumeration *)
type datastreambyteorder = [
  (** Selects Big Endian byte order. *)
  | `BIG_ENDIAN
  (** Selects Little Endian byte order. *)
  | `LITTLE_ENDIAN
  (** Selects endianness based on host machine's architecture. *)
  | `HOST_ENDIAN
]

val datastreambyteorder_of_int : int -> datastreambyteorder
val datastreambyteorder_to_int : datastreambyteorder -> int

(* DataStreamNewlineType - enumeration *)
type datastreamnewlinetype = [
  (** Selects "LF" line endings, common on most modern UNIX platforms. *)
  | `LF
  (** Selects "CR" line endings. *)
  | `CR
  (** Selects "CR, LF" line ending, common on Microsoft Windows. *)
  | `CR_LF
  (** Automatically try to handle any line ending type. *)
  | `ANY
]

val datastreamnewlinetype_of_int : int -> datastreamnewlinetype
val datastreamnewlinetype_to_int : datastreamnewlinetype -> int

(* DriveStartStopType - enumeration *)
type drivestartstoptype = [
  (** Unknown or drive doesn't support
   start/stop. *)
  | `UNKNOWN
  (** The stop method will physically
   shut down the drive and e.g. power down the port the drive is
   attached to. *)
  | `SHUTDOWN
  (** The start/stop methods are used
   for connecting/disconnect to the drive over the network. *)
  | `NETWORK
  (** The start/stop methods will
   assemble/disassemble a virtual drive from several physical
   drives. *)
  | `MULTIDISK
  (** The start/stop methods will
   unlock/lock the disk (for example using the ATA <quote>SECURITY
   UNLOCK DEVICE</quote> command) *)
  | `PASSWORD
]

val drivestartstoptype_of_int : int -> drivestartstoptype
val drivestartstoptype_to_int : drivestartstoptype -> int

(* EmblemOrigin - enumeration *)
type emblemorigin = [
  (** Emblem of unknown origin *)
  | `UNKNOWN
  (** Emblem adds device-specific information *)
  | `DEVICE
  (** Emblem depicts live metadata, such as "readonly" *)
  | `LIVEMETADATA
  (** Emblem comes from a user-defined tag, e.g. set by nautilus (in the future) *)
  | `TAG
]

val emblemorigin_of_int : int -> emblemorigin
val emblemorigin_to_int : emblemorigin -> int

(* FileAttributeStatus - enumeration *)
type fileattributestatus = [
  (** Attribute value is unset (empty). *)
  | `UNSET
  (** Attribute value is set. *)
  | `SET
  (** Indicates an error in setting the value. *)
  | `ERROR_SETTING
]

val fileattributestatus_of_int : int -> fileattributestatus
val fileattributestatus_to_int : fileattributestatus -> int

(* FileAttributeType - enumeration *)
type fileattributetype = [
  (** indicates an invalid or uninitialized type. *)
  | `INVALID
  (** a null terminated UTF8 string. *)
  | `STRING
  (** a zero terminated string of non-zero bytes. *)
  | `BYTE_STRING
  (** a boolean value. *)
  | `BOOLEAN
  (** an unsigned 4-byte/32-bit integer. *)
  | `UINT32
  (** a signed 4-byte/32-bit integer. *)
  | `INT32
  (** an unsigned 8-byte/64-bit integer. *)
  | `UINT64
  (** a signed 8-byte/64-bit integer. *)
  | `INT64
  (** a #GObject. *)
  | `OBJECT
  (** a %NULL terminated char **. Since 2.22 *)
  | `STRINGV
]

val fileattributetype_of_int : int -> fileattributetype
val fileattributetype_to_int : fileattributetype -> int

(* FileMonitorEvent - enumeration *)
type filemonitorevent = [
  (** a file changed. *)
  | `CHANGED
  (** a hint that this was probably the last change in a set of changes. *)
  | `CHANGES_DONE_HINT
  (** a file was deleted. *)
  | `DELETED
  (** a file was created. *)
  | `CREATED
  (** a file attribute was changed. *)
  | `ATTRIBUTE_CHANGED
  (** the file location will soon be unmounted. *)
  | `PRE_UNMOUNT
  (** the file location was unmounted. *)
  | `UNMOUNTED
  (** the file was moved -- only sent if the
  (deprecated) %G_FILE_MONITOR_SEND_MOVED flag is set *)
  | `MOVED
  (** the file was renamed within the
  current directory -- only sent if the %G_FILE_MONITOR_WATCH_MOVES
  flag is set.  Since: 2.46. *)
  | `RENAMED
  (** the file was moved into the
  monitored directory from another location -- only sent if the
  %G_FILE_MONITOR_WATCH_MOVES flag is set.  Since: 2.46. *)
  | `MOVED_IN
  (** the file was moved out of the
  monitored directory to another location -- only sent if the
  %G_FILE_MONITOR_WATCH_MOVES flag is set.  Since: 2.46 *)
  | `MOVED_OUT
]

val filemonitorevent_of_int : int -> filemonitorevent
val filemonitorevent_to_int : filemonitorevent -> int

(* FileType - enumeration *)
type filetype = [
  (** File's type is unknown. *)
  | `UNKNOWN
  (** File handle represents a regular file. *)
  | `REGULAR
  (** File handle represents a directory. *)
  | `DIRECTORY
  (** File handle represents a symbolic link
   (Unix systems). *)
  | `SYMBOLIC_LINK
  (** File is a "special" file, such as a socket, fifo,
   block device, or character device. *)
  | `SPECIAL
  (** File is a shortcut (Windows systems). *)
  | `SHORTCUT
  (** File is a mountable location. *)
  | `MOUNTABLE
]

val filetype_of_int : int -> filetype
val filetype_to_int : filetype -> int

(* FilesystemPreviewType - enumeration *)
type filesystempreviewtype = [
  (** Only preview files if user has explicitly requested it. *)
  | `IF_ALWAYS
  (** Preview files if user has requested preview of "local" files. *)
  | `IF_LOCAL
  (** Never preview files. *)
  | `NEVER
]

val filesystempreviewtype_of_int : int -> filesystempreviewtype
val filesystempreviewtype_to_int : filesystempreviewtype -> int

(* IOErrorEnum - enumeration *)
type ioerrorenum = [
  (** Generic error condition for when an operation fails
    and no more specific #GIOErrorEnum value is defined. *)
  | `FAILED
  (** File not found. *)
  | `NOT_FOUND
  (** File already exists. *)
  | `EXISTS
  (** File is a directory. *)
  | `IS_DIRECTORY
  (** File is not a directory. *)
  | `NOT_DIRECTORY
  (** File is a directory that isn't empty. *)
  | `NOT_EMPTY
  (** File is not a regular file. *)
  | `NOT_REGULAR_FILE
  (** File is not a symbolic link. *)
  | `NOT_SYMBOLIC_LINK
  (** File cannot be mounted. *)
  | `NOT_MOUNTABLE_FILE
  (** Filename is too many characters. *)
  | `FILENAME_TOO_LONG
  (** Filename is invalid or contains invalid characters. *)
  | `INVALID_FILENAME
  (** File contains too many symbolic links. *)
  | `TOO_MANY_LINKS
  (** No space left on drive. *)
  | `NO_SPACE
  (** Invalid argument. *)
  | `INVALID_ARGUMENT
  (** Permission denied. *)
  | `PERMISSION_DENIED
  (** Operation (or one of its parameters) not supported *)
  | `NOT_SUPPORTED
  (** File isn't mounted. *)
  | `NOT_MOUNTED
  (** File is already mounted. *)
  | `ALREADY_MOUNTED
  (** File was closed. *)
  | `CLOSED
  (** Operation was cancelled. See #GCancellable. *)
  | `CANCELLED
  (** Operations are still pending. *)
  | `PENDING
  (** File is read only. *)
  | `READ_ONLY
  (** Backup couldn't be created. *)
  | `CANT_CREATE_BACKUP
  (** File's Entity Tag was incorrect. *)
  | `WRONG_ETAG
  (** Operation timed out. *)
  | `TIMED_OUT
  (** Operation would be recursive. *)
  | `WOULD_RECURSE
  (** File is busy. *)
  | `BUSY
  (** Operation would block. *)
  | `WOULD_BLOCK
  (** Host couldn't be found (remote operations). *)
  | `HOST_NOT_FOUND
  (** Operation would merge files. *)
  | `WOULD_MERGE
  (** Operation failed and a helper program has
    already interacted with the user. Do not display any error dialog. *)
  | `FAILED_HANDLED
  (** The current process has too many files
    open and can't open any more. Duplicate descriptors do count toward
    this limit. Since 2.20 *)
  | `TOO_MANY_OPEN_FILES
  (** The object has not been initialized. Since 2.22 *)
  | `NOT_INITIALIZED
  (** The requested address is already in use. Since 2.22 *)
  | `ADDRESS_IN_USE
  (** Need more input to finish operation. Since 2.24 *)
  | `PARTIAL_INPUT
  (** The input data was invalid. Since 2.24 *)
  | `INVALID_DATA
  (** A remote object generated an error that
    doesn't correspond to a locally registered #GError error
    domain. Use g_dbus_error_get_remote_error() to extract the D-Bus
    error name and g_dbus_error_strip_remote_error() to fix up the
    message so it matches what was received on the wire. Since 2.26. *)
  | `DBUS_ERROR
  (** Host unreachable. Since 2.26 *)
  | `HOST_UNREACHABLE
  (** Network unreachable. Since 2.26 *)
  | `NETWORK_UNREACHABLE
  (** Connection refused. Since 2.26 *)
  | `CONNECTION_REFUSED
  (** Connection to proxy server failed. Since 2.26 *)
  | `PROXY_FAILED
  (** Proxy authentication failed. Since 2.26 *)
  | `PROXY_AUTH_FAILED
  (** Proxy server needs authentication. Since 2.26 *)
  | `PROXY_NEED_AUTH
  (** Proxy connection is not allowed by ruleset.
    Since 2.26 *)
  | `PROXY_NOT_ALLOWED
  (** Broken pipe. Since 2.36 *)
  | `BROKEN_PIPE
  (** Connection closed by peer. Note that this
    is the same code as %G_IO_ERROR_BROKEN_PIPE; before 2.44 some
    "connection closed" errors returned %G_IO_ERROR_BROKEN_PIPE, but others
    returned %G_IO_ERROR_FAILED. Now they should all return the same
    value, which has this more logical name. Since 2.44. *)
  | `CONNECTION_CLOSED
  (** Transport endpoint is not connected. Since 2.44 *)
  | `NOT_CONNECTED
  (** Message too large. Since 2.48. *)
  | `MESSAGE_TOO_LARGE
  (** No such device found. Since 2.74 *)
  | `NO_SUCH_DEVICE
  (** Destination address unset. Since 2.80 *)
  | `DESTINATION_UNSET
]

val ioerrorenum_of_int : int -> ioerrorenum
val ioerrorenum_to_int : ioerrorenum -> int

(* IOModuleScopeFlags - enumeration *)
type iomodulescopeflags = [
  (** No module scan flags *)
  | `NONE
  (** When using this scope to load or
    scan modules, automatically block a modules which has the same base
    basename as previously loaded module. *)
  | `BLOCK_DUPLICATES
]

val iomodulescopeflags_of_int : int -> iomodulescopeflags
val iomodulescopeflags_to_int : iomodulescopeflags -> int

(* MemoryMonitorWarningLevel - enumeration *)
type memorymonitorwarninglevel = [
  (** Memory on the device is low, processes
  should free up unneeded resources (for example, in-memory caches) so they can
  be used elsewhere. *)
  | `LOW
  (** Same as @G_MEMORY_MONITOR_WARNING_LEVEL_LOW
  but the device has even less free memory, so processes should try harder to free
  up unneeded resources. If your process does not need to stay running, it is a
  good time for it to quit. *)
  | `MEDIUM
  (** The system will soon start terminating
  processes to reclaim memory, including background processes. *)
  | `CRITICAL
]

val memorymonitorwarninglevel_of_int : int -> memorymonitorwarninglevel
val memorymonitorwarninglevel_to_int : memorymonitorwarninglevel -> int

(* MountOperationResult - enumeration *)
type mountoperationresult = [
  (** The request was fulfilled and the
    user specified data is now available *)
  | `HANDLED
  (** The user requested the mount operation
    to be aborted *)
  | `ABORTED
  (** The request was unhandled (i.e. not
    implemented) *)
  | `UNHANDLED
]

val mountoperationresult_of_int : int -> mountoperationresult
val mountoperationresult_to_int : mountoperationresult -> int

(* NetworkConnectivity - enumeration *)
type networkconnectivity = [
  (** The host is not configured with a
  route to the Internet; it may or may not be connected to a local
  network. *)
  | `LOCAL
  (** The host is connected to a network, but
  does not appear to be able to reach the full Internet, perhaps
  due to upstream network problems. *)
  | `LIMITED
  (** The host is behind a captive portal and
  cannot reach the full Internet. *)
  | `PORTAL
  (** The host is connected to a network, and
  appears to be able to reach the full Internet. *)
  | `FULL
]

val networkconnectivity_of_int : int -> networkconnectivity
val networkconnectivity_to_int : networkconnectivity -> int

(* NotificationPriority - enumeration *)
type notificationpriority = [
  (** the default priority, to be used for the
  majority of notifications (for example email messages, software updates,
  completed download/sync operations) *)
  | `NORMAL
  (** for notifications that do not require
  immediate attention - typically used for contextual background
  information, such as contact birthdays or local weather *)
  | `LOW
  (** for events that require more attention,
  usually because responses are time-sensitive (for example chat and SMS
  messages or alarms) *)
  | `HIGH
  (** for urgent notifications, or notifications
  that require a response in a short space of time (for example phone calls
  or emergency warnings) *)
  | `URGENT
]

val notificationpriority_of_int : int -> notificationpriority
val notificationpriority_to_int : notificationpriority -> int

(* PasswordSave - enumeration *)
type passwordsave = [
  (** never save a password. *)
  | `NEVER
  (** save a password for the session. *)
  | `FOR_SESSION
  (** save a password permanently. *)
  | `PERMANENTLY
]

val passwordsave_of_int : int -> passwordsave
val passwordsave_to_int : passwordsave -> int

(* PollableReturn - enumeration *)
type pollablereturn = [
  (** Generic error condition for when an operation fails. *)
  | `FAILED
  (** The operation was successfully finished. *)
  | `OK
  (** The operation would block. *)
  | `WOULD_BLOCK
]

val pollablereturn_of_int : int -> pollablereturn
val pollablereturn_to_int : pollablereturn -> int

(* ResolverError - enumeration *)
type resolvererror = [
  (** the requested name/address/service was not
    found *)
  | `NOT_FOUND
  (** the requested information could not
    be looked up due to a network error or similar problem *)
  | `TEMPORARY_FAILURE
  (** unknown error *)
  | `INTERNAL
]

val resolvererror_of_int : int -> resolvererror
val resolvererror_to_int : resolvererror -> int

(* ResolverRecordType - enumeration *)
type resolverrecordtype = [
  (** look up DNS SRV records for a domain *)
  | `SRV
  (** look up DNS MX records for a domain *)
  | `MX
  (** look up DNS TXT records for a name *)
  | `TXT
  (** look up DNS SOA records for a zone *)
  | `SOA
  (** look up DNS NS records for a domain *)
  | `NS
]

val resolverrecordtype_of_int : int -> resolverrecordtype
val resolverrecordtype_to_int : resolverrecordtype -> int

(* ResourceError - enumeration *)
type resourceerror = [
  (** no file was found at the requested path *)
  | `NOT_FOUND
  (** unknown error *)
  | `INTERNAL
]

val resourceerror_of_int : int -> resourceerror
val resourceerror_to_int : resourceerror -> int

(* SocketClientEvent - enumeration *)
type socketclientevent = [
  (** The client is doing a DNS lookup. *)
  | `RESOLVING
  (** The client has completed a DNS lookup. *)
  | `RESOLVED
  (** The client is connecting to a remote
  host (either a proxy or the destination server). *)
  | `CONNECTING
  (** The client has connected to a remote
  host. *)
  | `CONNECTED
  (** The client is negotiating
  with a proxy to connect to the destination server. *)
  | `PROXY_NEGOTIATING
  (** The client has negotiated
  with the proxy server. *)
  | `PROXY_NEGOTIATED
  (** The client is performing a
  TLS handshake. *)
  | `TLS_HANDSHAKING
  (** The client has performed a
  TLS handshake. *)
  | `TLS_HANDSHAKED
  (** The client is done with a particular
  #GSocketConnectable. *)
  | `COMPLETE
]

val socketclientevent_of_int : int -> socketclientevent
val socketclientevent_to_int : socketclientevent -> int

(* SocketFamily - enumeration *)
type socketfamily = [
  (** no address family *)
  | `INVALID
  (** the UNIX domain family *)
  | `UNIX
  (** the IPv4 family *)
  | `IPV4
  (** the IPv6 family *)
  | `IPV6
]

val socketfamily_of_int : int -> socketfamily
val socketfamily_to_int : socketfamily -> int

(* SocketListenerEvent - enumeration *)
type socketlistenerevent = [
  (** The listener is about to bind a socket. *)
  | `BINDING
  (** The listener has bound a socket. *)
  | `BOUND
  (** The listener is about to start
   listening on this socket. *)
  | `LISTENING
  (** The listener is now listening on
  this socket. *)
  | `LISTENED
]

val socketlistenerevent_of_int : int -> socketlistenerevent
val socketlistenerevent_to_int : socketlistenerevent -> int

(* SocketProtocol - enumeration *)
type socketprotocol = [
  (** The protocol type is unknown *)
  | `UNKNOWN
  (** The default protocol for the family/type *)
  | `DEFAULT
  (** TCP over IP *)
  | `TCP
  (** UDP over IP *)
  | `UDP
  (** SCTP over IP *)
  | `SCTP
]

val socketprotocol_of_int : int -> socketprotocol
val socketprotocol_to_int : socketprotocol -> int

(* SocketType - enumeration *)
type sockettype = [
  (** Type unknown or wrong *)
  | `INVALID
  (** Reliable connection-based byte streams (e.g. TCP). *)
  | `STREAM
  (** Connectionless, unreliable datagram passing.
    (e.g. UDP) *)
  | `DATAGRAM
  (** Reliable connection-based passing of datagrams
    of fixed maximum length (e.g. SCTP). *)
  | `SEQPACKET
]

val sockettype_of_int : int -> sockettype
val sockettype_to_int : sockettype -> int

(* TlsAuthenticationMode - enumeration *)
type tlsauthenticationmode = [
  (** client authentication not required *)
  | `NONE
  (** client authentication is requested *)
  | `REQUESTED
  (** client authentication is required *)
  | `REQUIRED
]

val tlsauthenticationmode_of_int : int -> tlsauthenticationmode
val tlsauthenticationmode_to_int : tlsauthenticationmode -> int

(* TlsCertificateRequestFlags - enumeration *)
type tlscertificaterequestflags = [
  (** No flags *)
  | `NONE
]

val tlscertificaterequestflags_of_int : int -> tlscertificaterequestflags
val tlscertificaterequestflags_to_int : tlscertificaterequestflags -> int

(* TlsChannelBindingError - enumeration *)
type tlschannelbindingerror = [
  (** Either entire binding
   retrieval facility or specific binding type is not implemented in the
   TLS backend. *)
  | `NOT_IMPLEMENTED
  (** The handshake is not yet
   complete on the connection which is a strong requirement for any existing
   binding type. *)
  | `INVALID_STATE
  (** Handshake is complete but
   binding data is not available. That normally indicates the TLS
   implementation failed to provide the binding data. For example, some
   implementations do not provide a peer certificate for resumed connections. *)
  | `NOT_AVAILABLE
  (** Binding type is not supported
   on the current connection. This error could be triggered when requesting
   `tls-server-end-point` binding data for a certificate which has no hash
   function or uses multiple hash functions. *)
  | `NOT_SUPPORTED
  (** Any other backend error
   preventing binding data retrieval. *)
  | `GENERAL_ERROR
]

val tlschannelbindingerror_of_int : int -> tlschannelbindingerror
val tlschannelbindingerror_to_int : tlschannelbindingerror -> int

(* TlsChannelBindingType - enumeration *)
type tlschannelbindingtype = [
  (** [`tls-unique`](https://tools.ietf.org/html/rfc5929#section-3) binding
   type *)
  | `UNIQUE
  (** [`tls-server-end-point`](https://tools.ietf.org/html/rfc5929#section-4)
   binding type *)
  | `SERVER_END_POINT
  (** [`tls-exporter`](https://www.rfc-editor.org/rfc/rfc9266.html) binding
   type. Since: 2.74 *)
  | `EXPORTER
]

val tlschannelbindingtype_of_int : int -> tlschannelbindingtype
val tlschannelbindingtype_to_int : tlschannelbindingtype -> int

(* TlsDatabaseLookupFlags - enumeration *)
type tlsdatabaselookupflags = [
  (** No lookup flags *)
  | `NONE
  (** Restrict lookup to certificates that have
    a private key. *)
  | `KEYPAIR
]

val tlsdatabaselookupflags_of_int : int -> tlsdatabaselookupflags
val tlsdatabaselookupflags_to_int : tlsdatabaselookupflags -> int

(* TlsError - enumeration *)
type tlserror = [
  (** No TLS provider is available *)
  | `UNAVAILABLE
  (** Miscellaneous TLS error *)
  | `MISC
  (** The certificate presented could not
  be parsed or failed validation. *)
  | `BAD_CERTIFICATE
  (** The TLS handshake failed because the
  peer does not seem to be a TLS server. *)
  | `NOT_TLS
  (** The TLS handshake failed because the
  peer's certificate was not acceptable. *)
  | `HANDSHAKE
  (** The TLS handshake failed because
  the server requested a client-side certificate, but none was
  provided. See g_tls_connection_set_certificate(). *)
  | `CERTIFICATE_REQUIRED
  (** The TLS connection was closed without proper
  notice, which may indicate an attack. See
  g_tls_connection_set_require_close_notify(). *)
  | `EOF
  (** The TLS handshake failed
  because the client sent the fallback SCSV, indicating a protocol
  downgrade attack. Since: 2.60 *)
  | `INAPPROPRIATE_FALLBACK
  (** The certificate failed
  to load because a password was incorrect. Since: 2.72 *)
  | `BAD_CERTIFICATE_PASSWORD
]

val tlserror_of_int : int -> tlserror
val tlserror_to_int : tlserror -> int

(* TlsInteractionResult - enumeration *)
type tlsinteractionresult = [
  (** The interaction was unhandled (i.e. not
    implemented). *)
  | `UNHANDLED
  (** The interaction completed, and resulting data
    is available. *)
  | `HANDLED
  (** The interaction has failed, or was cancelled.
    and the operation should be aborted. *)
  | `FAILED
]

val tlsinteractionresult_of_int : int -> tlsinteractionresult
val tlsinteractionresult_to_int : tlsinteractionresult -> int

(* TlsProtocolVersion - enumeration *)
type tlsprotocolversion = [
  (** No protocol version or unknown protocol version *)
  | `UNKNOWN
  (** SSL 3.0, which is insecure and should not be used *)
  | `SSL_3_0
  (** TLS 1.0, which is insecure and should not be used *)
  | `TLS_1_0
  (** TLS 1.1, which is insecure and should not be used *)
  | `TLS_1_1
  (** TLS 1.2, defined by [RFC 5246](https://datatracker.ietf.org/doc/html/rfc5246) *)
  | `TLS_1_2
  (** TLS 1.3, defined by [RFC 8446](https://datatracker.ietf.org/doc/html/rfc8446) *)
  | `TLS_1_3
  (** DTLS 1.0, which is insecure and should not be used *)
  | `DTLS_1_0
  (** DTLS 1.2, defined by [RFC 6347](https://datatracker.ietf.org/doc/html/rfc6347) *)
  | `DTLS_1_2
]

val tlsprotocolversion_of_int : int -> tlsprotocolversion
val tlsprotocolversion_to_int : tlsprotocolversion -> int

(* TlsRehandshakeMode - enumeration *)
type tlsrehandshakemode = [
  (** Never allow rehandshaking *)
  | `NEVER
  (** Allow safe rehandshaking only *)
  | `SAFELY
  (** Allow unsafe rehandshaking *)
  | `UNSAFELY
]

val tlsrehandshakemode_of_int : int -> tlsrehandshakemode
val tlsrehandshakemode_to_int : tlsrehandshakemode -> int

(* UnixSocketAddressType - enumeration *)
type unixsocketaddresstype = [
  (** invalid *)
  | `INVALID
  (** anonymous *)
  | `ANONYMOUS
  (** a filesystem path *)
  | `PATH
  (** an abstract name *)
  | `ABSTRACT
  (** an abstract name, 0-padded
  to the full length of a unix socket name *)
  | `ABSTRACT_PADDED
]

val unixsocketaddresstype_of_int : int -> unixsocketaddresstype
val unixsocketaddresstype_to_int : unixsocketaddresstype -> int

(* ZlibCompressorFormat - enumeration *)
type zlibcompressorformat = [
  (** deflate compression with zlib header *)
  | `ZLIB
  (** gzip file format *)
  | `GZIP
  (** deflate compression with no header *)
  | `RAW
]

val zlibcompressorformat_of_int : int -> zlibcompressorformat
val zlibcompressorformat_to_int : zlibcompressorformat -> int

(* AppInfoCreateFlags - bitfield/flags *)
type appinfocreateflags_flag = [
  (** No flags. *)
  | `NONE
  (** Application opens in a terminal window. *)
  | `NEEDS_TERMINAL
  (** Application supports URI arguments. *)
  | `SUPPORTS_URIS
  (** Application supports startup notification. Since 2.26 *)
  | `SUPPORTS_STARTUP_NOTIFICATION
]

type appinfocreateflags = appinfocreateflags_flag list

val appinfocreateflags_of_int : int -> appinfocreateflags
val appinfocreateflags_to_int : appinfocreateflags -> int

(* ApplicationFlags - bitfield/flags *)
type applicationflags_flag = [
  (** Default. Deprecated in 2.74, use
  %G_APPLICATION_DEFAULT_FLAGS instead *)
  | `FLAGS_NONE
  (** Default flags. Since: 2.74 *)
  | `DEFAULT_FLAGS
  (** Run as a service. In this mode, registration
     fails if the service is already running, and the application
     will initially wait up to 10 seconds for an initial activation
     message to arrive. *)
  | `IS_SERVICE
  (** Don't try to become the primary instance. *)
  | `IS_LAUNCHER
  (** This application handles opening files (in
    the primary instance). Note that this flag only affects the default
    implementation of local_command_line(), and has no effect if
    %G_APPLICATION_HANDLES_COMMAND_LINE is given.
    See g_application_run() for details. *)
  | `HANDLES_OPEN
  (** This application handles command line
    arguments (in the primary instance). Note that this flag only affect
    the default implementation of local_command_line().
    See g_application_run() for details. *)
  | `HANDLES_COMMAND_LINE
  (** Send the environment of the
    launching process to the primary instance. Set this flag if your
    application is expected to behave differently depending on certain
    environment variables. For instance, an editor might be expected
    to use the `GIT_COMMITTER_NAME` environment variable
    when editing a git commit message. The environment is available
    to the #GApplication::command-line signal handler, via
    g_application_command_line_getenv(). *)
  | `SEND_ENVIRONMENT
  (** Make no attempts to do any of the typical
    single-instance application negotiation, even if the application
    ID is given.  The application neither attempts to become the
    owner of the application ID nor does it check if an existing
    owner already exists.  Everything occurs in the local process.
    Since: 2.30. *)
  | `NON_UNIQUE
  (** Allow users to override the
    application ID from the command line with `--gapplication-app-id`.
    Since: 2.48 *)
  | `CAN_OVERRIDE_APP_ID
  (** Allow another instance to take over
    the bus name. Since: 2.60 *)
  | `ALLOW_REPLACEMENT
  (** Take over from another instance. This flag is
    usually set by passing `--gapplication-replace` on the commandline.
    Since: 2.60 *)
  | `REPLACE
]

type applicationflags = applicationflags_flag list

val applicationflags_of_int : int -> applicationflags
val applicationflags_to_int : applicationflags -> int

(* AskPasswordFlags - bitfield/flags *)
type askpasswordflags_flag = [
  (** operation requires a password. *)
  | `NEED_PASSWORD
  (** operation requires a username. *)
  | `NEED_USERNAME
  (** operation requires a domain. *)
  | `NEED_DOMAIN
  (** operation supports saving settings. *)
  | `SAVING_SUPPORTED
  (** operation supports anonymous users. *)
  | `ANONYMOUS_SUPPORTED
  (** operation takes TCRYPT parameters (Since: 2.58) *)
  | `TCRYPT
]

type askpasswordflags = askpasswordflags_flag list

val askpasswordflags_of_int : int -> askpasswordflags
val askpasswordflags_to_int : askpasswordflags -> int

(* BusNameOwnerFlags - bitfield/flags *)
type busnameownerflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Allow another message bus connection to claim the name. *)
  | `ALLOW_REPLACEMENT
  (** If another message bus connection owns the name and have
specified %G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT, then take the name from the other connection. *)
  | `REPLACE
  (** If another message bus connection owns the name, immediately
return an error from g_bus_own_name() rather than entering the waiting queue for that name. (Since 2.54) *)
  | `DO_NOT_QUEUE
]

type busnameownerflags = busnameownerflags_flag list

val busnameownerflags_of_int : int -> busnameownerflags
val busnameownerflags_to_int : busnameownerflags -> int

(* BusNameWatcherFlags - bitfield/flags *)
type busnamewatcherflags_flag = [
  (** No flags set. *)
  | `NONE
  (** If no-one owns the name when
beginning to watch the name, ask the bus to launch an owner for the
name. *)
  | `AUTO_START
]

type busnamewatcherflags = busnamewatcherflags_flag list

val busnamewatcherflags_of_int : int -> busnamewatcherflags
val busnamewatcherflags_to_int : busnamewatcherflags -> int

(* ConverterFlags - bitfield/flags *)
type converterflags_flag = [
  (** No flags. *)
  | `NONE
  (** At end of input data *)
  | `INPUT_AT_END
  (** Flush data *)
  | `FLUSH
]

type converterflags = converterflags_flag list

val converterflags_of_int : int -> converterflags
val converterflags_to_int : converterflags -> int

(* DBusCallFlags - bitfield/flags *)
type dbuscallflags_flag = [
  (** No flags set. *)
  | `NONE
  (** The bus must not launch
an owner for the destination name in response to this method
invocation. *)
  | `NO_AUTO_START
  (** the caller is prepared to
wait for interactive authorization. Since 2.46. *)
  | `ALLOW_INTERACTIVE_AUTHORIZATION
]

type dbuscallflags = dbuscallflags_flag list

val dbuscallflags_of_int : int -> dbuscallflags
val dbuscallflags_to_int : dbuscallflags -> int

(* DBusCapabilityFlags - bitfield/flags *)
type dbuscapabilityflags_flag = [
  (** No flags set. *)
  | `NONE
  (** The connection
supports exchanging UNIX file descriptors with the remote peer. *)
  | `UNIX_FD_PASSING
]

type dbuscapabilityflags = dbuscapabilityflags_flag list

val dbuscapabilityflags_of_int : int -> dbuscapabilityflags
val dbuscapabilityflags_to_int : dbuscapabilityflags -> int

(* DBusConnectionFlags - bitfield/flags *)
type dbusconnectionflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Perform authentication against server. *)
  | `AUTHENTICATION_CLIENT
  (** Perform authentication against client. *)
  | `AUTHENTICATION_SERVER
  (** When
authenticating as a server, allow the anonymous authentication
method. *)
  | `AUTHENTICATION_ALLOW_ANONYMOUS
  (** Pass this flag if connecting to a peer that is a
message bus. This means that the Hello() method will be invoked as part of the connection setup. *)
  | `MESSAGE_BUS_CONNECTION
  (** If set, processing of D-Bus messages is
delayed until g_dbus_connection_start_message_processing() is called. *)
  | `DELAY_MESSAGE_PROCESSING
  (** When authenticating
as a server, require the UID of the peer to be the same as the UID of the server. (Since: 2.68) *)
  | `AUTHENTICATION_REQUIRE_SAME_USER
  (** When authenticating, try to use
 protocols that work across a Linux user namespace boundary, even if this
 reduces interoperability with older D-Bus implementations. This currently
 affects client-side `EXTERNAL` authentication, for which this flag makes
 connections to a server in another user namespace succeed, but causes
 a deadlock when connecting to a GDBus server older than 2.73.3. Since: 2.74 *)
  | `CROSS_NAMESPACE
]

type dbusconnectionflags = dbusconnectionflags_flag list

val dbusconnectionflags_of_int : int -> dbusconnectionflags
val dbusconnectionflags_to_int : dbusconnectionflags -> int

(* DBusInterfaceSkeletonFlags - bitfield/flags *)
type dbusinterfaceskeletonflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Each method invocation is handled in
  a thread dedicated to the invocation. This means that the method implementation can use blocking IO
  without blocking any other part of the process. It also means that the method implementation must
  use locking to access data structures used by other threads. *)
  | `HANDLE_METHOD_INVOCATIONS_IN_THREAD
]

type dbusinterfaceskeletonflags = dbusinterfaceskeletonflags_flag list

val dbusinterfaceskeletonflags_of_int : int -> dbusinterfaceskeletonflags
val dbusinterfaceskeletonflags_to_int : dbusinterfaceskeletonflags -> int

(* DBusMessageFlags - bitfield/flags *)
type dbusmessageflags_flag = [
  (** No flags set. *)
  | `NONE
  (** A reply is not expected. *)
  | `NO_REPLY_EXPECTED
  (** The bus must not launch an
owner for the destination name in response to this message. *)
  | `NO_AUTO_START
  (** If set on a method
call, this flag means that the caller is prepared to wait for interactive
authorization. Since 2.46. *)
  | `ALLOW_INTERACTIVE_AUTHORIZATION
]

type dbusmessageflags = dbusmessageflags_flag list

val dbusmessageflags_of_int : int -> dbusmessageflags
val dbusmessageflags_to_int : dbusmessageflags -> int

(* DBusObjectManagerClientFlags - bitfield/flags *)
type dbusobjectmanagerclientflags_flag = [
  (** No flags set. *)
  | `NONE
  (** If not set and the
  manager is for a well-known name, then request the bus to launch
  an owner for the name if no-one owns the name. This flag can only
  be used in managers for well-known names. *)
  | `DO_NOT_AUTO_START
]

type dbusobjectmanagerclientflags = dbusobjectmanagerclientflags_flag list

val dbusobjectmanagerclientflags_of_int : int -> dbusobjectmanagerclientflags
val dbusobjectmanagerclientflags_to_int : dbusobjectmanagerclientflags -> int

(* DBusPropertyInfoFlags - bitfield/flags *)
type dbuspropertyinfoflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Property is readable. *)
  | `READABLE
  (** Property is writable. *)
  | `WRITABLE
]

type dbuspropertyinfoflags = dbuspropertyinfoflags_flag list

val dbuspropertyinfoflags_of_int : int -> dbuspropertyinfoflags
val dbuspropertyinfoflags_to_int : dbuspropertyinfoflags -> int

(* DBusProxyFlags - bitfield/flags *)
type dbusproxyflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Don't load properties. *)
  | `DO_NOT_LOAD_PROPERTIES
  (** Don't connect to signals on the remote object. *)
  | `DO_NOT_CONNECT_SIGNALS
  (** If the proxy is for a well-known name,
do not ask the bus to launch an owner during proxy initialization or a method call.
This flag is only meaningful in proxies for well-known names. *)
  | `DO_NOT_AUTO_START
  (** If set, the property value for any __invalidated property__ will be (asynchronously) retrieved upon receiving the [`PropertiesChanged`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-properties) D-Bus signal and the property will not cause emission of the #GDBusProxy::g-properties-changed signal. When the value is received the #GDBusProxy::g-properties-changed signal is emitted for the property along with the retrieved value. Since 2.32. *)
  | `GET_INVALIDATED_PROPERTIES
  (** If the proxy is for a well-known name,
do not ask the bus to launch an owner during proxy initialization, but allow it to be
autostarted by a method call. This flag is only meaningful in proxies for well-known names,
and only if %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START is not also specified. *)
  | `DO_NOT_AUTO_START_AT_CONSTRUCTION
  (** Don't actually send the AddMatch D-Bus
   call for this signal subscription. This gives you more control
   over which match rules you add (but you must add them manually). (Since: 2.72) *)
  | `NO_MATCH_RULE
]

type dbusproxyflags = dbusproxyflags_flag list

val dbusproxyflags_of_int : int -> dbusproxyflags
val dbusproxyflags_to_int : dbusproxyflags -> int

(* DBusSendMessageFlags - bitfield/flags *)
type dbussendmessageflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Do not automatically
assign a serial number from the #GDBusConnection object when
sending a message. *)
  | `PRESERVE_SERIAL
]

type dbussendmessageflags = dbussendmessageflags_flag list

val dbussendmessageflags_of_int : int -> dbussendmessageflags
val dbussendmessageflags_to_int : dbussendmessageflags -> int

(* DBusServerFlags - bitfield/flags *)
type dbusserverflags_flag = [
  (** No flags set. *)
  | `NONE
  (** All #GDBusServer::new-connection
signals will run in separated dedicated threads (see signal for
details). *)
  | `RUN_IN_THREAD
  (** Allow the anonymous
authentication method. *)
  | `AUTHENTICATION_ALLOW_ANONYMOUS
  (** Require the UID of the
peer to be the same as the UID of the server when authenticating. (Since: 2.68) *)
  | `AUTHENTICATION_REQUIRE_SAME_USER
]

type dbusserverflags = dbusserverflags_flag list

val dbusserverflags_of_int : int -> dbusserverflags
val dbusserverflags_to_int : dbusserverflags -> int

(* DBusSignalFlags - bitfield/flags *)
type dbussignalflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Don't actually send the AddMatch
D-Bus call for this signal subscription.  This gives you more control
over which match rules you add (but you must add them manually). *)
  | `NO_MATCH_RULE
  (** Match first arguments that
contain a bus or interface name with the given namespace. *)
  | `MATCH_ARG0_NAMESPACE
  (** Match first arguments that
contain an object path that is either equivalent to the given path,
or one of the paths is a subpath of the other. *)
  | `MATCH_ARG0_PATH
]

type dbussignalflags = dbussignalflags_flag list

val dbussignalflags_of_int : int -> dbussignalflags
val dbussignalflags_to_int : dbussignalflags -> int

(* DBusSubtreeFlags - bitfield/flags *)
type dbussubtreeflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Method calls to objects not in the enumerated range
                                                      will still be dispatched. This is useful if you want
                                                      to dynamically spawn objects in the subtree. *)
  | `DISPATCH_TO_UNENUMERATED_NODES
]

type dbussubtreeflags = dbussubtreeflags_flag list

val dbussubtreeflags_of_int : int -> dbussubtreeflags
val dbussubtreeflags_to_int : dbussubtreeflags -> int

(* DriveStartFlags - bitfield/flags *)
type drivestartflags_flag = [
  (** No flags set. *)
  | `NONE
]

type drivestartflags = drivestartflags_flag list

val drivestartflags_of_int : int -> drivestartflags
val drivestartflags_to_int : drivestartflags -> int

(* FileAttributeInfoFlags - bitfield/flags *)
type fileattributeinfoflags_flag = [
  (** no flags set. *)
  | `NONE
  (** copy the attribute values when the file is copied. *)
  | `COPY_WITH_FILE
  (** copy the attribute values when the file is moved. *)
  | `COPY_WHEN_MOVED
]

type fileattributeinfoflags = fileattributeinfoflags_flag list

val fileattributeinfoflags_of_int : int -> fileattributeinfoflags
val fileattributeinfoflags_to_int : fileattributeinfoflags -> int

(* FileCopyFlags - bitfield/flags *)
type filecopyflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Overwrite any existing files *)
  | `OVERWRITE
  (** Make a backup of any existing files. *)
  | `BACKUP
  (** Don't follow symlinks. *)
  | `NOFOLLOW_SYMLINKS
  (** Copy all file metadata instead of just default set used for copy (see #GFileInfo). *)
  | `ALL_METADATA
  (** Don't use copy and delete fallback if native move not supported. *)
  | `NO_FALLBACK_FOR_MOVE
  (** Leaves target file with default perms, instead of setting the source file perms. *)
  | `TARGET_DEFAULT_PERMS
  (** Use default modification
    timestamps instead of copying them from the source file. Since 2.80 *)
  | `TARGET_DEFAULT_MODIFIED_TIME
]

type filecopyflags = filecopyflags_flag list

val filecopyflags_of_int : int -> filecopyflags
val filecopyflags_to_int : filecopyflags -> int

(* FileCreateFlags - bitfield/flags *)
type filecreateflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Create a file that can only be
   accessed by the current user. *)
  | `PRIVATE
  (** Replace the destination
   as if it didn't exist before. Don't try to keep any old
   permissions, replace instead of following links. This
   is generally useful if you're doing a "copy over"
   rather than a "save new version of" replace operation.
   You can think of it as "unlink destination" before
   writing to it, although the implementation may not
   be exactly like that. This flag can only be used with
   g_file_replace() and its variants, including g_file_replace_contents().
   Since 2.20 *)
  | `REPLACE_DESTINATION
]

type filecreateflags = filecreateflags_flag list

val filecreateflags_of_int : int -> filecreateflags
val filecreateflags_to_int : filecreateflags -> int

(* FileMeasureFlags - bitfield/flags *)
type filemeasureflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Report any error encountered
  while traversing the directory tree.  Normally errors are only
  reported for the toplevel file. *)
  | `REPORT_ANY_ERROR
  (** Tally usage based on apparent file
  sizes.  Normally, the block-size is used, if available, as this is a
  more accurate representation of disk space used.
  Compare with `du --apparent-size`.
  Since GLib 2.78. and similarly to `du` since GNU Coreutils 9.2, this will
  ignore the sizes of file types other than regular files and links, as the
  sizes of other file types are not specified in a standard way. *)
  | `APPARENT_SIZE
  (** Do not cross mount point boundaries.
  Compare with `du -x`. *)
  | `NO_XDEV
]

type filemeasureflags = filemeasureflags_flag list

val filemeasureflags_of_int : int -> filemeasureflags
val filemeasureflags_to_int : filemeasureflags -> int

(* FileMonitorFlags - bitfield/flags *)
type filemonitorflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Watch for mount events. *)
  | `WATCH_MOUNTS
  (** Pair DELETED and CREATED events caused
  by file renames (moves) and send a single G_FILE_MONITOR_EVENT_MOVED
  event instead (NB: not supported on all backends; the default
  behaviour -without specifying this flag- is to send single DELETED
  and CREATED events).  Deprecated since 2.46: use
  %G_FILE_MONITOR_WATCH_MOVES instead. *)
  | `SEND_MOVED
  (** Watch for changes to the file made
  via another hard link. Since 2.36. *)
  | `WATCH_HARD_LINKS
  (** Watch for rename operations on a
  monitored directory.  This causes %G_FILE_MONITOR_EVENT_RENAMED,
  %G_FILE_MONITOR_EVENT_MOVED_IN and %G_FILE_MONITOR_EVENT_MOVED_OUT
  events to be emitted when possible.  Since: 2.46. *)
  | `WATCH_MOVES
]

type filemonitorflags = filemonitorflags_flag list

val filemonitorflags_of_int : int -> filemonitorflags
val filemonitorflags_to_int : filemonitorflags -> int

(* FileQueryInfoFlags - bitfield/flags *)
type filequeryinfoflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Don't follow symlinks. *)
  | `NOFOLLOW_SYMLINKS
]

type filequeryinfoflags = filequeryinfoflags_flag list

val filequeryinfoflags_of_int : int -> filequeryinfoflags
val filequeryinfoflags_to_int : filequeryinfoflags -> int

(* IOStreamSpliceFlags - bitfield/flags *)
type iostreamspliceflags_flag = [
  (** Do not close either stream. *)
  | `NONE
  (** Close the first stream after
    the splice. *)
  | `CLOSE_STREAM1
  (** Close the second stream after
    the splice. *)
  | `CLOSE_STREAM2
  (** Wait for both splice operations to finish
    before calling the callback. *)
  | `WAIT_FOR_BOTH
]

type iostreamspliceflags = iostreamspliceflags_flag list

val iostreamspliceflags_of_int : int -> iostreamspliceflags
val iostreamspliceflags_to_int : iostreamspliceflags -> int

(* MountMountFlags - bitfield/flags *)
type mountmountflags_flag = [
  (** No flags set. *)
  | `NONE
]

type mountmountflags = mountmountflags_flag list

val mountmountflags_of_int : int -> mountmountflags
val mountmountflags_to_int : mountmountflags -> int

(* MountUnmountFlags - bitfield/flags *)
type mountunmountflags_flag = [
  (** No flags set. *)
  | `NONE
  (** Unmount even if there are outstanding
 file operations on the mount. *)
  | `FORCE
]

type mountunmountflags = mountunmountflags_flag list

val mountunmountflags_of_int : int -> mountunmountflags
val mountunmountflags_to_int : mountunmountflags -> int

(* OutputStreamSpliceFlags - bitfield/flags *)
type outputstreamspliceflags_flag = [
  (** Do not close either stream. *)
  | `NONE
  (** Close the source stream after
    the splice. *)
  | `CLOSE_SOURCE
  (** Close the target stream after
    the splice. *)
  | `CLOSE_TARGET
]

type outputstreamspliceflags = outputstreamspliceflags_flag list

val outputstreamspliceflags_of_int : int -> outputstreamspliceflags
val outputstreamspliceflags_to_int : outputstreamspliceflags -> int

(* ResolverNameLookupFlags - bitfield/flags *)
type resolvernamelookupflags_flag = [
  (** default behavior (same as g_resolver_lookup_by_name()) *)
  | `DEFAULT
  (** only resolve ipv4 addresses *)
  | `IPV4_ONLY
  (** only resolve ipv6 addresses *)
  | `IPV6_ONLY
]

type resolvernamelookupflags = resolvernamelookupflags_flag list

val resolvernamelookupflags_of_int : int -> resolvernamelookupflags
val resolvernamelookupflags_to_int : resolvernamelookupflags -> int

(* ResourceFlags - bitfield/flags *)
type resourceflags_flag = [
  (** No flags set. *)
  | `NONE
  (** The file is compressed. *)
  | `COMPRESSED
]

type resourceflags = resourceflags_flag list

val resourceflags_of_int : int -> resourceflags
val resourceflags_to_int : resourceflags -> int

(* ResourceLookupFlags - bitfield/flags *)
type resourcelookupflags_flag = [
  (** No flags set. *)
  | `NONE
]

type resourcelookupflags = resourcelookupflags_flag list

val resourcelookupflags_of_int : int -> resourcelookupflags
val resourcelookupflags_to_int : resourcelookupflags -> int

(* SettingsBindFlags - bitfield/flags *)
type settingsbindflags_flag = [
  (** Equivalent to `G_SETTINGS_BIND_GET|G_SETTINGS_BIND_SET` *)
  | `DEFAULT
  (** Update the #GObject property when the setting changes.
    It is an error to use this flag if the property is not writable. *)
  | `GET
  (** Update the setting when the #GObject property changes.
    It is an error to use this flag if the property is not readable. *)
  | `SET
  (** Do not try to bind a "sensitivity" property to the writability of the setting *)
  | `NO_SENSITIVITY
  (** When set in addition to %G_SETTINGS_BIND_GET, set the #GObject property
    value initially from the setting, but do not listen for changes of the setting *)
  | `GET_NO_CHANGES
  (** When passed to g_settings_bind(), uses a pair of mapping functions that invert
    the boolean value when mapping between the setting and the property.  The setting and property must both
    be booleans.  You cannot pass this flag to g_settings_bind_with_mapping(). *)
  | `INVERT_BOOLEAN
]

type settingsbindflags = settingsbindflags_flag list

val settingsbindflags_of_int : int -> settingsbindflags
val settingsbindflags_to_int : settingsbindflags -> int

(* SocketMsgFlags - bitfield/flags *)
type socketmsgflags_flag = [
  (** No flags. *)
  | `NONE
  (** Request to send/receive out of band data. *)
  | `OOB
  (** Read data from the socket without removing it from
    the queue. *)
  | `PEEK
  (** Don't use a gateway to send out the packet,
    only send to hosts on directly connected networks. *)
  | `DONTROUTE
]

type socketmsgflags = socketmsgflags_flag list

val socketmsgflags_of_int : int -> socketmsgflags
val socketmsgflags_to_int : socketmsgflags -> int

(* SubprocessFlags - bitfield/flags *)
type subprocessflags_flag = [
  (** No flags. *)
  | `NONE
  (** create a pipe for the stdin of the
  spawned process that can be accessed with
  g_subprocess_get_stdin_pipe(). *)
  | `STDIN_PIPE
  (** stdin is inherited from the
  calling process. *)
  | `STDIN_INHERIT
  (** create a pipe for the stdout of the
  spawned process that can be accessed with
  g_subprocess_get_stdout_pipe(). *)
  | `STDOUT_PIPE
  (** silence the stdout of the spawned
  process (ie: redirect to `/dev/null`). *)
  | `STDOUT_SILENCE
  (** create a pipe for the stderr of the
  spawned process that can be accessed with
  g_subprocess_get_stderr_pipe(). *)
  | `STDERR_PIPE
  (** silence the stderr of the spawned
  process (ie: redirect to `/dev/null`). *)
  | `STDERR_SILENCE
  (** merge the stderr of the spawned
  process with whatever the stdout happens to be.  This is a good way
  of directing both streams to a common log file, for example. *)
  | `STDERR_MERGE
  (** spawned processes will inherit the
  file descriptors of their parent, unless those descriptors have
  been explicitly marked as close-on-exec.  This flag has no effect
  over the "standard" file descriptors (stdin, stdout, stderr). *)
  | `INHERIT_FDS
  (** if path searching is
  needed when spawning the subprocess, use the `PATH` in the launcher
  environment. (Since: 2.72) *)
  | `SEARCH_PATH_FROM_ENVP
]

type subprocessflags = subprocessflags_flag list

val subprocessflags_of_int : int -> subprocessflags
val subprocessflags_to_int : subprocessflags -> int

(* TestDBusFlags - bitfield/flags *)
type testdbusflags_flag = [
  (** No flags. *)
  | `NONE
]

type testdbusflags = testdbusflags_flag list

val testdbusflags_of_int : int -> testdbusflags
val testdbusflags_to_int : testdbusflags -> int

(* TlsCertificateFlags - bitfield/flags *)
type tlscertificateflags_flag = [
  (** No flags set. Since: 2.74 *)
  | `NO_FLAGS
  (** The signing certificate authority is
  not known. *)
  | `UNKNOWN_CA
  (** The certificate does not match the
  expected identity of the site that it was retrieved from. *)
  | `BAD_IDENTITY
  (** The certificate's activation time
  is still in the future *)
  | `NOT_ACTIVATED
  (** The certificate has expired *)
  | `EXPIRED
  (** The certificate has been revoked
  according to the #GTlsConnection's certificate revocation list. *)
  | `REVOKED
  (** The certificate's algorithm is
  considered insecure. *)
  | `INSECURE
  (** Some other error occurred validating
  the certificate *)
  | `GENERIC_ERROR
  (** the combination of all of the above
  flags *)
  | `VALIDATE_ALL
]

type tlscertificateflags = tlscertificateflags_flag list

val tlscertificateflags_of_int : int -> tlscertificateflags
val tlscertificateflags_to_int : tlscertificateflags -> int

(* TlsDatabaseVerifyFlags - bitfield/flags *)
type tlsdatabaseverifyflags_flag = [
  (** No verification flags *)
  | `NONE
]

type tlsdatabaseverifyflags = tlsdatabaseverifyflags_flag list

val tlsdatabaseverifyflags_of_int : int -> tlsdatabaseverifyflags
val tlsdatabaseverifyflags_to_int : tlsdatabaseverifyflags -> int

(* TlsPasswordFlags - bitfield/flags *)
type tlspasswordflags_flag = [
  (** No flags *)
  | `NONE
  (** The password was wrong, and the user should retry. *)
  | `RETRY
  (** Hint to the user that the password has been
   wrong many times, and the user may not have many chances left. *)
  | `MANY_TRIES
  (** Hint to the user that this is the last try to get
   this password right. *)
  | `FINAL_TRY
  (** For PKCS #11, the user PIN is required.
   Since: 2.70. *)
  | `PKCS11_USER
  (** For PKCS #11, the security officer
   PIN is required. Since: 2.70. *)
  | `PKCS11_SECURITY_OFFICER
  (** For PKCS #11, the context-specific
   PIN is required. Since: 2.70. *)
  | `PKCS11_CONTEXT_SPECIFIC
]

type tlspasswordflags = tlspasswordflags_flag list

val tlspasswordflags_of_int : int -> tlspasswordflags
val tlspasswordflags_to_int : tlspasswordflags -> int

