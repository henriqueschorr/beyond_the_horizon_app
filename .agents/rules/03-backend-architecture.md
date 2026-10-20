# Rulebook 03: Monorepo Architecture & Backend Standards

This document defines mandatory architectural boundaries, naming conventions, validation policies, and security standards for the backend and shared packages.

---

## 1. Architectural Boundary & Package Separation of Concerns

- **Backend-Only External Communication**:
  - Every external communication (such as Supabase database queries, Supabase Storage, email dispatch, Edge Functions, or third-party web APIs) MUST originate strictly and exclusively from the backend package.
  - The frontend package must be strictly limited to frontend concerns: UI presentation, layout composition, user input handling, reactive state management, routing, and local client storage (UserLocalStorageService).
  - Prohibited: Frontend making direct network calls to Supabase, external APIs, or mail services. Frontend interacts with domain data exclusively via BackendService and shared DTOs.

---

## 2. File, Directory & Identifier Naming Conventions

- **Prohibited: Abbreviations in names and identifiers.** Never use cryptic abbreviations in file names, directory paths, variables, parameters, or identifiers (for example: use dependency_injection/ instead of di/, serviceLocator instead of sl, repository instead of repo, controller instead of ctrl). All directory, file, variable, parameter, and symbol names must be fully spelled out and self-documenting.

---

## 3. DTO Naming & Request/Response Explicitness

- **Strict Request/Response Suffixing**:
  - When designing, declaring, or referencing Data Transfer Objects (DTOs), always be completely explicit about whether the object represents a request or a response.
  - Suffix DTO class names and identifiers explicitly with RequestDto or ResponseDto (for example: UserProfileResponseDto instead of UserProfileDto, UpdateProfileRequestDto, DocumentationPageSummaryResponseDto, DocumentationPageDetailResponseDto).
  - Prohibited: Ambiguous, unqualified, or generic DTO names (prohibited: UserProfileDto, PageDto, AuthDto).

---

## 4. Input Validation Architecture & Pure DTO Policy (Validator -> Controller Flow)

- **Pure DTO Policy (No Validation in DTOs)**:
  - Data Transfer Objects (DTOs) in the shared package are strictly pure wire contracts (properties, constructors, toMap, fromMap serialization).
  - Prohibited: validate() methods or UI validation logic inside DTOs. DTOs must NEVER return user-facing error strings, natural language feedback, or localized text.
- **Dedicated Frontend Validators**:
  - All input field and form validations (presence, email RFC format, character lengths, password minimums) MUST be encapsulated in specialized frontend validator classes (for example: AuthValidator).
  - Validators take AppLocalizations as an argument and return localized error strings from l10n.errors.* (or null if valid).
- **Validator -> Controller Flow**:
  - Feature controllers consume these validator objects to validate inputs before submitting requests to backend services.
  - Validators can also be directly reused across frontend UI widgets or form fields to validate individual fields as the user types or unfocuses.
  - Backend domain exceptions use machine-readable error codes (such as invalid_credentials, email_already_exists via AuthException), which the frontend controller maps directly to l10n.errors.* before surfacing error state to UI screens.

---

## 5. Specific Exceptions Policy

- **Exceptions Locations**:
  - All exception definitions in the backend package must reside in a dedicated exceptions directory (for example: backend/lib/exceptions/).
- **Specific Typed Exceptions for Every Subsystem**:
  - Never throw generic StateError, Exception, or raw String instances from repositories, services, or data sources.
  - Every subsystem must define dedicated, strongly-typed machine-readable exceptions (such as AuthException, ProfileException, etc.) implementing the Exception interface.
  - Each specific exception must provide standardized machine-readable error code constants (such as AuthException.invalidCredentials, ProfileException.profileNotFound) and an optional message.
  - Natural language or localized text (pt-BR or en-US) is strictly prohibited in exception codes and messages.
  - Frontend controllers catch these specific exceptions and map their machine codes strictly to localized messages via AppLocalizations.

---

## 6. Security & OWASP Top 10 Compliance Policy

- **Mandatory OWASP Top 10 Standards Compliance**:
  - The entire codebase (Flutter Web frontend, Shelf backend, Supabase PostgreSQL schema, RLS policies, and Edge Functions) MUST strictly adhere to the OWASP Top 10 Security Standards at all times.
  - **A01 & A07 (Access Control & Authentication)**:
    - Row-Level Security (RLS) must strictly safeguard data. Mutations on administrative tables require authenticated author identity (auth.uid()).
    - Author secret tokens and cryptographic signatures must always be verified using timing-safe comparison (constantTimeEquals).
    - Client-side auth state (AuthController) must never mark sessions authenticated without backend validation (validateAuthorToken).
  - **A02 (Cryptographic Security)**:
    - Never use weak custom hashes or hardcoded default keys for security tokens.
    - Token generation (such as newsletter unsubscriptions, email verification) MUST use standard HMAC-SHA256 (package:crypto and Web Crypto API).
  - **A03 & A04 (Injection & Insecure Design)**:
    - Enforce character length limits and format validation on all incoming DTO fields and database schemas.
    - All dynamic parameters rendered in transactional and broadcast HTML emails must be properly escaped (htmlEscape).
    - Public mutating endpoints MUST be protected with sliding-window rate limiting.
    - Contact transmission endpoints must never mirror unsolicited emails (prohibited: open relay CC).
  - **A05 (Security Misconfiguration)**:
    - Production hosting (_headers) must include strict modern headers: Strict-Transport-Security (HSTS), Content-Security-Policy (CSP), Permissions-Policy, X-Frame-Options: DENY, X-Content-Type-Options: nosniff.
    - Internal exceptions, raw stack traces, and database errors must NEVER be returned in production HTTP responses.
    - Sensitive keys and author tokens must never be logged to terminal stdout or console logs.
  - **A10 (Server-Side Request Forgery & Traversal)**:
    - Static file handlers must prohibit outside directory traversal (serveFilesOutsidePath: false).
    - Remote content fetching must strictly prohibit loopbacks (127.0.0.1, localhost), link-local metadata (169.254.169.254), and private IP ranges (10.x, 172.16.x, 192.168.x).

---

## 7. Supabase Management & Instructions Policy

- **Dashboard-First Instructions (Prohibited: Supabase CLI)**:
  - The user does not use the Supabase CLI. NEVER instruct the user to run supabase ... or npx supabase ... CLI commands.
  - Always provide clear, step-by-step instructions for managing database migrations, SQL scripts, Edge Functions, secrets, and settings directly through the Supabase web dashboard interface.
