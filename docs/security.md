# Security

## Defaults

- Do not expose secrets.
- Do not connect production data by default.
- Use project-scoped MCP.
- Use read-only DB access.
- Require approval for deploy, release, merge, destructive shell, and database writes.

## Sensitive Files

Deny reads for:

- `.env`
- `.env.*`
- `secrets/**`
- credential JSON
- private keys
- production dumps

## MCP Security

Risks:

- prompt injection from external content
- over-broad tool permissions
- accidental production data access
- token leakage
- unreviewed community MCP servers

Mitigation:

- install official servers where possible
- pin project scope
- use OAuth where possible
- enable read-only mode
- restrict feature groups/toolsets
- review tool calls
- keep credentials out of committed files

## Database Rules

Default:

```sql
select ... where tenant_id = ... limit ...
```

Avoid:

```sql
select * from sensitive_table;
update ...;
delete ...;
drop ...;
truncate ...;
```

Writes require explicit approval and a rollback plan.

