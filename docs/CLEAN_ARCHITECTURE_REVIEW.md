# Clean Architecture Review – Feeling Blessed Flutter

This document reviews your `lib/` structure against clean architecture principles. **All suggested improvements have been implemented** (see *Implemented changes* below).

---

## What’s Working Well

### 1. **Feature-based structure**
- **`features/home`** follows a clear 3-layer split: `data/` (repositories, models, mappers), `domain/` (repositories, entities, use_cases), `presentation/` (bloc, page, view, widgets).
- **`features/dashboard`** and **`features/splash`** are scoped by feature.

### 2. **Dependency direction (home feature)**
- Presentation depends on domain (use case, entities).
- Data implements domain repository interface; DTOs map to domain entities.
- Use case depends only on `HomeContract` (abstract), not on the implementation.

### 3. **Shared core**
- **`core/domain`**: `DataState<T>`, `Success`/`Error`, and `UseCase<T,P>` base – domain has no dependency on data layer.
- **`core/config`**: DI, routing, theme, env, constants.
- **`core/data/network`**: `DioClient`, `IRemoteDataSource`; `data_state` re-exports from `core/domain`.

### 4. **DI with GetIt**
- Registration in `AppInitializer`: data sources → contracts → use cases.
- Lazy singletons; `HomeBloc` receives `GetHomeUseCase` via constructor.

---

## Implemented Changes

| # | Improvement | Implementation |
|---|-------------|----------------|
| 1 | **api_constants.dart** | Added `core/config/constants/api_constants.dart` with `baseUrl` (from `AppEnv.apiBaseUrl` with fallback) and `home` path. |
| 2 | **DataState in domain** | `DataState`/`Success`/`Error` moved to `core/domain/data_state.dart`. Domain and use cases depend only on this; `core/data/network/data_state.dart` re-exports it. |
| 3 | **Base use case in domain** | `UseCase<T,P>` (and related) moved to `core/domain/base/base_use_case.dart`. Old path re-exports for compatibility. |
| 4 | **Contract naming** | Abstract `HomeContract` in `domain/contracts/`, implementation `HomeContractImpl` in `data/contract_impl/` (project convention). |
| 5 | **DTOs and pure domain entities** | `data/models/home_response_dto.dart` holds all `fromJson` logic. `data/mappers/home_mapper.dart` maps DTOs → domain entities. Domain entities in `domain/entities/response/home_response.dart` are plain classes (no JSON). |
| 6 | **HomeBloc constructor injection** | `HomeBloc(GetHomeUseCase getHomeUseCase)`; in `main.dart`, `BlocProvider(create: (_) => HomeBloc(sl<GetHomeUseCase>()))`. |
| 7 | **Safe routing** | `core/config/routing/route_extras.dart` defines `HomeRouteArgs`, `GalleryRouteArgs`, `GalleryDetailRouteArgs`. `app_routes.dart` checks `state.extra` type and falls back to empty list or error widget instead of unsafe cast. |
| 8 | **Redundant DioClient init** | Removed duplicate `DioClient().initialize()` from `main.dart`; only the instance registered in DI is initialized. |

---

## Summary Table (current state)

| Area | Status |
|------|--------|
| Feature structure | Good |
| Home data → domain → UI | Good |
| Domain uses DataState | Fixed – lives in `core/domain` |
| Domain entities | Pure – no `fromJson`; DTOs in data layer |
| HomeBloc DataState handling | Fixed – branches on Success/Error |
| HomeBloc DI | Constructor injection |
| api_constants.dart | Added |
| main.dart DioClient init | Single init in DI |
| Routing type safety | Typed args + safe fallbacks |
| Contract naming | HomeContract / HomeContractImpl (convention) |

---

## Optional Next Steps

- **Dashboard / Splash**: When they need API or local data, add a `data/` layer and use cases; keep presentation calling use cases only.
- **Tests**: Unit test `GetHomeUseCase` with a mock `HomeRepository`; test `HomeBloc` with a mock `GetHomeUseCase`.
- **Further domain purity**: If desired, replace `DataState<T>` with `Either<Failure, T>` (e.g. `fpdart`) and define a `Failure` type in domain.
