// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'auth/application/auth_bloc/auth_bloc.dart';
import 'auth/application/sign_in_bloc/signinform_bloc.dart';
import 'auth/core/injection/third_party_injection.dart';
import 'auth/domain/i_auth_facade.dart';
import 'auth/infrastructure/auth_facade_impl.dart';
import 'core/injection_third_party/injection_third_party.dart';
import 'core/network/network_info.dart';
import 'data/repository_impl.dart';
import 'domain/repository/asapdemo_repository.dart';
import 'provider/deliver_cubit/orderstodeliver_cubit.dart';
import 'provider/delivered_cubit/delivered_order_cubit.dart';
import 'provider/get_order.dart';
import 'provider/get_product.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final asapDemoInjectableModule = _$AsapDemoInjectableModule();
  final thirdPartyInjectableModule = _$ThirdPartyInjectableModule();
  gh.lazySingleton<Client>(() => asapDemoInjectableModule.httpClient);
  gh.lazySingleton<DataConnectionChecker>(
      () => asapDemoInjectableModule.dataConnectionChecker);
  gh.lazySingleton<FirebaseAuth>(() => thirdPartyInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseFirestore>(
      () => asapDemoInjectableModule.firebaseAuth);
  gh.lazySingleton<GoogleSignIn>(() => thirdPartyInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(
      () => AuthFacadeImpl(get<FirebaseAuth>(), get<GoogleSignIn>()));
  gh.lazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(get<DataConnectionChecker>()));
  gh.factory<SigninformBloc>(() => SigninformBloc(get<IAuthFacade>()));
  gh.factory<AuthBloc>(() => AuthBloc(get<IAuthFacade>()));
  gh.lazySingleton<IAsapDemoRepository>(() =>
      AsapDemoRepositoryImpl(get<NetworkInfo>(), get<FirebaseFirestore>()));
  gh.factory<OrderstodeliverCubit>(
      () => OrderstodeliverCubit(get<IAsapDemoRepository>()));
  gh.factory<DeliveredOrdersCubit>(
      () => DeliveredOrdersCubit(get<IAsapDemoRepository>()));
  gh.factory<GetOrder>(() => GetOrder(get<IAsapDemoRepository>()));
  gh.factory<GetProduct>(() => GetProduct(get<IAsapDemoRepository>()));
  return get;
}

class _$AsapDemoInjectableModule extends AsapDemoInjectableModule {}

class _$ThirdPartyInjectableModule extends ThirdPartyInjectableModule {}
