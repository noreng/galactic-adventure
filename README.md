# galactic-adventure

CAP (Cloud Application Programming Model) backend for the Galactic Spacefarer Adventure exercise.

## Run it

```
npm install
npx cds deploy --to sqlite:db/galactic.db
npx cds watch --port 4004
```

## Mock users

There's no real identity provider locally - the users are defined directly in
`package.json`, under `cds.requires.auth.users`:

| user  | password | role           | planet |
|-------|----------|----------------|--------|
| alice | alice    | GalacticAdmin  | EARTH  |
| bob   | bob      | GalacticViewer | EARTH  |
| zorg  | zorg     | GalacticAdmin  | XENON  |

## Try it in the browser

These are plain GET requests, so you can just open them in a browser tab -
it'll prompt for username/password (HTTP Basic):

- `http://localhost:4004/odata/v4/galactic/Spacefarers` with no login -> 401.
- Same URL logged in as `alice`/`alice` -> only the Earth spacefarers (Aria, Kip).
- Same URL logged in as `zorg`/`zorg` (use a private/incognito window, so the
  browser doesn't reuse alice's cached login) -> only the Xenon spacefarer (Nova).

Checking that `bob` (viewer) can't create/update/delete needs an actual
write request, which a browser address bar can't send - that one needs a
REST client (Postman, curl, ...).

## Docs per step

- CDS data modeling (v0.2): https://cap.cloud.sap/docs/guides/domain/
- CDS service definitions (v0.2/v0.3): https://cap.cloud.sap/docs/guides/services/
- Authorization, `@requires`/`@restrict` (v0.3): https://cap.cloud.sap/docs/guides/security/authorization
- Event handlers, `.before`/`.after` (v0.4): https://cap.cloud.sap/docs/node.js/core-services
- Draft support, `@odata.draft.enabled` (v0.6): https://cap.cloud.sap/docs/node.js/fiori
- UI5 Flexibility, `flexEnabled` (v0.6): https://ui5.sap.com/#/api/sap.ui.fl
