// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmailEvent {

 String get name; String get email; String get subject; String get message;
/// Create a copy of EmailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailEventCopyWith<EmailEvent> get copyWith => _$EmailEventCopyWithImpl<EmailEvent>(this as EmailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailEvent&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,subject,message);

@override
String toString() {
  return 'EmailEvent(name: $name, email: $email, subject: $subject, message: $message)';
}


}

/// @nodoc
abstract mixin class $EmailEventCopyWith<$Res>  {
  factory $EmailEventCopyWith(EmailEvent value, $Res Function(EmailEvent) _then) = _$EmailEventCopyWithImpl;
@useResult
$Res call({
 String name, String email, String subject, String message
});




}
/// @nodoc
class _$EmailEventCopyWithImpl<$Res>
    implements $EmailEventCopyWith<$Res> {
  _$EmailEventCopyWithImpl(this._self, this._then);

  final EmailEvent _self;
  final $Res Function(EmailEvent) _then;

/// Create a copy of EmailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? subject = null,Object? message = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailEvent].
extension EmailEventPatterns on EmailEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SendEmail value)?  sendEmail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SendEmail() when sendEmail != null:
return sendEmail(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SendEmail value)  sendEmail,}){
final _that = this;
switch (_that) {
case SendEmail():
return sendEmail(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SendEmail value)?  sendEmail,}){
final _that = this;
switch (_that) {
case SendEmail() when sendEmail != null:
return sendEmail(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  String email,  String subject,  String message)?  sendEmail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SendEmail() when sendEmail != null:
return sendEmail(_that.name,_that.email,_that.subject,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  String email,  String subject,  String message)  sendEmail,}) {final _that = this;
switch (_that) {
case SendEmail():
return sendEmail(_that.name,_that.email,_that.subject,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  String email,  String subject,  String message)?  sendEmail,}) {final _that = this;
switch (_that) {
case SendEmail() when sendEmail != null:
return sendEmail(_that.name,_that.email,_that.subject,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SendEmail implements EmailEvent {
  const SendEmail({required this.name, required this.email, required this.subject, required this.message});
  

@override final  String name;
@override final  String email;
@override final  String subject;
@override final  String message;

/// Create a copy of EmailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendEmailCopyWith<SendEmail> get copyWith => _$SendEmailCopyWithImpl<SendEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendEmail&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,subject,message);

@override
String toString() {
  return 'EmailEvent.sendEmail(name: $name, email: $email, subject: $subject, message: $message)';
}


}

/// @nodoc
abstract mixin class $SendEmailCopyWith<$Res> implements $EmailEventCopyWith<$Res> {
  factory $SendEmailCopyWith(SendEmail value, $Res Function(SendEmail) _then) = _$SendEmailCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String subject, String message
});




}
/// @nodoc
class _$SendEmailCopyWithImpl<$Res>
    implements $SendEmailCopyWith<$Res> {
  _$SendEmailCopyWithImpl(this._self, this._then);

  final SendEmail _self;
  final $Res Function(SendEmail) _then;

/// Create a copy of EmailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? subject = null,Object? message = null,}) {
  return _then(SendEmail(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$EmailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailState()';
}


}

/// @nodoc
class $EmailStateCopyWith<$Res>  {
$EmailStateCopyWith(EmailState _, $Res Function(EmailState) __);
}


/// Adds pattern-matching-related methods to [EmailState].
extension EmailStatePatterns on EmailState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( SendingEmail value)?  sendingEmail,TResult Function( Failure value)?  failure,TResult Function( EmailSentSuccessFully value)?  emailSentSuccessFully,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case SendingEmail() when sendingEmail != null:
return sendingEmail(_that);case Failure() when failure != null:
return failure(_that);case EmailSentSuccessFully() when emailSentSuccessFully != null:
return emailSentSuccessFully(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( SendingEmail value)  sendingEmail,required TResult Function( Failure value)  failure,required TResult Function( EmailSentSuccessFully value)  emailSentSuccessFully,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case SendingEmail():
return sendingEmail(_that);case Failure():
return failure(_that);case EmailSentSuccessFully():
return emailSentSuccessFully(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( SendingEmail value)?  sendingEmail,TResult? Function( Failure value)?  failure,TResult? Function( EmailSentSuccessFully value)?  emailSentSuccessFully,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case SendingEmail() when sendingEmail != null:
return sendingEmail(_that);case Failure() when failure != null:
return failure(_that);case EmailSentSuccessFully() when emailSentSuccessFully != null:
return emailSentSuccessFully(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sendingEmail,TResult Function()?  failure,TResult Function()?  emailSentSuccessFully,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case SendingEmail() when sendingEmail != null:
return sendingEmail();case Failure() when failure != null:
return failure();case EmailSentSuccessFully() when emailSentSuccessFully != null:
return emailSentSuccessFully();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sendingEmail,required TResult Function()  failure,required TResult Function()  emailSentSuccessFully,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case SendingEmail():
return sendingEmail();case Failure():
return failure();case EmailSentSuccessFully():
return emailSentSuccessFully();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sendingEmail,TResult? Function()?  failure,TResult? Function()?  emailSentSuccessFully,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case SendingEmail() when sendingEmail != null:
return sendingEmail();case Failure() when failure != null:
return failure();case EmailSentSuccessFully() when emailSentSuccessFully != null:
return emailSentSuccessFully();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements EmailState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailState.initial()';
}


}




/// @nodoc


class SendingEmail implements EmailState {
  const SendingEmail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendingEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailState.sendingEmail()';
}


}




/// @nodoc


class Failure implements EmailState {
  const Failure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailState.failure()';
}


}




/// @nodoc


class EmailSentSuccessFully implements EmailState {
  const EmailSentSuccessFully();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailSentSuccessFully);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmailState.emailSentSuccessFully()';
}


}




// dart format on
